# 🎨 NixOS Stylus

> NixOS module for automated Stylus browser extension theme deployment with directory setup, theme file installation and idempotent configuration.

## 📦 Features

- 🔒 **Secure config directory :** Creates and protects ```~/.config/stylus``` with correct ownership and permissions.
 
- 🎨 **Theme deployment :** Installs ```catppuccin-mocha-green.json``` into the Stylus configuration folder.

- 🔄 **Idempotent :** Cleans and recreates the config directory on each rebuild for consistent state.
 
- ⚙️ **Zero-friction setup :** Works out-of-the-box with minimal options.

- 📦 **Dependency handling :** Ensures ```chromium``` and ```firefox``` are installed via ```environment.systemPackages```.
 
- 💾 **Backups :** Backup instructions for existing Stylus configs are provided in the documentation.

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

## 🚀 Installation
Fetch the module directly in your main nixos configuration at ```/etc/nixos/configuration.nix``` using fetchGit
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

## 🎬 Usage

1. Open you favorite browser, ~~Firefox~~ Chromium.
2. Download the chrome extension [Stylus](https://chromewebstore.google.com/detail/stylus/clngdbkpkpeebahjckkjfobafhncgmne).
3. Open the extension and import the Catppuccin mocha green theme at ```~/.config/stylus```.
4. Apply all themes & Enjoy !

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://www.buymeacoffee.com/typovrak).

## 📝 License

Distributed under the [MIT license](LICENSE.md).

## 📜 Code of conduct

This project maintains a [code of conduct](.github/CODE_OF_CONDUCT.md) to ensure a respectful, inclusive and constructive community.

## 🛡️ Security

To report vulnerabilities or learn about supported versions and response timelines, please see our [security policy](.github/SECURITY.md).

---

<p align="center"><i>Made with 💜 by typovrak</i></p>
