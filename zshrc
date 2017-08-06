export TERM=rxvt-unicode

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Rupa Z jump
export _Z_DATA="$HOME/z-data"
source ~/.dotfiles/z/z.sh

if [[ "$(tty)" == '/dev/tty1'  ]]; then
    exec ssh-agent startx
fi

# stty erase '^?'

# Set name of the theme to load.
ZSH_THEME="agnoster"

# ZSH_TMUX_AUTOSTART="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(web-search command-not-found)

# User configuration
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

for function in ~/.zsh/functions/*; do
  source $function
done

# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*(N-.); do
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/pre/*)
          :
          ;;
        "$_dir"/post/*)
          :
          ;;
        *)
          if [ -f $config ]; then
            . $config
          fi
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*(N-.); do
        . $config
      done
    fi
  fi
}
_load_settings "$HOME/.zsh/configs"


[[ -f ~/.aliases ]] && source ~/.aliases

DEFAULT_USER=vanclief

eval `dircolors $HOME/.dircolors`

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

SAVEHIST=HISTSIZE=20000

ensure_tmux_is_running
