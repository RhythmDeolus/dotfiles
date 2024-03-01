cat ~/.bashrc > ~/.backup_bashrc
v=$(cat ~/.bashrc | awk '{sub(/# custom setup d41d8cd98f00b204e9800998ecf8427e.*# custom setup d41d8cd98f00b204e9800998ecf8427e\n/, "", $0); print $0}' RS="\0")
echo "$v" > ~/.bashrc
rm -rf ~/emsdk

rm -rf ~/shell-scripts

source ~/.bashrc
