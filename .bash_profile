# Augustus Yuan
# Useful bash profile commands to optimize your workflow

# Run Insecure Chrome
alias insecure_chrome='open -a Google\ Chrome --args --disable-web-security'

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# Pretty git log
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# pretty git log tree graph
alias glola="git log --graph --decorate --pretty=oneline --abbrev-commit --all"

# Visualize git log full history including branch merges
alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'

# Visualizes your entire git log and history including stashes and branches and dangling commits
# Warning this takes a while depending on your history
alias extreme-gl='git log --graph --oneline --decorate --all $( git fsck --no-reflog | awk "/dangling commit/ {print $3}" )'

# git status
alias gs='git status'

# git stash list
alias gsl='git stash list'

# git rebase against origin/master
alias grom="git rebase origin/master"

# git stash apply. must append stash@{num}
alias gsa="git stash apply"

# git list number of commits in order based on author
alias git-total="git shortlog -s -n --all"

alias git-fame="git shortlog -sne --all"

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

# Open Profile in Sublime Text
alias bash-profile='open -a Sublime\ Text.app ~/.bash_profile'

# Reload Profile
alias bash-reload='source ~/.bash_profile'

# Open gitconfig 
alias git-config='open -a Sublime\ Text.app ~/.gitconfig'

# Open in Sublime
alias sublime='open -a Sublime\ Text.app'

# JSON pretty print
alias json="python -mjson.tool"

# Find a string in git history
alias git-search='git rev-list --all | xargs git grep -F'

# Find a command you just did
# To redo a command in the past, do !123 where 123 is the number next to the command shown in history
alias hs='history | grep --color=auto'

# Show and hide hidden files
alias show-files='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hide-files='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

