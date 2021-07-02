# My ~/.vim

Managed by [vim-plug](https://github.com/junegunn/vim-plug).

A few things require nvim 0.5.0 or later, but won't load if not possible.

For further information on installed plugins:

    :help local-additions

## Using it in a new location

My repo is in `~/.vim/`! You shouldn't have a `~/.vimrc` or `~/.vim` directory.

    cd && git clone --recursive https://github.com/reidrac/dotvim.git .vim

If you're not using vim 8; create a `.vimrc` with:

    runtime vimrc

And you may need to comment out some plugins that require nvim > 0.5.0.

This can be also be used to customise your local vim configuration without
having uncommitted changes in your repository.

In case of Neovim, you can link the provided `init.vim` into `~/.config/nvim/init.vim`.

Then it is recommended you run:

    :PlugUpgrade
    :PlugInstall

The *upgrade* part is only needed if the plugin manager is not up to date. Then
you can commit and push the updated version.

## Adding plugins

Add a new `Plug` entry in `~/.vim/vimrc`.

## Updating plugins

    :PlugUpdate

## Removing plugins

Remove the `Plug` line and run:

    :PlugClean

