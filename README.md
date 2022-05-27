<!-- PROJECT LOGO -->
<br />
<p align="center">
  <img src="https://mjn-reame-logos.s3.us-east-2.amazonaws.com/dotfiles.jpg" alt="Logo" width="80">

  <h3 align="center">Dotfiles</h3>

  <p align="center">
  All my configurations for the tools I use
  </p>
</p>

## Installation

```sh
git clone https://github.com/michaelnavs/dotfiles.git
```

```sh
cd dotfiles
```

```sh
./setup.sh
```

## Main Tools Used

- [Alacritty](https://alacritty.org/)
- [LeftWM](https://github.com/leftwm/leftwm)
- [Neovim](https://neovim.io/)
- [Tmux](https://github.com/tmux/tmux)

## Tools' Configurations

_If a tool is not specified below, it uses default configurations_

### Alacritty | Zsh | Starship

![Alacritty](./images/alacritty.png)

- [Alacritty](./alacritty/alacritty.yml) is my terminal emulator of choice. I love how fast and minimal it is. I also love how easy it is to customize it. You can find more information on Alacritty [here](https://alacritty.org/). I am using the [Doom One](https://github.com/eendroroy/alacritty-theme/blob/master/themes/doom_one.yml) color scheme, but modify the background color and foreground color to match my Neovim theme. The font I use is [Monofur Nerd Font](https://www.nerdfonts.com/font-downloads)
- [Zsh](./.zshrc) is my terminal shell. I have paired it with Oh-my-zsh, which allows me to install plugins like auto-suggestion and many more. You can find more information on Zsh [here](https://www.zsh.org/) and Oh-my-zsh [here](https://ohmyz.sh/)
- [Starship](./starship.toml) is my shell prompt. I only changed the icons to use Nerd Font icons. You can find more information [here](https://starship.rs/presets/#nerd-font-symbols) 

### LeftWM

![LeftWM]()

- [LeftWM](./leftwm) is a tiling window manager written in Rust. I decided to use LeftWM after trying AwesomeWM for a week. In my opinion, LeftWM is simple to configure, using a toml file to configure all your keybindings. Also, it has a [community themes page](https://github.com/leftwm/leftwm-community-themes) and [LeftWM-Theme tool](https://github.com/leftwm/leftwm-theme) to easy install a theme that you like without having to configure one yourself.
- I am using a modified community theme called [Garden](https://github.com/taylor85345/leftwm-theme-garden). Instead of using the recommended GTK/Kvantum theme, I am using [Layan-solid](https://store.kde.org/p/1325246). Also, I turned off all transparency for all windows, besides my terminal. For icons, I am using [Tela](https://store.kde.org/p/1279924). For the Garden theme, I am using [SauceCodePro Nerd Font](https://www.nerdfonts.com/font-downloads)

### Neovim

![Neovim](./images/neovim.png)

- [Neovim](./nvim) is my text editor of choice. When I was first introduced to Neovim, I was instantly hooked into using it. I love how quick and minimal it is. 
- My Neovim config is 100% lua with a little sprinkle of vimscript inside lua files.
- The color-scheme I use, is called [OneDark](https://github.com/navarasu/onedark.nvim) Warmer variation.  
- If you are new to Neovim, I highly recommend checking out [Chris@machine](https://www.youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ) on YouTube. He makes videos on different Neovim plugins (extensions) that are easy to follow and he explains why he likes using said plugin. My Neovim config derives from Chris@Machine, but I have added other plugins and keybindings that I like.

### Tmux

![Tmux](./images/tmux.png)

- [Tmux](https://github.com/tmux/tmux) is a great combo with Alacritty. You can easily add more terminal windows within one, to keep your workspace organized. It can also save sessions so a simple command can bring you right back to your project at ease.
- There is not much to my tmux config, besides binding prefix to Ctrl+j 
- I use [tpm](https://github.com/tmux-plugins/tpm) to install plugins, which needs to be installed before using my tmux config file.
- Currently, I only have three plugins installed:
  - [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible), improves default settings and keybindings.    
  - [tmux-themepack](https://github.com/jimeh/tmux-themepack), used for easily setting different color schemes.    
  - [tmux-onedark-theme](https://github.com/odedlaz/tmux-onedark-theme), which converts the boring lime green tmux bar, with one styled like a powerline prompt in onedark color scheme.

