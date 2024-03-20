<div align="center">
	  <img src="https://raw.githubusercontent.com/neovim/neovim.github.io/master/logos/neovim-logo-300x87.png" alt="Neovim">
</div>
<div align="center">
<div>
Custom <a href="https://neovim.io/">Neovim</a> config using <a href="https://github.com/NvChad/NvChad">NvChad</a> as a base.
</div>
<p></p>
    	<a href="https://github.com/kelvin-van-vuuren/nvim/edit/main/.github/README.md#features-added-on-top-of-nvchad-base">Features</a>
  <span> • </span>
       	<a href="https://github.com/kelvin-van-vuuren/nvim/edit/main/.github/README.md#screenshots">Screenshots</a>
  <span> • </span>
	<a href="https://github.com/kelvin-van-vuuren/nvim/edit/main/.github/README.md#Install">Install</a>
  <span> • </span>
        <a href="https://nvchad.com/config/Walkthrough">Docs</a>
  <p></p>
</div> 

### Features (on top of [NvChad's](https://nvchad.com/#/docs/features))
* [**Clangd**](https://clangd.llvm.org/): language server for C/C++ development.
* [**Null-ls**](https://github.com/jose-elias-alvarez/null-ls.nvim): For diagnostics, formatting, code actions and more.
* [**Nvim-dap**](https://github.com/mfussenegger/nvim-dap) + [**nvim-dap-ui**](https://github.com/rcarriga/nvim-dap-ui): Debugger with [lldb](https://lldb.llvm.org/) debug adapter [config](https://github.com/kelvin-van-vuuren/nvim/blob/main/plugins/dap/adapters/lldb.lua) for C / C++ / Rust projects.
* [**Better-escape**](): quickly escape insert mode using ``jk``.  
* [**Git**](https://git-scm.com/): wrap header text at 50 chars, body text at 72.
* [And more...](https://github.com/kelvin-van-vuuren/nvim/commits/main)
### Screenshots
![2023-03-20-114710_3840x2160_scrot](https://user-images.githubusercontent.com/54939625/226331221-85b9630b-d065-4300-baa1-e0486f9db8d4.png)
![2023-03-20-114825_3840x2160_scrot](https://user-images.githubusercontent.com/54939625/226331697-05896bac-4d7c-4535-87d6-de364f7600c2.png)
![2023-03-20-114900_3840x2160_scrot](https://user-images.githubusercontent.com/54939625/226331802-58b50691-a218-4889-afac-d7058de89cde.png)

### Install
Remove or backup ``~/.local/share/nvim``. This folder contains swap for open files, the [ShaDa](https://neovim.io/doc/user/starting.html#shada) (Shared Data) file, and the site directory for plugins from previous configurations.

Then clone this repo: ``git clone git@github.com:kelvin-van-vuuren/nvim.git ~/.config/nvim --depth 1 && nvim``

Run ``:MasonInstallAll`` after plugins have finished downloading to install additional packages (LSP / DAP servers, linters and formatters).
