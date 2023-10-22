#!/bin/sh

cp -f $(nix-build config -o combined --no-out-link)/glove80.uf2 .

