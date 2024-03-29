function exit_if_unsuccessfull() {
    if [[ $1 -eq 1 ]]; then
        echo -e "Unsuccessfull command and now exiting without completing setup\n"
        exit 1
    fi
}

echo -e "Setting up enviourment\n"

echo -e '\n' >> ~/.bashrc &&
cd shell-scripts &&
cp -rfa . ~/ &&
cd .. &&
DIR=$(pwd)

exit_if_unsuccessfull $?

echo -e '# custom setup d41d8cd98f00b204e9800998ecf8427e\n' >> ~/.bashrc

    # setting scripts
while getopts "zgeh" opt; do
    case $opt in
        z)
            echo -e "Setting up z.sh\n"
            echo -e ". ~/shell-scripts/z.sh\n" >> ~/.bashrc
            exit_if_unsuccessfull $?
            ;;
        g)
            echo -e "Setting up .git-prompt.sh\n"
            echo -e "source ~/shell-scripts/.git-prompt.sh\n" >> ~/.bashrc &&
            echo "PS1='\[\e[32;1m\]\u\[\e[97m\]:\[\e[34m\]\W\[\e[36m\]\$(__git_ps1 \" (%s)\")\[\e[97m\]\$\[\e[0m\] '" >> ~/.bashrc &&
            echo -e "\n"
            exit_if_unsuccessfull $?
            ;;
        e)
            echo -e "Setting up emscripten\n"
            cd ~ &&
            git clone https://github.com/emscripten-core/emsdk.git &&
            cd  emsdk &&
            git pull &&
            ./emsdk install latest &&
            ./emsdk activate latest &&
            source ./emsdk_env.sh &&
            cd $DIR &&
            echo -e "source ~/emsdk/emsdk_env.sh &> /dev/null\n" >> ~/.bashrc
            exit_if_unsuccessfull $?
            ;;
        h)            
            echo -e "Setting up Home2, aliases and vact\n"
            echo "source ~/shell-scripts/alias.sh" >> ~/.bashrc
            exit_if_unsuccessfull $?

    esac
done            

echo -e '# custom setup d41d8cd98f00b204e9800998ecf8427e\n' >> ~/.bashrc

source ~/.bashrc
