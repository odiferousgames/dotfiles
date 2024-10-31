# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "$ZINIT_HOME/zinit.zsh"

# Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
# zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode

# Aliases
alias ls='eza --color=always --all --icons=always'
alias ll='eza --color=always --all --icons=always --long --git'
alias cd='z'
# alias fd='fdfind'
# alias bat='batcat'

# Completions
autoload -U compinit && compinit
zinit cdreplay -q

# Auto-suggestions
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# FZF
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_ALT_C_COMMAND="--preview 'eza --tree --color=always {} | head -200'"
_fzf_compgen_path() {
	fd --hidden --exclude .git . "$1"
}
_fzf_compgen_dir() {
	fd --type=d --hidden --exclude .git . "$1"
}
_fzf_comprun() {
	local command=$1
	shift
	case "$command" in
		cd)             fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
		export|unset)	fzf --preview "eval 'echo \$' {}" "$@" ;;
		ssh)		    fzf --preview 'dig {}' "$@" ;;
		*)		        fzf --preview "$show_file_or_dir_preview" "$@" ;;
	esac
}

# Bat
export BAT_THEME='Catppuccin Mocha'

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Keyboard Mapping
setxkbmap -option caps:ctrl_modifier
xcape -e 'Caps_Lock=Escape'
xmodmap -e "keycode 34 = bracketleft egrave bracketleft egrave udiaeresis dead_abovering udiaeresis"
xmodmap -e "keycode 35 = bracketright exclam bracketright exclam dead_diaeresis dead_macron dead_diaeresis dead_macron bracketright exclam dead_diaeresis dead_macron"
xmodmap -e "keycode 48 = braceleft agrave braceleft agrave adiaeresis dead_caron adiaeresis dead_caron braceleft agrave adiaeresis dead_caron"
xmodmap -e "keycode 51 = braceright dollar braceright dollar dead_tilde dead_breve dead_tilde dead_breve braceright dollar dead_tilde dead_breve"
xmodmap -e "keycode 49 = at degree at degree notsign notsign notsign notsign at degree notsign notsign"

# Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
