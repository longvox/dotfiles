#!/usr/bin/env bash
# Phase 65: DevOps (kubectl, Helm, Terraform, OpenTofu, AWS, Azure, gh)
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/../lib/env.sh"

info "Installing DevOps tools (kubectl, Helm, Terraform, OpenTofu, AWS CLI, Azure CLI, gh)..."

UBUNTU_CODENAME=$(lsb_release -cs 2>/dev/null || echo "")

# Only add repo when codename is supported (questing → HashiCorp/Azure/Helm have no Release)
SUPPORTED_CODENAMES="noble jammy mantic focal bookworm"
can_add_repo() {
  for c in $SUPPORTED_CODENAMES; do [[ "$UBUNTU_CODENAME" == "$c" ]] && return 0; done
  return 1
}

# Questing/unsupported: remove old repo files so apt update does not fail
if ! can_add_repo; then
  for f in /etc/apt/sources.list.d/hashicorp.list /etc/apt/sources.list.d/azure-cli.list /etc/apt/sources.list.d/helm-stable-debian.list; do
    [[ -f "$f" ]] && sudo rm -f "$f" && info "Removed unsupported repo: $f"
  done
fi

if ! [[ -f /etc/apt/sources.list.d/kubernetes.list ]] 2>/dev/null; then
  info "Adding Kubernetes apt repository..."
  curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
  echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list
fi
if can_add_repo && ! [[ -f /etc/apt/sources.list.d/helm-stable-debian.list ]] 2>/dev/null; then
  info "Adding Helm apt repository..."
  curl -fsSL https://baltocdn.com/helm/signing.asc 2>/dev/null | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg >/dev/null && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list || \
  silly "Helm repo skipped (baltocdn unreachable or unsupported)."
fi
if can_add_repo && ! [[ -f /etc/apt/sources.list.d/hashicorp.list ]] 2>/dev/null; then
  info "Adding HashiCorp apt repository..."
  wget -qO- https://apt.releases.hashicorp.com/gpg 2>/dev/null | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg >/dev/null
  echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
fi
if ! [[ -f /etc/apt/sources.list.d/opentofu.list ]] 2>/dev/null; then
  info "Adding OpenTofu apt repository..."
  sudo install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://get.opentofu.org/opentofu.gpg | sudo tee /etc/apt/keyrings/opentofu.gpg >/dev/null
  curl -fsSL https://packages.opentofu.org/opentofu/tofu/gpgkey | gpg -q --no-tty --batch --dearmor | sudo tee /etc/apt/keyrings/opentofu-repo.gpg >/dev/null
  sudo chmod a+r /etc/apt/keyrings/opentofu.gpg /etc/apt/keyrings/opentofu-repo.gpg
  echo "deb [signed-by=/etc/apt/keyrings/opentofu.gpg,/etc/apt/keyrings/opentofu-repo.gpg] https://packages.opentofu.org/opentofu/tofu/any/ any main" | sudo tee /etc/apt/sources.list.d/opentofu.list >/dev/null
fi
if can_add_repo && ! [[ -f /etc/apt/sources.list.d/azure-cli.list ]] 2>/dev/null; then
  info "Adding Azure CLI apt repository..."
  curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg >/dev/null
  echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/azure-cli.list
fi

sudo apt-get update -y 2>/dev/null || true
tryInstall install kubectl gh awscli
# Only install helm/terraform/azure-cli when repo was added (supported codename), avoid "Unable to locate package"
if can_add_repo; then
  tryInstall install helm || true
  tryInstall install terraform || true
  tryInstall install azure-cli || true
else
  silly "helm/terraform/azure-cli skipped ($UBUNTU_CODENAME has no repo; install manually or use tofu instead of terraform)."
fi
tryInstall install tofu || true
info "DevOps tools install done."
