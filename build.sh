#!/bin/sh

if [ ! -d "./src" ]; then
	git clone https://github.com/moergo-sc/zmk.git src
fi

cp -f $(nix-build config -o combined --no-out-link)/glove80.uf2 .

