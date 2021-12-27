#!/bin/bash

# $1 - platform

#====================================================
#     DOWNLOAD FUNCTION
#====================================================
download() {
    echo ""
    echo "Downloading the ROOT code from https://root.cern/download/$1..."
    echo "This may take a few minutes!"
    echo ""
    if ! curl https://root.cern/download/$1 -o $1 ; then
        echo "Failed to download the zip file!"
        exit
    fi
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
if [ -d "${1::-7}" ] ; then
    echo ""
elif [ -f "${1::-3}" ] ; then
    echo ""
    echo "Upacking the file:"
    tar -xvf "${1::-3}"
    mv root "${1::-7}"
    rm root*tar*
    echo ""
else
    echo ""
    echo "Unzipping and upacking the file:"
    gunzip "$1"
    tar -xvf "${1::-3}"
    mv root "${1::-7}"
    rm root*tar*
    echo ""
fi