#!/bin/bash

# $1 - platform zipped file
# $2 - operating system
# $3 - method

#====================================================
#     "download" FUNCTION
#====================================================
download() {
    echo ""
    echo "Downloading the ROOT code from https://root.cern/download/$1..."
    echo "This may take a few minutes!"
    echo ""
    if ! curl https://root.cern/download/$1 -o "$1" ; then
        echo "Failed to download the zip file!"
        exit
    fi
}

#====================================================
#     "unpacker" FUNCTION
#====================================================
unpacker() {
    tar -xvf "${1::-3}"
    rm root*tar*
    mv root* "${1::-7}"
    if [ -d "$HOME/${1::-7}" ] ; then
        rm -rf "$HOME/${1::-7}"
    fi
    mv "${1::-7}" "$HOME"
}

#====================================================
#     "bash_writer" FUNCTION
#====================================================
bash_writer() {
    if ! grep -q "$HOME/${1::-7}$2/bin/thisroot.sh" "$HOME/.bashrc" ; then
        echo "" >> "$HOME/.bashrc"
        echo "source $HOME/${1::-7}$2/bin/thisroot.sh" >> "$HOME/.bashrc"
        source "$HOME/.bashrc"
    fi
}

#====================================================
#     "eofer" FUNCTION
#====================================================
eofer() {
    source "$HOME/.bashrc"
    root << EOF
    .q
EOF
}

#====================================================
#     DOWNLOADING THE FILE
#====================================================  
if [ -f "$1" ] ; then
    echo ""
    echo "The $1 file is already present in this directory!"
elif [ -f "${1::-3}" ] ; then
    echo ""
    echo "The $1 file has been already downloaded and gunzipped!"
elif [ -d "${1::-7}" ] ; then
    echo ""
    echo "The $1 file has been already downloaded, gunzipped and upacked!"
elif [ -d "$HOME/${1::-7}" ] ; then
    echo ""
    echo "The $1 file has been already downloaded, gunzipped, upacked and moved in the $HOME directory!"
elif [ "$1" == "package-manager" ] || [ "$1" == "package_manager" ] ; then
    :
else
    if [ "$(ls -1 root*tar* 2>/dev/null | wc -l )" -gt 0 ] ; then
        echo ""
        echo "Other ROOT zip files are already present in this directory. They will be deleted!"
        rm -rf root*tar*
        download "$1"
    else
        download "$1"
    fi
fi

#====================================================
#     UNZIPPING THE FILE
#====================================================
if [ -d "$HOME/${1::-7}" ] ; then
    :
elif [ -d "${1::-7}" ] ; then
    mv "${1::-7}" "$HOME"
elif [ -f "${1::-3}" ] ; then
    echo ""
    echo "Upacking the file:"
    echo ""
    unpacker "$1"
elif [ -f "$1" ] ; then
    echo ""
    echo "Unzipping and upacking the file:"
    echo ""
    gunzip "$1"
    unpacker "$1"
else
    :
fi
echo ""

#====================================================
#     INSTALLATION FOR UBUNTU AND WSL
#====================================================
if [ "$2" == "Ubuntu" ] || [ "$2" == "ubuntu" ] || [ "$2" == "WSL" ] || [ "$2" == "wsl" ] ; then
    echo "Installing prerequisites:"
    echo ""
    echo "System upgrade and update..."
    echo ""
    sudo apt-get upgrade
    sudo apt-get update
    echo ""
    echo "Mandatory packages..."
    echo ""
    if ! sudo apt-get install git dpkg-dev cmake g++ gcc binutils libx11-dev libxpm-dev libxft-dev libxext-dev ; then
        echo "Unable to install all the mandatory packages!"
        exit
    fi
    echo ""
    echo "Optional packages..."
    echo "If some of them will not be installed correctly don't worry!"
    echo ""
    sudo apt-get install gfortran libssl-dev libpcre3-dev xlibmesa-glu-dev libglew1.5-dev libftgl-dev libmysqlclient-dev libfftw3-dev libcfitsio-dev graphviz-dev libavahi-compat-libdnssd-dev libldap2-dev python-dev libxml2-dev libkrb5-dev libgsl0-dev
    if [ "$2" == "WSL" ] || [ "$2" == "wsl" ] ; then
        echo ""
        echo "Graphical packages for WSL..."
        echo ""
        sudo apt-get install x11-apps
        if ! sudo apt-get install libtiff5 ; then
            sudo apt-get install libncurses5
        fi
        if ! grep -q "(/sbin/ip" "$HOME/.bashrc" && ! grep -q "route" "$HOME/.bashrc" && 
           ! grep -q "awk" "$HOME/.bashrc" && ! grep -q "/default/" "$HOME/.bashrc" && 
           ! grep -q "}'):0" "$HOME/.bashrc" ; then
            echo "" >> "$HOME/.bashrc"
            echo "export DISPLAY=\"\$(/sbin/ip route | awk '/default/ { print $3 }'):0\"" >> "$HOME/.bashrc"
            source "$HOME/.bashrc"
        fi
        if ! grep -q "LIBGL_ALWAYS_INDIRECT=1" "$HOME/.bashrc"; then
            echo "" >> "$HOME/.bashrc"
            echo "export LIBGL_ALWAYS_INDIRECT=1" >> "$HOME/.bashrc"
            source "$HOME/.bashrc"
        fi
    fi
    if [ "$3" == "binary" ] || [ "$3" == "Binary" ] ; then
        echo ""
        echo "Installing ROOT from bynary distribution..."
        bash_writer "$1" ""
    elif [ "$3" == "source" ] || [ "$3" == "Source" ] ; then
        echo ""
        echo "Installing ROOT from source code..."
        mkdir -p "$HOME/${1::-7}-build"
        cd "$HOME/${1::-7}-build" || exit
        cmake "$HOME/${1::-7}"
        cmake --build .
        bash_writer "$1" "-build"
    else
        echo ""
        echo "$3 installation method is not supported for $2 operating system!"
        echo ""
        exit
    fi
    echo ""

#====================================================
#     INSTALLATION FOR MACOS
#====================================================
elif [ "$2" == "MacOS" ] || [ "$2" == "MACOS" ] || [ "$2" == "macOS" ] || [ "$2" == "macos" ] || [ "$2" == "Macos" ] ; then
    cd $HOME || exit
    echo "Installing prerequisites:"
    echo ""
    echo "System update..."
    echo ""
    softwareupdate --install -a
    echo ""
    if [ "$3" == "brew" ] || [ "$3" == "Brew" ] ; then
        echo "Updating and upgrading brew..."
        echo ""
        if ! brew update ; then
            echo "The brew package manager is not installed! I am installing it..."
            echo ""
            if ! /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" ; then
                echo "Unable to install brew package manager!"
            fi
            echo ""
            brew update
        fi
        brew upgrade
        echo ""
        echo "Installing ROOT..."
        echo ""
        if ! brew install root6 ; then
            echo "Unable to install ROOT via brew!"
            exit
        fi
    elif [ "$3" == "MacPorts" ] || [ "$3" == "Macports" ] || [ "$3" == "macports" ] || [ "$3" == "macPorts" ] ; then
        echo "Installing Xcode..."
        echo ""
        if ! port install root6 ; then
            echo "Unable to install ROOT via brew! Probably you have not installed the following prerequisites:"
            echo "MacPorts: see https://www.macports.org/install.php."
            echo "Xcode: enter \"xcode-select --install\" on the terminal."
            exit
        fi
    else
        echo ""
        echo "$3 installation method is not supported for $2 operating system!"
        echo ""
        exit
    fi
else
    echo "This installation script is not supported for $2 operating system!"
    exit
fi

#====================================================
#     QUICK INSTALLATION CHECK
#====================================================
echo "ROOT installation check:"
echo ""
if ! eofer ; then
    echo "Something went wrong, ROOT has not been correctly installed!"
    exit
fi
echo "ROOT has been successfully installed!"
echo ""
echo "Enter \"root\" (without quotation marks) in the terminal to enter the ROOT command prompt."
echo ""
echo "If you have issue with graphics on WSL or any kind of problem you can read my step-by-step guides about ROOT installation here:"
echo "https://github.com/JustWhit3/useful-guides/tree/main/ROOT/Installation."
echo ""