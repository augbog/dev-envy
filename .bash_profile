# Augustus Yuan
# Useful bash profile commands to optimize your workflow

export PATH=/bin:/usr/bin:/usr/local/bin

# make vim the default editor not vi
export EDITOR=vim

# Change ls colors for directory, files, etc
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

# path where all your repos live
export REPO="$HOME/repos/"

# Set GIT_EDITOR to be vim (this has been aliased to be MacVim below)
export GIT_EDITOR="/Applications/MacVim.app/Contents/MacOS/Vim -f"
export CODE_EDITOR="subl"

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'
# default grep to ggrep
alias grep="ggrep $GREP_OPTIONS"
# unset GREP_OPTIONS because deprecated to ggrep
unset GREP_OPTIONS

# Color Variables
# Usage: echo "${red}red text ${green}green text${reset}"
#
# setaf: foreground
# setab: background

black=`tput setaf 0`
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
magenta=`tput setaf 5`
cyan=`tput setaf 6`
white=`tput setaf 7`
reset=`tput sgr0`

# if git autocompletion script exists then run
# See: https://git-scm.com/book/en/v2/Git-in-Other-Environments-Git-in-Bash
test -f ~/.git-completion.bash && . $_

# if nvm exists, run nvm
test -f ~/.nvm/nvm.sh && source ~/.nvm/nvm.sh

# git branch in prompt
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Pretty git log
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# pretty git log tree graph
alias glola="git log --graph --decorate --pretty=oneline --abbrev-commit --all"

# Visualize git log full history including branch merges
alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'

# Visualizes your entire git log and history including stashes and branches and dangling commits
# Warning this takes a while depending on your history
alias extreme-gl='git log --graph --oneline --decorate --all $( git fsck --no-reflog | awk "/dangling commit/ {print $3}" )'

# update master
upm() {
  branch_name="$(git symbolic-ref --short -q HEAD)"
  if [ $branch_name != "master" ]
  then
    git stash && git checkout master && git fetch && git rebase origin/master && git checkout $branch_name && git stash apply
  else
    git fetch && git rebase origin/master
  fi
}

# git status
alias gs='git status'

# git diff based on characters
# http://stackoverflow.com/questions/3231759/how-can-i-visualize-per-character-differences-in-a-unified-diff-file/25634420#25634420
alias gd="git diff --color-words='[^[:space:]]|([[:alnum:]]|UTF_8_GUARD)+'"

# git diff highlight
# Note: requires cloning git repo under ~/git
gdh() {
  if [ -z "$1" ]
  then
    git diff --color=always | ~/git/contrib/diff-highlight/diff-highlight
  else
    git diff --color=always "$1" | ~/git/contrib/diff-highlight/diff-highlight
  fi
}

# git branch
alias gb='git branch'

# create branch
alias gcb='git checkout -b'

alias gcp='git cherry-pick'

# git stash list
alias gsl='git stash list'

alias grom="git fetch && git rebase origin/master"

# git stash apply. must append stash@{num}
alias gsa="git stash apply"

# Find a string in git history
alias ghs='git rev-list --all | xargs git grep -F'

# based on .mailmap, show total commits
alias git-fame="git shortlog -sne --all"

# Git branch diff
# git show diff in commits between specific branch and master
# if no parameter specified, uses current branch
gbd() {
  if [ -z "$1" ]
  then
    branch_name="$(git symbolic-ref --short -q HEAD)"
    git log --oneline master..$branch_name
  else
    git log --oneline master..$1
  fi
}

# git reset soft/hard
alias grh="git reset --hard"
alias grs="git reset --soft"

# list all files changed in specific commit. must append specific commit.
alias commit-files="git diff-tree --no-commit-id --namestatus -r"

# unapply stash that was just applied
alias unapply-stash='git stash show -p stash@{0} | git apply -R'

# cd to path and immediately ls
cdls() { cd "$@" && ls; }

# get rid of command not found
alias cd..='cd ..'

# a quick way to get out of current directory
alias ..='cd ..'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias .7='cd ../../../../../../../'
alias .8='cd ../../../../../../../../'

alias repo="cd $REPO"

# open bash profile
alias bash-profile="$CODE_EDITOR ~/.bash_profile"

# Reload Profile
alias bash-reload='source ~/.bash_profile'

# JSON pretty print
alias json="python -mjson.tool"

# Find a command you just did
# To redo a command in the past, do !123 where 123 is the number next to the command shown in history
alias hs='history | grep --color=auto'

# ls hidden dot files only
alias ls.="ls -A | egrep '^\.'"

# Run Insecure Chrome
alias insecure_chrome='open -a Google\ Chrome --args --disable-web-security'

# Show and hide hidden files
alias show-files='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hide-files='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# restart wifi
# Please note this may depend on your Mac device see more about ifconfig
# http://superuser.com/questions/267660/can-someone-please-explain-ifconfig-output-in-mac-os-x
alias restart-wifi='sudo ifconfig en0 down && sudo ifconfig en0 up'
