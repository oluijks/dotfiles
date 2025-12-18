# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/oluijks/.zsh/completions:"* ]]; then export FPATH="/home/oluijks/.zsh/completions:$FPATH"; fi
# ~/.zshrc

[[ -o interactive ]] || return

if [[ -n "${ZSHRC_LOADED-}" ]]; then
  if [[ "$ZSHRC_LOADED" -eq $$ ]]; then
    return
  fi
fi
export ZSHRC_LOADED=$$

export EDITOR="nvim"
export FONTCONFIG_FILE="/etc/fonts/fonts.conf"

case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) export PATH="$HOME/.local/bin:$PATH" ;;
esac

case ":$PATH:" in
  *":$HOME/.config/emacs/bin:"*) ;;
  *) export PATH="$HOME/.config/emacs/bin:$PATH" ;;
esac

export ZSH="$HOME/.oh-my-zsh"

if [[ ":$FPATH:" != *":$HOME/.zsh/completions:"* ]]; then
  export FPATH="$HOME/.zsh/completions:$FPATH"
fi

plugins=(
  git
  sudo
  web-search
  archlinux
  zsh-autosuggestions
  zsh-syntax-highlighting
  fast-syntax-highlighting
  copyfile
  copybuffer
  dirhistory
)

if [[ -f "$ZSH/oh-my-zsh.sh" ]]; then
  source "$ZSH/oh-my-zsh.sh"
fi

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt appendhistory
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

alias v="$EDITOR"
alias vim="$EDITOR"

alias p="pnpm"
alias x="exit"
alias u="upgrade"
alias rm="trash-put"
alias c="checkupdates"
alias orphans='pacman -Qdt'
alias orphansq='pacman -Qdtq'
alias reload="source ~/.zshrc"

if command -v eza >/dev/null 2>&1; then
  alias ls="eza -a --icons=always"
  alias ll="eza -al --icons=always"
  alias lt="eza -a --tree --level=1 --icons=always"
fi

if command -v fzf >/dev/null 2>&1 && command -v nvim >/dev/null 2>&1; then
  alias inv='nvim $(fzf -m --preview="bat --color=always {}")'
fi

export NVM_DIR="$HOME/.nvm"
if [[ -s "$NVM_DIR/nvm.sh" ]]; then
  . "$NVM_DIR/nvm.sh"
fi
if [[ -s "$NVM_DIR/bash_completion" ]]; then
  . "$NVM_DIR/bash_completion"
fi

export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

if [[ -f "$HOME/.cargo/env" ]]; then
  . "$HOME/.cargo/env"
fi

if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh --cmd cd)"
fi

otp() { pass otp -c "$1"; }

if command -v fastfetch >/dev/null 2>&1 && \
   [[ -t 1 ]] && \
   { [[ -z "${VSCODE_PID-}" ]] && [[ "${TERM_PROGRAM-}" != "vscode" ]]; }; then
  fastfetch --config examples/13
fi

# vim: ts=2 sw=2 sts=2 et



# bun completions
[ -s "/home/oluijks/.bun/_bun" ] && source "/home/oluijks/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
. "/home/oluijks/.deno/env"
## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/oluijks/.dart-cli-completion/zsh-config.zsh ]] && . /home/oluijks/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]


. "$HOME/.turso/env"
export GPG_TTY=$(tty)
