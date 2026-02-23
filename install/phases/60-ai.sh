#!/usr/bin/env bash
# Phase 60: AI/LLM stack (pipx, Ollama, Hugging Face, Jupyter)
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/../lib/env.sh"

info "Installing AI/LLM base (pipx, Ollama, Hugging Face, Jupyter)..."
tryInstall install pipx || true
[[ -n "$(command -v pipx 2>/dev/null)" ]] && pipx ensurepath 2>/dev/null || true

if command_exists ollama; then
    silly "Ollama already installed!"
else
    info "Installing Ollama..."
    curl -fsSL https://ollama.com/install.sh | sh
fi

if command_exists huggingface-cli; then
    silly "huggingface-cli already installed!"
else
    info "Installing Hugging Face CLI..."
    pip3 install --user "huggingface_hub[cli]" 2>/dev/null || pipx install "huggingface_hub[cli]" 2>/dev/null || true
fi

# PEP 668: use pipx (install only when missing, avoid re-running every time)
if command -v pipx &>/dev/null; then
  pipx list 2>/dev/null | grep -q "jupyter" || pipx install jupyter 2>/dev/null || true
  pipx list 2>/dev/null | grep -q "ipython" || pipx install ipython 2>/dev/null || true
  pipx list 2>/dev/null | grep -q "termdown" || pipx install termdown 2>/dev/null || true
else
  tryInstall installPip jupyter ipython || true
  tryInstall installPip termdown || true
fi
info "AI/LLM base install done."
