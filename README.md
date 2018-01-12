Vanclief dotfiles
===================


Requirements
------------

* Arch Linux

* i3

* vim

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

After the initial installation, you can run `rcup` without the one-time variable
`RCRC` being set (`rcup` will symlink the repo's `rcrc` to `~/.rcrc` for future
runs of `rcup`). [See
example](https://github.com/thoughtbot/dotfiles/blob/master/rcrc).

This command will create symlinks for config files in your home directory.
Setting the `RCRC` environment variable tells `rcup` to use standard
configuration options:

* Exclude the `README.md` and `LICENSE` files, which are part of
  the `dotfiles` repository but do not need to be symlinked in.
* Give precedence to personal overrides which by default are placed in
  `~/dotfiles-local`

You can safely run `rcup` multiple times to update:

    rcup

You should run `rcup` after pulling a new version of the repository to symlink
any new files in the repository.

