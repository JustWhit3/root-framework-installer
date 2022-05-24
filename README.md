<p align="center"><img src="https://github.com/JustWhit3/root-framework-installer/blob/main/img/logo.svg" height=220></p>

<h3 align="center">A shell script to automatically install the ROOT framework on Ubuntu, Windows or MacOS operating systems</h3>
<p align="center">
    <img title="v1.0" alt="v1.0" src="https://img.shields.io/badge/version-v1.0-informational?style=flat-square"
    <a href="LICENSE">
        <img title="MIT License" alt="license" src="https://img.shields.io/badge/license-MIT-informational?style=flat-square">
    </a>
	<img title="Bash" alt="Bash" src="https://img.shields.io/badge/Bash--informational?style=flat-square">
    </a></br>
	<img title="Code size" alt="code size" src="https://img.shields.io/github/languages/code-size/JustWhit3/root-framework-installer?color=red">
	<img title="Repo size" alt="repo size" src="https://img.shields.io/github/repo-size/JustWhit3/root-framework-installer?color=red">
	<img title="Lines of code" alt="total lines" src="https://img.shields.io/tokei/lines/github/JustWhit3/root-framework-installer?color=red">
</p>

<img src="https://github.com/JustWhit3/root-framework-installer/blob/main/img/installation_example.gif">

## Table of contents

- [Introduction](#introduction)
- [How to use the script](#how-to-use-the-script)
  - [Download the repository](#download-the-repository)
  - [Run the script](#run-the-script)
- [Examples](#examples)
- [Credits](#credits)
  - [Project leaders](#project-leaders)
  - [Other contributors with no GitHub account](#Other-contributors-with-no-GitHub-account)

## Introduction

This repository contains instructions about how to run a shell script to automatically install the [ROOT framework](https://github.com/root-project/root) on your computer by entering only one command in the terminal prompt! With this, you can install the release you prefer (which is directly downloaded from the official [ROOT website](https://root.cern/install/all_releases/)) for the major part of the most used operating systems.

The script works for the following operating systems:

- **Windows** (release 10 or higher), using [Windows Subsystem for Linux (WSL)](https://docs.microsoft.com/en-us/windows/wsl/install); supported installation methods are:
  - *Binary* (recommended).
  - *Source*.
- **Ubuntu**, supported installation methods are:
  - *Binary* (recommended).
  - *Source*.
- **MacOS**, supported installation methods are:
  - *[brew](https://brew.sh/index_it)* (recommended).
  - *[MacPorts](https://www.macports.org/)*.

>**NOTE**: this script has been widely tested on Ubuntu and Windows operating systems. No test has been performed for MacOS operating system, but it should 100% fully work also on it, without any problem.

>**NOTE 2**: if you find any issue or problem during the installation with this script, please write me or open an issue on the repository and I will fix it as soon as possible.

If you want to cite this software, please use [this](https://github.com/JustWhit3/root-framework-installer/blob/main/CITATION.cff) template for the information.

The software is and will stay **free**, but if you want to support me and its development (for example with the addition of new platforms support) with a donation it would be really appreciated! 

<a href="https://www.buymeacoffee.com/JustWhit33" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>

## How to use the script

First of all, just to be 100% safe, be sure to don't have other ROOT versions installed in your computer. In case you have some of them, you need to uninstall these by following [this guide](https://github.com/JustWhit3/useful-guides/blob/main/ROOT/Installation/Uninstall.md).

### Download the repository

To download the library you can choose one of the two possibilities:

1) **Download the whole repository**

First of all, you need to download the code: go to the [main page](https://github.com/JustWhit3/root-framework-installer) of the repository and click on the upper right green button called `Code`. Than click on `Download ZIP` (see screenshot below) and wait the download to be completed.

<img src="https://github.com/JustWhit3/root-framework-installer/blob/main/img/download_repo.png">

Then open a fresh shell and move the downloaded zipped file to your home directory (or to any other place you prefer):
```shell
mv Downloads/root-framework-installer-main.zip $HOME
```
Where ``Downloads`` have to be replaced with the right name of your downloads directory (in italian is ``Scaricati``).

Now you have to enter your home directory (unless you were already in it, in this case skip this passage) and extract the folder from the zipped file. Therefore lets type this commands one after the other:
```shell
cd $HOME
unzip root-framework-installer-main.zip
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
./install.sh [platform-zipped-file] [operating-system] [installation-method]
```
therefore the script takes three arguments in the command prompt:
1) `[platform-zipped-file]`

It is the zipped file name of the platform of your installation. You can find it by clicking on [this link](https://root.cern/install/all_releases/) and choosing the latest release on the top:

<img src="https://github.com/JustWhit3/root-framework-installer/blob/main/img/latest_release.png">

than choose the platform you want and copy the name of the corresponding .zip file (ex: `root_v6.24.06.Linux-ubuntu20-x86_64-gcc9.3.tar.gz` for Ubuntu 20):

<img src="https://github.com/JustWhit3/root-framework-installer/blob/main/img/distributions.png">

This has to be placed into the `[platform-zipped-file]` place.

In case you are installing via a package manager (for example for MacOS operating system via *brew* or *MacPorts*), you have to enter `package-manager` here.

2) `[operating-system]`

Here you can put the operating system name of your computer. The list of supported operating systems can be viewed at the end of the [*Introduction*](#introduction) section.

2) `[installation-method]`

Here you can put the installation method of the operating system you have chosen. The list of supported installation methods for each operating system can be viewed at the end of the [*Introduction*](#introduction) section.

## Examples

Below, some examples about how to run the script are shown:

- **Windows** (with WSL shell and Ubuntu 20 *binary* distribution):

```shell
./install.sh root_v6.24.06.Linux-ubuntu20-x86_64-gcc9.3.tar.gz WSL binary
```

- **Ubuntu** (via *source* code):

```shell
./install.sh root_v6.24.06.source.tar.gz Ubuntu source
```

- **Ubuntu** (via *binary* distribution for Ubuntu 20):

```shell
./install.sh root_v6.24.06.Linux-ubuntu20-x86_64-gcc9.3.tar.gz Ubuntu binary
```

- **MacOS** (via *brew* package manager):

```shell
./install.sh package-manager MacOS brew
```

## Credits

### Project leaders

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://justwhit3.github.io/"><img src="https://avatars.githubusercontent.com/u/48323961?v=4" width="100px;" alt=""/><br /><sub><b>Gianluca Bianco</b></sub></a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

### Other contributors with no GitHub account

- [dastudillo](https://root-forum.cern.ch/u/dastudillo/summary): commits [07e3733](https://github.com/JustWhit3/root-framework-installer/commit/07e3733fa7e372f48e34dfdf277abd9b78e12128) and [94747f4](https://github.com/JustWhit3/root-framework-installer/commit/07e3733fa7e372f48e34dfdf277abd9b78e12128).
- [Wile_E_Coyote](https://root-forum.cern.ch/u/Wile_E_Coyote/profile-hidden): commits [07e3733](https://github.com/JustWhit3/root-framework-installer/commit/07e3733fa7e372f48e34dfdf277abd9b78e12128) and [94747f4](https://github.com/JustWhit3/root-framework-installer/commit/07e3733fa7e372f48e34dfdf277abd9b78e12128).
