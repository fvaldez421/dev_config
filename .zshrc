# shell commands
alias cl="clear"
alias config="vi $HOME/.zshrc"
alias reload="source $HOME/.zshrc"


# runtimes
alias python="python3"
alias py="python"
alias pip="pip3"
alias ns="npm run start"

# Git aliases
alias gi="git init"
alias gs="git status -sbu"
alias ck="git checkout"
alias gb="git branch"
alias push="git push"
alias pull="git pull"
alias ga="git add"
alias cm="git commit -m"
alias stash="git stash"
alias glog='git log --graph --oneline --decorate --all'

# begin git prompt
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' stagedstr 'M' 
zstyle ':vcs_info:*' unstagedstr 'M' 
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats '%F{5}[%F{46}%b%F{3}|%F{196}%a%F{5}]'
# branch
zstyle ':vcs_info:*' formats '%F{46}(%b) %F{46}%c%F{3}%u%f'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:*' enable git 
+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
  [[ $(git ls-files --other --directory --exclude-standard | sed q | wc -l | tr -d ' ') == 1 ]] ; then
  # unstaged settings
  hook_com[unstaged]+='%F{196} ??'
fi
}


precmd () { vcs_info }
# PROMPT='%F{5}[%F{2}%n%F{5}] %F{3}%3~ ${vcs_info_msg_0_} %f'

PROMPT='%F{164}%B%n %F{226}%~ %b%F{green}${vcs_info_msg_0_}%f >> '

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/frankvaldez/DevUtils/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/frankvaldez/DevUtils/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/frankvaldez/DevUtils/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/frankvaldez/DevUtils/google-cloud-sdk/completion.zsh.inc'; fi
