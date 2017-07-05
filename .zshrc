# zplug install;
# curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

[[ "$TERM" == "xterm" ]] && export TERM=xterm-256color

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"

zplug "plugins/git", from:oh-my-zsh
zplug "themes/fishy", from:oh-my-zsh

zplug load

# environment
export EDITOR=vim
export VISUAL=vim
export BROWSER=firefox

# keys
# use cat to get the secret codez
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# colours
alias ls='ls -F --show-control-chars --color=always'
alias la='ls -aF --show-control-chars --color=always'
alias ll='ls -lF --show-control-chars --color=always'
zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'

# history
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# deer
autoload -U deer
zle -N deer
bindkey '\ek' deer

# prompt
# example; print -P '%B%K{blue}%F{white}test%f%b%k'

# theme overrides
local user_color='cyan'; [ $UID -eq 0 ] && user_color='red'
PROMPT='%{$fg[$user_color]%}$(_fishy_collapsed_wd)%{$reset_color%}$(git_prompt_info)$(git_prompt_status)%{$reset_color%}%{$fg[$user_color]%}%(!.#.➤) '
RPROMPT=''

ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔"
