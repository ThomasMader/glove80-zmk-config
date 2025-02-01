#!/bin/sh

# Can not use tag v25.01 because it added name paramter to the combine function.
#commit=v25.01
commit=faf11f929a65a12a688b481cbe333eda1fd83a77

if [ -d "./src" ]; then
  cd src
  if [[ $(git rev-parse HEAD) != $commit ]]; then
    echo "Removing old src directory because it doesn't match the tag."
    cd ..
    rm -rf src
  else
    cd ..
  fi
fi

if [ ! -d "./src" ]; then
  git clone https://github.com/moergo-sc/zmk.git src
  cd src
  git reset --hard $commit
  cd ..
fi

cp -f $(nix-build config -o combined --no-out-link)/glove80.uf2 .
