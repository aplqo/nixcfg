#!/bin/sh

nix run nixpkgs#nodePackages.node2nix -- -i ./extensions.json -c ./composition.nix
