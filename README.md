# My ~/.vim

## Using it in a new location

    cd ~ && git clone --recursive https://github.com/reidrac/dotvim.git

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

