# root-framework-installer

## Table of contents

- [Introduction](#introduction)
- [How to use the script](#how-to-use-the-script)
  - [Download the repository](#download-the-repository)
  - [Run the script](#run-the-script)

## Introduction

This repository contains instructions about how to run a shell script to automatically install the [ROOT framework](https://github.com/root-project/root) on your computer. You can install the release you prefer (directly downloaded from the official [ROOT website](https://root.cern/install/all_releases/)) for any of the most used operating systems by entering only one shell command in the command prompt!

The script works for the following operating systems:

- **Windows** (release 10 or higher), using [Windows Subsystem for Linux (WSL)](https://docs.microsoft.com/en-us/windows/wsl/install); supported installation methods are:
  - *Binary*.
  - *Source*.
- **Ubuntu**, supported installation methods are:
  - *Binary*.
  - *Source*.
- **MacOS**, supported installation methods are:
  - *[brew](https://brew.sh/index_it)*.
  - *[MacPorts](https://www.macports.org/)*.

## How to use the script

First of all, just to be 100% safe, be sure to don't have other ROOT versions installed in your computer. In case you have some of them, you need to uninstall these by following [this guide](https://github.com/JustWhit3/useful-guides/blob/main/ROOT/Installation/Uninstall.md).

### Download the repository

To download the library you can choose one of the two possibilities:

1) **Download the whole repository**

First of all, you need to download the code: go to the [main page](https://github.com/JustWhit3/root-framework-installer) of the repository and click on the upper right green button called `Code`. Than click on `Download ZIP` (see screenshot below) and wait the download to be completed.

https://github.com/JustWhit3/root-framework-installer/blob/main/img/download_repo.png

Then open a fresh shell and move the downloaded zipped file to your home directory (or to any other place you prefer):
```shell
mv Downloads/root-framework-installer-main.zip $HOME
```
Where ``Downloads`` have to be replaced with the right name of your downloads directory (in italian is ``Scaricati``).

Now you have to enter your home directory (unless you were already in it, in this case skip this passage) and extract the folder from the zipped file. Therefore lets type this commands one after the other:
```shell
cd $HOME
unzip osmanroot-framework-installer-main.zip
```
And that's all. You can enter the repository folder by simply typing:
```shell
cd root-framework-installer-main
```

2) **Download the latest release**

Alternatively you can download the latest release of the repository from the ``Releases`` button on the right of the repository main page by clicking on the source code link. In this case the procedure is similar:

Open a fresh shell and move the downloaded zipped file to your home directory (or to any other place you prefer):
```shell
mv Downloads/root-framework-installer-x.y.z.zip $HOME
```
Where ``Downloads`` have to be replaced with the right name of your downloads directory (in italian is ``Scaricati``).

Now you have to enter your home directory (unless you were already in it, in this case skip this passage) and extract the folder from the zipped file. Therefore lets type this commands one after the other:
```shell
cd $HOME
unzip root-framework-installer-x.y.z.zip
```

> If you prefer to download the tar.gz format of the release you have to run the `gunzip` command followed by the `tar -xvf` command on the zipped release folder.

And that's all. You can enter the repository folder by simply typing:
```shell
cd root-framework-installer-x.y.z
```

### Run the script

To run the script and install the ROOT framework you need to enter the repository folder from a terminal and write on the command prompt:
```shell
./install [platform-zipped-file] [operating-system] [installation-method]
```
therefore the script takes three arguments in the command prompt:
1) `[platform-zipped-file]`
It is the zipped file name of the platform of your installation. You can find it by clicking on [this link](https://root.cern/install/all_releases/) and choosing the latest release on the top:
https://github.com/JustWhit3/root-framework-installer/blob/main/img/latest_release.png
than choose the platform you want and copy the name of the corresponding .zip file (ex: `root_v6.24.06.Linux-ubuntu20-x86_64-gcc9.3.tar.gz` for Ubuntu 20):
https://github.com/JustWhit3/root-framework-installer/blob/main/img/distributions.png
This has to be placed into the `[platform-zipped-file]` place.
In case you are installing via a package manager (for example for MacOS operating system via *brew* or *MacPorts*), you have to enter `package-manager` here.

2) `[operating-system]`
Here you can put the operating system name of your computer. The list of supported operating systems can be viewed at the end of the [*Introduction*](#introduction) section.

2) `[installation-method]`
Here you can put the installation method of the operating system you have chosen. The list of supported installation methods for each operating system can be viewed at the end of the [*Introduction*](#introduction) section.

Below, some examples about how to run the script are shown:

- **Windows** (with WSL shell and Ubuntu 20 *binary* distribution):

```shell
./install root_v6.24.06.Linux-ubuntu20-x86_64-gcc9.3.tar.gz WSL binary
```

- **Ubuntu** (via *source* code):

```shell
./install root_v6.24.06.source.tar.gz Ubuntu source
```

- **Ubuntu** (via *binary* distribution for Ubuntu 20):

```shell
./install root_v6.24.06.Linux-ubuntu20-x86_64-gcc9.3.tar.gz Ubuntu binary
```

- **MacOS** (via *brew* package manager):

```shell
./install package-manager MacOS brew
```
