#!/bin/bash
# vscode
func ()
{
local SCRIPTUSER=${SUDO_USER}

if test "$SCRIPTUSER" = "" || test "$SCRIPTUSER" = "root"; then
    	 SCRIPTUSER=${USER}
    fi

# todo add a check for version
#sudo eopkg rm vscode

cd /home/${SCRIPTUSER}/Downloads/

VSCODEVER=code-stable-code_1.24.1-1528912196_amd64.tar.gz

# Download the sources if file does not exist
if [ ! -f /home/${SCRIPTUSER}/Downloads/${VSCODEVER} ]; then
    sudo wget https://az764295.vo.msecnd.net/stable/24f62626b222e9a8313213fb64b10d741a326288/code-stable-code_1.24.1-1528912196_amd64.tar.gz
fi

sudo tar -xvf ${VSCODEVER}

# make sure the go folder is created
sudo mkdir -p /opt/code

# Install to /usr/local/bin
sudo rsync -av VSCode-linux-x64/ /opt/code

VSCODESHORTCUT="[Desktop Entry]
Name=Visual Studio Code.
Comment=Code Editing. Redefined.
GenericName=Text Editor
Exec=/opt/code/code %U
Icon=code
Type=Application
StartupNotify=true
StartupWMClass=Code
Categories=Utility;TextEditor;Development;IDE;
MimeType=text/plain;
Actions=new-window;
Keywords=vscode;"

sudo touch /usr/share/applications/code.desktop
sudo chown ${SCRIPTUSER} /usr/share/applications/code.desktop
sudo echo "${VSCODESHORTCUT}" > /usr/share/applications/code.desktop

sudo rm -rf vscode*
sudo rm -rf VSCode*
sudo rm -rf code-stable*
}
func


