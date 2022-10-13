Custom config for [NvChad](https://github.com/NvChad/NvChad). See NvChad's [docs](https://nvchad.com/config/Walkthrough) for more info on custom configs.

### Install
Remove or backup ``~/.local/share/nvim``. This folder contains swap for open files, the [ShaDa](https://neovim.io/doc/user/starting.html#shada) (Shared Data) file, and the site directory for plugins from previous configurations.

NvChad: ``git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1``

Then this config: ``git clone git@github.com:kelvin-van-vuuren/nvchad-config.git ~/.config/nvim/lua/custom --depth 1 && nvim``
