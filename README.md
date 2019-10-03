# My ~/.vim

I borrowed from different sources, one of them being this:

https://gist.github.com/manasthakur/d4dc9a610884c60d944a4dd97f0b3560

Few differences:

 - My repo is in `~/.vim/`
 - I use pathogen to manage the plugins (should move to Vim 8's packages, but I
   still have few Vim 7.x boxes)
 - Includes gvim configuration (outdated, I don't use it anymore)

    :help local-additions

## Using it in a new location

You shouldn't have a `~/.vimrc` or `~/.vim` directory.

    cd && git clone --recursive https://github.com/reidrac/dotvim.git .vim

If you're not using vim 8; create a `.vimrc` with:

    runtime vimrc

This can be also be used to customise your local vim configuration without
having uncommitted changes in your repository.

## Adding plugins

    git submodule add https://github.com/user/foo.git bundle/foo
    git commit -m "Added foo plugin"

## Updating plugins

    git submodule foreach git pull origin master
    git commit -am "Updated plugins"

### Updating you .vim on a different machine

    git pull

    # Only if a plugin was added
    git submodule init

    git submodule update

## Removing plugins

    git submodule deinit -f bundle/foo
    git rm -r bundle/foo
    git commit -am "Removed plugin"
    rm -rf .git/modules/bundle/foo

