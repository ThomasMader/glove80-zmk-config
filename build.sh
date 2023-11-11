#!/bin/sh

tag=v23.11

if [ -d "./src" ]; then
    cd src
    if [[ $(git tag) != $tag ]]; then
        echo "Removing old src directory because it doesn't match the tag."
        cd ..
        rm -rf src
    else
        cd ..
    fi
fi

if [ ! -d "./src" ]; then
	git clone --depth 1 --branch $tag https://github.com/moergo-sc/zmk.git src
fi

cp -f $(nix-build config -o combined --no-out-link)/glove80.uf2 .

