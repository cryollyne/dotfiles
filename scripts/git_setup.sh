#!/usr/bin/env bash
set -e

git config --global core.excludesfile ~/.gitignore

git config --global alias.s 'status'
git config --global alias.tree 'log --graph --oneline --all --pretty=\"%C(blue)%h  %C(green)%as  %C(bold green)%d  %Creset%s\"'
git config --global alias.br 'branch'
git config --global alias.ch 'checkout'
git config --global alias.co 'commit'
git config --global alias.l 'log'
