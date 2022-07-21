# Nepmux : An Opinionated Tmux Statusline for Nepalese.

[![TPM](https://img.shields.io/badge/tpm--support-true-blue)](https://github.com/tmux-plugins/tpm)
![GitHub all releases](https://img.shields.io/github/downloads/shreewatsa/nepmux/total?logo=Github&logoColor=%23ff0000)
[![License](https://img.shields.io/badge/License-MIT-brightgreen.svg)](https://github.com/shreewatsa/nepmux/blob/master/LICENSE)
[![Generic badge](https://img.shields.io/badge/Made_with_-love-red.svg)](https://shields.io/)

### :fire: Features 

- Live NEPSE Index - Color coded ie Green and Red indicators.
- Live Weather status.
- Two beautiful themes.

### 📥 Installation

**Install manually**

> HINT: Always make a backup of your config files before any action.

Clone the repo somewhere ( say `~/Downloads` ) and source it in your exisging tmux config ie `~/.config/tmux/tmux.conf`:

```bash
cd ~/Downloads;
git clone git@github.com:shreewatsa/nepmux.git;
echo "run-shell ~/Downloads/nepmux/nepmux.tmux" >> ~/.config/tmux/tmux.conf;
```

**Install using [TPM](https://github.com/tmux-plugins/tpm)**

Add the following line to the list of TPM plugins in .tmux.conf. 
You can also select the desired theme, but it's optional.

```tmux
set -g @plugin 'shreewatsa/nepmux'
set -g @nepmux_theme "moon" # or "gold"
```

Recommendation: Add this line at the top of `.tmux.conf` file to autorefresh every minute when idling.
```tmux
set -g status-interval 60
```

### 🎨 Themes
**Gold**(default): `set -g @nepmux_theme 'gold'`

![screenshot](https://github.com/shreewatsa/i/blob/main/tmux_ss.png)

![screenshot](https://github.com/shreewatsa/i/blob/main/tmux_ss2.png)

**Moon**: `set -g @nepmux_theme 'moon'`
![screenshot](https://github.com/shreewatsa/i/blob/main/tmux_moon.png)

**Terminal default colorscheme**: `set -g @nepmux_theme 'default'`
Set this theme if you want to honor the terminal colorscheme. To be used with
something like [pywal](https://github.com/dylanaraps/pywal) for instance.

### ⚙  Customizing

You can change the date and time formats using strftime:

```tmux
set -g @nepmux_date_format '%d %b %Y'
set -g @nepmux_time_format '%I:%M'
```

*The default icons use glyphs from [nerd-fonts](https://github.com/ryanoasis/nerd-fonts).*
*You need to use Nerd Font in the terminal emulator to render they glyphs.*

### 🔗 Other plugins

You might also find these useful:

- [awesome-tmux](https://github.com/rothgar/awesome-tmux)

### 📃 License

[MIT](https://github.com/shreewatsa/nepmux/blob/master/LICENSE) (c) Shreewatsa Timalsena
