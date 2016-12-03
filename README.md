# My Development Installation setups

#### Primary Development Workstation(s) are Linux based
##### OS being used [Solus Linux](https://solus-project.com/)

##### Setup Steps (my preferred way to install is via the install scripts, but included the repo command if it exist)

* subo eopkg upgrade -y
* reboot

* Install softwrae from Software Center (third party)
  * Chrome 
  * Opera 
  * Slack
  * Sublime

* Dropbox
  * sudo eopkg it -y nautilus-dropbox
  
* Libs needed
  * sudo eopkg it -y diffutils
  * sudo eopkg it -y -c system.devel 
  * sudo eopkg it -y cryptopp-devel qt4-devel libtool sqlite3-devel c-ares-devel python-gtk2-devel nautilus-devel wxPython netcat cabextract icoutils p7zip imagemagick mesalib-32bit
  * sudo eopkg it -y gcc make autoconf binutils kernel-headers xorg-server-devel
  * sudo eopkg it -y curl-devel expat-devel gettext-devel openssl-devel zlib-devel
  * sudo eopkg it -y gcc perl-ExtUtils-MakeMaker
  
* Rsync (used for script installs and some backups)
  * sudo eopkg it -y rsync
  
* Tweak-Tools
  * sudo eopkg it -y gnome-tweak-tool
    * Windows Scale to 2
    * Workspace 1
* Go
  * sudo eopkg it -y golang
  * Use linux script in repo
  
* Git
  * sudo eopkg it -y git
  * Use linux script in repo
  
* Syncthing
  * sudo eopkg it -y syncthing
  * Use linux script in repo
  

* VSCode
  * sudo eopkg it -y vscode
  * Use linux script in repo

* Atom
  * sudo eopkg it -y atom

* Vim
  * sudo eopkg it -y vim

* Docker
  * sudo eopkg it -y docker
  * Use linux script in repo
  
* Postgres
  * sudo eopkg it -y postgresql
  
* Plank
  * sudo eopkg it -y plank
  
* Fonts
  * sudo eopkg it -y source-code-pro
  
* Budgie Applets
  * sudo eopkg it -y budgie-screenshot-applet
  
* Remote Setup
  * sudo eopkg it -y remmina

VirtualBox
https://wiki.solus-project.com/VirtualBox


Install themes for chrome and plank
https://github.com/horst3180/arc-theme


