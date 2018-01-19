#!/bin/bash

# Ruby setup
func ()
{
	if [ "$EUID" -eq 0 ]; then 
		echo "do not run as root"
  		exit
	fi

	#dependancies
	if [ -f "/usr/bin/apt" ]; then
  		platform="ubuntu"
	fi
	if [ -f "/usr/bin/dnf" ]; then
  		platform="fedora"
	fi

	if [ -f "/usr/bin/eopkg" ]; then
  		platform="solus"
	fi

	case "$platform" in
	"fedora")
		echo "fedora not setup" 
		;;
	"ubuntu")
		echo "run ubuntu stuff" 
		sudo apt-get install -y libreadline-dev
		#sudo apt install -y rbenv ruby-sass

		;;
	"solus")
		echo "solus not setup" 
		#sudo eopkg install -y curl containerd runc dnsmasq btrfs-progs
		;;
	esac

	if [ -d "$HOME/.rbenv" ]; then 
		echo "rbenv found"
		local CURRENTDIR=`pwd`
		cd ~/.rbenv &&  echo `pwd` && git pull
		cd ~/.rbenv/plugins/ruby-build &&  echo `pwd` && git pull
		cd $CURRENTDIR
	else
		echo "rbenv not found -- pulling "
		git clone git@github.com:rbenv/rbenv.git ~/.rbenv
		cd ~/.rbenv && src/configure && make -C src
		mkdir -p ~/.rbenv/shims
		mkdir -p ~/.rbenv/plugins
		~/.rbenv/bin/rbenv init
		curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
		rbenv init -
		git clone git@github.com:rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
	fi
}
func