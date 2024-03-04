export HOME2="/mnt/c/Users/rhyth"
alias cdd="cd \$(z | fzf --tiebreak=index --tac | awk '{print \$2}' | grep '^' || find ~ -type d | fzf | grep '^' || pwd)"
function his() {
    l=$(history | fzf --tiebreak=index --tac | awk '{$1=""; print $0}')
    eval "$l"
    history -s $l
}
alias xman="cat ~/command_list.txt | fzf | xargs -I{} bash -c 'man {} || {} --help | less'"
function vact() {
source $1"/bin/activate"
}
