export HOME2="/mnt/c/Users/rhyth"
alias cdd="cd \$(z | fzf | awk '{print \$2}' | grep '^' || find ~ -type d | fzf | grep '^' || pwd)"
alias his="\$(history | fzf --tiebreak=index --tac | awk  '{sub(/^\\s[0-9]+\\s/, \"\", \$0); print \$0}')"
function vact() {
source $1"/bin/activate"
}
