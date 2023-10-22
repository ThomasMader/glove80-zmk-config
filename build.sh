#!/bin/sh

if [ ! -d "./src" ]; then
	git clone https://github.com/moergo-sc/zmk.git src
	cd src
	# Don't think that is actually needed but let's keep it just to be safe.
	#git reset --hard 279bc25747f038d7110c99d1903f2a8f482148b4
	cd ..
fi

cp -f $(nix-build config -o combined --no-out-link)/glove80.uf2 .

