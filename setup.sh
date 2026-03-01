#!/bin/bash

stow . --target=$HOME/.config --ignore zsh
stow zsh --target=$HOME
