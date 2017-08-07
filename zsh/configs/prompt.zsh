# modify the prompt to contain git branch name if applicable
# git_prompt_info() {
#  current_branch=$(git current-branch 2> /dev/null)
#  if [[ -n $current_branch ]]; then
   # echo " %{$fg_bold[green]%}$current_branch%{$reset_color%}"
#  fi
# }
#
#setopt promptsubst
#
# PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[red]%}%c%{$reset_color%}$(git_prompt_info) %# '
#

# PS1='%{%f%b%k%}$(build_prompt)'
