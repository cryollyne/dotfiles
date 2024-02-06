#!/usr/bin/env bash
DOTFILEROOT=$HOME/.dotfiles

if ! command -v stow &>/dev/null ; then
    echo "install gnu stow"
    exit 1
fi

install() (
    cd $DOTFILEROOT
    stow home/
)

backup() (
    cd $DOTFILEROOT
    a="$(stow -n home/ 2>&1 | grep '\*' | grep -oP '(?<=: ).*')"
    BACKUPDIR=$DOTFILEROOT/backup/$(date --rfc-3339=seconds -u | sed 's/\s/_/g')
    for file in $a; do
        mkdir -p $BACKUPDIR/$(dirname $file)
        echo moving $HOME/$file "->" $BACKUPDIR/$file
        mv $HOME/$file $BACKUPDIR/$file
    done
)

backup
install
