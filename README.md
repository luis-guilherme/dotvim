# My ~/.vim

I borrowed from different sources, one of them being this:

https://gist.github.com/manasthakur/d4dc9a610884c60d944a4dd97f0b3560

Few differences:

 - My repo is in `~/.vim/`
 - I use pathogen to manage the plugins (should move to Vim 8's packages, but I
   still have few Vim 7.x boxes)
 - Includes gvim configuration

## Using it in a new location

    cd && git clone --recursive https://github.com/reidrac/dotvim.git

If you're not using vim 8; create a `.vimrc` with:

    runtime vimrc

## Adding plugins

    git submodule add https://github.com/user/foo.git bundle/foo
    git commit -m "Added foo plugin"

## Updating plugins

    git submodule foreach git pull origin master
    git commit -am "Updated plugins"

### Updating you .vim on a different machine

    git pull
	git submodule update --remote

## Removing plugins

    git submodule deinit bundle/foo
	git rm -r bundle/foo
	rm -r .git/modules/bundle/foo

