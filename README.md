Vanclief dotfiles
===================


Requirements
------------

* Arch Linux

* i3

* vim

* rofi

* dunsc

* Powerline (pip install powerline-status)

* Oh-My-Zsh (curl -L http://install.ohmyz.sh | sh)

* z (https://github.com/rupa/z/blob/master/z.sh)


Install
-------

Clone onto your system:

    git clone git://github.com/vanclief/dotfiles.git ~/.dotfiles
    
Install yaourt
    ` ` ` 
    sudo vim /etc/pacman.conf
    ` ` `
    ` ` `
    [archlinuxfr]
    SigLevel = Never
    Server = http://repo.archlinux.fr/$arch
    ` ` `

Install [rcm](https://github.com/thoughtbot/rcm):

    yaourt -Sy rcm

Install the dotfiles:

    env RCRC=$HOME/.dotfiles/rcrc rcup

Run `rcup` to update:

    rcup

You should run `rcup` after pulling a new version of the repository to symlink
any new files in the repository.

