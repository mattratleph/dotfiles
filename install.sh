#!/bin/sh

echo "What would you like to install?"
select opt in homebrew brews prezto dotfiles bundles ruby gems code sites hooks manual exit
do
  case $opt in
    homebrew)
      ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
      exec $SHELL
      ;;
    brews)
      brew update
      brew install chruby dfu-programmer git gnupg hub imagesnap libyaml nmap readline ruby-install ssh-copy-id tor wget
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
      mkdir -p ~/Documents/Code & cd ~/Documents/Code
      git clone git@github.com:mattratleph/dotfiles.git
      cd ~
      rm .gitignore_global .vimrc
      rm -r .vim
      mkdir .vim
      ln -s ~/Documents/Code/dotfiles/git/.gitignore_global .gitignore_global
      ln -s ~/Documents/Code/dotfiles/ruby/.gemrc .gemrc
      ln -s ~/Documents/Code/dotfiles/ruby/.ruby-version .ruby-version
      ln -s ~/Documents/Code/dotfiles/vim/autoload .vim/autoload
      ln -s ~/Documents/Code/dotfiles/vim/syntax .vim/syntax
      ln -s ~/Documents/Code/dotfiles/vim/.vimrc .vimrc
      exec $SHELL
      ;;
    bundles)
      mkdir -p ~/.vim/bundle & cd ~/.vim/bundle
      git clone https://github.com/scrooloose/syntastic.git
      git clone https://github.com/bling/vim-airline.git
      git clone https://github.com/bling/vim-bufferline.git
      git clone https://github.com/tpope/vim-bundler.git
      git clone https://github.com/kchmck/vim-coffee-script.git
      git clone https://github.com/altercation/vim-colors-solarized.git
      git clone https://github.com/tpope/vim-commentary.git
      git clone https://github.com/tpope/vim-dispatch.git
      git clone https://github.com/tpope/vim-fugitive.git
      git clone https://github.com/tpope/vim-haml.git
      git clone https://github.com/tpope/vim-heroku.git
      git clone https://github.com/groenewege/vim-less.git
      git clone https://github.com/tpope/vim-markdown.git
      git clone https://github.com/mustache/vim-mustache-handlebars.git
      git clone https://github.com/jeffkreeftmeijer/vim-numbertoggle.git
      git clone https://github.com/tpope/vim-pathogen.git
      git clone https://github.com/tpope/vim-rails.git
      git clone https://github.com/tpope/vim-rhubarb.git
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
      gem install rails sass
      exec $SHELL
      ;;
    code)
      mkdir -p ~/Documents/Code & cd ~/Documents/Code
      git clone git@github.com:mattratleph/tongues.git
      git clone ssh://seien@mratleph.no-ip.info/home/seien/Documents/Code/private.git
      cd ~
      rm .gitconfig .localrc .netrc
      ln -s ~/Documents/Code/private/.gitconfig .gitconfig
      ln -s ~/Documents/Code/private/.localrc .localrc
      ln -s ~/Documents/Code/private/.netrc .netrc
      exec $SHELL
      ;;
    sites)
      mkdir ~/Sites & cd ~/Sites
      git clone git@github.com:mattratleph/fullrangefighting.com.git
      git clone git@github.com:mattratleph/mattratleph.github.com.git
      git clone git@github.com:mattratleph/umberlas.com.git
      ;;
    hooks)
      mkdir ~/.gitshots
      cp ~/Documents/Code/dotfiles/git/post-commit ~/Documents/Code/dotfiles/.git/hooks/
      cp ~/Documents/Code/dotfiles/git/post-commit ~/Documents/Code/private/.git/hooks/
      cp ~/Documents/Code/dotfiles/git/post-commit ~/Sites/fullrangefighting.com/.git/hooks/
      cp ~/Documents/Code/dotfiles/git/post-commit ~/Sites/mattratleph.github.com/.git/hooks/
      cp ~/Documents/Code/dotfiles/git/post-commit ~/Sites/umberlas.com/.git/hooks/
      ;;
    manual)
      echo "VirtualBox: https://www.virtualbox.org/wiki/Downloads \n"
      echo "IE VMs: http://modern.ie/en-us/virtualization-tools \n"
      echo "Vagrant: http://www.vagrantup.com/downloads.html \n"
      echo "Heroku: https://www.heroku.com/ \n"
      echo "Xcode: https://developer.apple.com/xcode/ \n"
      echo "Android SDK: http://developer.android.com/tools/"
      ;;
    exit)
      break
      ;;
    *)
      echo "invalid option"
      ;;
  esac
done