# oh-my-zsh settings
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="blinks"
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(brew bundler gem github git-flow heroku)

# zsh settings
source $ZSH/oh-my-zsh.sh
source ~/.localrc
export EDITOR="vim"
export PATH="/usr/local/bin:/bin:/usr/sbin:/usr/bin:/sbin:/usr/X11/bin:/usr/local/sbin"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/git/bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/Cellar/python/2.7.3/bin:/usr/local/share/python:$PATH"
export PATH="/Users/mratleph/.rbenv/bin:/Users/mratleph/.rbenv/shims:.bundle/binstubs:$PATH"
export NODE_PATH="/usr/local/lib/node_modules"

# tmuxinator settings
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# homebrew tab completion
fpath=($HOME/.zsh/func $fpath)
typeset -U fpath

# functions
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function theme {
  echo "What theme would you like active?"
  select opt in light dark exit
  do
    case $opt in
      light)
        osascript -e "tell application \"Terminal\" to set current settings of front window to settings set \"Solarized Light\""
        cp ~/Documents/Code/dotfiles/vim/theme/light ~/Documents/Code/dotfiles/vim/.vimrc
        cp ~/Documents/Code/dotfiles/irssi/theme/light ~/.irssi/miromiro.theme
        cp ~/Documents/Code/dotfiles/tmux/theme/light ~/Documents/Code/dotfiles/tmux/.tmux.conf
        tmux source-file ~/.tmux.conf
        cp ~/Documents/Code/dotfiles/zsh/theme/light ~/.oh-my-zsh/themes/blinks.zsh-theme
        exec $SHELL  
        break
        ;;
      dark)
        osascript -e "tell application \"Terminal\" to set current settings of front window to settings set \"Solarized Dark\""
        cp ~/Documents/Code/dotfiles/vim/theme/dark ~/Documents/Code/dotfiles/vim/.vimrc
        cp ~/Documents/Code/dotfiles/irssi/theme/dark ~/.irssi/miromiro.theme
        cp ~/Documents/Code/dotfiles/tmux/theme/dark ~/Documents/Code/dotfiles/tmux/.tmux.conf
        tmux source-file ~/.tmux.conf
        cp ~/Documents/Code/dotfiles/zsh/theme/dark ~/.oh-my-zsh/themes/blinks.zsh-theme
        exec $SHELL
        break
        ;;
      exit)
        break
        ;;
      *)
        echo "invalid option"
        ;;
    esac
  done
}

# aliases
alias tmuxs="mux start default" # start default tmuxinator tmux session
alias tmuxt="mux open default" # edit default tmuxinator tmus session

alias ~="cd ~" # go to home folder
alias code="cd ~/Documents/Code" # go to code folder
alias sites="cd ~/Sites" # go to sites folder

alias la="ls -A" # list all files and folders
alias c="clear" # clear the display
alias s="exec $SHELL" # reload shell

alias show="defaults write com.apple.Finder AppleShowAllFiles TRUE && killall Finder" # show all hidden files in Finder
alias hide="defaults write com.apple.Finder AppleShowAllFiles FALSE && killall Finder" # hide all hideen files in Finder

alias gitc="vim ~/.gitconfig" # edit git config in vim
alias giti="vim ~/.gitignore_global" # edit global git ignore in vim
alias vimc="vim ~/.vimrc" # edit vim config in vim
alias vimt="vim ~/.vim/colors/solarized.vim" # edit vim theme in vim
alias tmuxc="vim ~/.tmux.conf" # edit tmux config in vim
alias zshc="vim ~/.zshrc" # edit zsh config in vim
alias zsht="vim ~/.oh-my-zsh/themes/blinks.zsh-theme" # edit oh-my-zsh theme in vim
alias installc="vim ~/Documents/Code/private/dotfiles/install.sh" # edit install.sh script in vim

alias git="hub"
alias gi="git flow init" # initializes a directory as a Git repository using flow
alias gl="git log --decorate --graph" # show commit history of a branch
alias glo="git log --graph --pretty=format:'%C(yellow)%h%Creset -%Cred%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'" # show commit history of a branch on one line
alias gs="git status" # view the status of your files in the working directory and staging area
alias gd="git diff" # show diff of all staged or unstaged changes
alias gt="git tag -a" # tag a point in history as important
alias ga="git add ." # adds file contents to the staging area
alias grm="git rm" # remove files from the staging area
alias gc="git commit" # records a snapshot of the staging area
alias gca="git commit -a" # automatically stage all tracked, modified files before the commit
alias gu="git reset HEAD --" # unstage changes that you have staged
alias grh="git reset --hard" # restore back to HEAD commit
alias gb="git branch --all" # list your available branches
alias gbnm="git branch --no-merged" # list branches not merged into current branch
alias gbd="git branch -D" # delete a local branch
alias gco="git checkout" # switch to a branch
alias gff="git flow feature" # list your feature branch(es)
alias gfr="git flow release" # list your release branch(es)
alias gfh="git flow hotfix" # list your hotfix branch(es)
alias gfs="git flow support" # list your support branch(es)
alias gcl="git clone" # copy a git repository so you can add to it
alias gr="git remote -v" # list your remote aliases
alias gfo="git fetch origin" # download new branches and data from origin
alias gfu="git fetch upstream" # download new branches and data from upstream
alias gm="git merge --no-ff" # merge into current branch
alias gpl="git pull origin $(current_branch)" # pull current branch from remote
alias gps="git push origin $(current_branch)" # push your new data to remote
alias gpr="git pull-request" # open a pull request for the topic branch you just pushed
alias gbr="git browse" # open the Github link for the repo in your default browser

alias hc="heroku create --stack cedar" # create the app on the Cedar stack on Heroku
alias hp="heroku ps" # check the state of the app's processes on Heroku
alias hl="heroku logs" # review the Heroku logs for more information

alias markdown="markdown --html4tags" # run the markdown convertor with html4 style tags
alias lessc="lessc -x" # run the less convertor with the minify switch by default
