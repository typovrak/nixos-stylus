[![NixOS 26.05+](https://img.shields.io/badge/NixOS-26.05%2B-a6e3a1?labelColor=45475a)](https://nixos.org/)
[![License MIT](https://img.shields.io/badge/License-MIT-cba6f7.svg?labelColor=45475a)](LICENSE.md)
[![Portal](https://img.shields.io/badge/Portal-typovrak.tv%2Fnixos-eba0ac?labelColor=45475a)](https://typovrak.tv/nixos)
[![Discord join us](https://img.shields.io/badge/Discord-Join%20us-74c7ec?labelColor=45475a&logo=discord&logoColor=white)](https://typovrak.tv/discord)

# 🎨 NixOS Stylus

> NixOS module for automated Stylus browser extension theme deployment with directory setup, theme file installation and idempotent configuration.

## 🧩 Part of the Typovrak NixOS ecosystem

This module is part of ```Typovrak NixOS```, a fully modular and declarative operating system configuration built entirely with :

- 🧱 **30+ standalone modules :** Each managing a specific tool, feature or aesthetic like ```zsh```, ```i3```, ```lighdm```, ```polybar```, ```gtk``` and more.
- 🎨 **Catppuccin Mocha :** The default theme across terminal, GUI, and login interfaces.
- 🛡️ **100% FOSS compliant :** No proprietary software included unless explicitly chosen.
- 🧑‍💻 **Built for developers :** Optimized for speed, keyboard-centric workflows and expressive CLI tooling.

*Explore the full system : 👉 [github.com/typovrak/nixos](https://github.com/typovrak/nixos)*

> [!CAUTION]
> This module is opinionated, it may **override**, **replace**, or **remove** files and settings **without** prompt. To avoid unexpected changes, **back up** your existing files or **fork** this module to take full control. **Follow this documentation** to avoid any of this problem.

## 📦 Features

- 🔒 **Secure config directory :** Creates and protects ```~/.config/stylus``` with correct ownership and permissions.
- 🎨 **Theme deployment :** Installs ```catppuccin-mocha-green.json``` into the Stylus configuration folder.
- 🔄 **Idempotent :** Cleans and recreates the config directory on each rebuild for consistent state.
- ⚙️ **Zero-friction setup :** Works out-of-the-box with minimal options.
- 📦 **Dependency handling :** Ensures ```chromium``` and ```firefox``` are installed via ```environment.systemPackages```.
- 💾 **Backups :** Backup instructions for existing Stylus configs are provided in the documentation.

## 📂 Repository structure

```bash
❯ tree -a -I ".git*"
.
├── catppuccin-mocha-green.json # stylus catppuccin mocha green websites theme
├── configuration.nix           # module configuration
├── LICENSE.md                  # MIT license
└── README.md                   # this documentation

1 directory, 4 files
```

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
Before proceeding, back up existing configuration if needed
```bash
cp ~/.config/stylus{,.bak}
```

## ⬇️ Installation

### 🚀 Method 1 : Out-of-the-box

Fetch the module directly in your [main nixos configuration](https://github.com/typovrak/nixos) at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
# /etc/nixos/configuration.nix

let
  nixos-stylus = fetchGit {
    url = "https://github.com/typovrak/nixos-stylus.git";
    ref = "main";
    rev = "76462ddf0919bdfd040a3c0b06ed081879d5176b"; # update to the desired commit
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-stylus}/configuration.nix")
  ];
}
```

Once imported, rebuild your system to apply changes
```bash
sudo nixos-rebuild switch
```

### 🍴 Method 2 : Fork

Want to **personalize** this module ?

Fork it and add this custom module in your [main nixos configuration](https://github.com/typovrak/nixos) at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
let
  nixos-stylus = fetchGit {
    url = "https://github.com/<YOUR_USERNAME>/nixos-stylus.git";
    ref = "main";
    rev = "<COMMIT>"; # see below
  };
in {
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-stylus}/configuration.nix")
  ];
}
```

Get the latest commit hash by executing
```bash
git clone https://github.com/<YOUR_USERNAME>/nixos-stylus.git &&
cd nixos-stylus &&
git log -1 --pretty=format:"%H"
```

## 🎬 Usage

1. Open you favorite browser, ~~Firefox~~ Chromium.
2. Download the chrome extension [Stylus](https://chromewebstore.google.com/detail/stylus/clngdbkpkpeebahjckkjfobafhncgmne).
3. Open the extension and import the Catppuccin mocha green theme at ```~/.config/stylus```.
4. Apply all themes & Enjoy !

## 📚 Learn more

- 🎨 [Stylus Chrome extension](https://chromewebstore.google.com/detail/stylus/clngdbkpkpeebahjckkjfobafhncgmne) : The official extension page to install Stylus in Chromium-based browsers.
- 🧠 [Stylus documentation](https://github.com/openstyles/stylus/wiki) : Full details on import, export, theming and config files.

## 🌐 Discover my NixOS system portal

Dive into [typovrak.tv/nixos](https://typovrak.tv/nixos) Catppuccin mocha green themed **gateway** to my GitHub and NixOS setup.

Browse **every module**, example and config in a sleek with an interactive interface that feels just like your desktop.

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.

## 💬 Join the Typovrak community on Discord 🇫🇷

If you've ever ```rm -rf```ed your config by mistake or rebuilt for the 42nd time because a semicolon was missing…

You're not alone, **Welcome home !**

🎯 [Join us on Discord »](https://typovrak.tv/discord)

🧭 What you’ll find is :

- ```💻 #nixos-setup``` - get help with modules, rebuilds and configs.
- ```🌐 #web-dev``` - talk JS, TypeScript, React, Node and more.
- ```🧠 #open-source``` - share your repos, contribute to others and discuss FOSS culture.
- ```⌨️ #typing``` - layouts, mechanical keyboards and speed goals.
- ```🎨 #ricing``` - dotfiles, theming tips and desktop screenshots.

*Everyone's welcome no matter how many times you've broken your system ~~(except for Windows users)~~ 😄*

---

<p align="center"><i>Made with 💜 by <a href="https://typovrak.tv">typovrak</a></i></p>
