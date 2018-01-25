Vanclief dotfiles
===================

![cool picture](https://imgur.com/NnbeU2M)

Dotfiles for zsh, i3 and tmux+vim. Running under Arch Linux. Should work with other
distros.

Requirements
------------

* [Your favorite Linux distro](https://github.com/Vanclief/arch-install)

* rofi

* dunsc

* Powerline (pip install powerline-status)

* Oh-My-Zsh (curl -L http://install.ohmyz.sh | sh)

* [z](https://github.com/rupa/z/blob/master/z.sh)


Install
-------

Clone onto your system:

```
git clone git://github.com/vanclief/dotfiles.git ~/.dotfiles
```

Install [rcm](https://github.com/thoughtbot/rcm):

```
yaourt -Sy rcm
```

Install the dotfiles:

```
env RCRC=$HOME/.dotfiles/rcrc rcup
```

Run `rcup` to update:

```
rcup
```

You should run `rcup` after pulling a new version of the repository to symlink
any new files in the repository.

