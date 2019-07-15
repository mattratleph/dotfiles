#!/bin/sh

echo "What would you like to install?"
select opt in homebrew brews prezto dotfiles vim ruby gems sites manual exit
do
  case $opt in
    homebrew)
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      exec $SHELL
      ;;
    brews)
      brew update
      brew bundle
      exec $SHELL
      ;;
    prezto)
      zsh
      git clone --recursive https://github.com/mattratleph/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
      setopt EXTENDED_GLOB
      for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
        ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
      done
      chsh -s /bin/zsh
      exec $SHELL
      ;;
    dotfiles)
      mkdir -p ~/Code
      cd ~/Code
      git clone git@github.com:mattratleph/dotfiles.git
      cd ~
      rm .gitconfig .gitignore_global .vimrc
      rm -r .vim
      mkdir .vim
      ln -s ~/Code/dotfiles/git/.gitconfig .gitconfig
      ln -s ~/Code/dotfiles/git/.gitignore_global .gitignore_global
      ln -s ~/Code/dotfiles/ruby/.gemrc .gemrc
      ln -s ~/Code/dotfiles/vim/syntax .vim/syntax
      ln -s ~/Code/dotfiles/vim/.vimrc .vimrc
      cd .vim
      mkdir backups
      mkdir swaps
      mkdir undo
      exec $SHELL
      ;;
    vim)
      mkdir -p ~/.vim/bundle
      cd ~/.vim/bundle
      git clone https://github.com/scrooloose/syntastic.git
      git clone https://github.com/bling/vim-airline.git
      git clone https://github.com/vim-airline/vim-airline-themes.git
      git clone https://github.com/bling/vim-bufferline.git
      git clone https://github.com/tpope/vim-bundler.git
      git clone https://github.com/kchmck/vim-coffee-script.git
      git clone https://github.com/altercation/vim-colors-solarized.git
      git clone https://github.com/tpope/vim-commentary.git
      git clone https://github.com/tpope/vim-dispatch.git
      git clone https://github.com/tpope/vim-fugitive.git
      git clone https://github.com/tpope/vim-haml.git
      git clone https://github.com/tpope/vim-heroku.git
      git clone https://github.com/tpope/vim-markdown.git
      git clone https://github.com/tpope/vim-pathogen.git
      git clone https://github.com/tpope/vim-rails.git
      git clone https://github.com/tpope/vim-rhubarb.git
      git clone https://github.com/tpope/vim-surround.git
      git clone https://github.com/tpope/vim-vinegar.git
      exec $SHELL
      ;;
    ruby)
      ruby-install ruby
      chruby > ~/.ruby-version
      exec $SHELL
      ;;
    gems)
      gem update --system
      gem update
      gem install rails
      exec $SHELL
      ;;
    sites)
      mkdir -p ~/Sites
      cd ~/Sites
      git clone git@github.com:mattratleph/fullrangefighting.com.git
      git clone git@github.com:mattratleph/laurentherese.com.git
      git clone git@github.com:mattratleph/mattratleph.github.com.git
      git clone git@github.com:mattratleph/umberlas.com.git
      ;;
    manual)
      echo "IE VMs: https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/ \n"
      ;;
    exit)
      break
      ;;
    *)
      echo "invalid option"
      ;;
  esac
done
