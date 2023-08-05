if [ ! -d "../.vim/bundle/Vundle.vim"  ]
then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [ -d "../.vim/colors"  ]
then
    cp onedark.vim ../.vim/colors/onedark.vim
else
    mkdir ../.vim/colors/
    cp onedark.vim ../.vim/colors/onedark.vim
fi

if [ -d "../.vim/autoload"  ]
then
    cp onedark.vim ../.vim/autoload/onedark.vim
else
    mkdir ../.vim/autoload/
    cp onedark.vim ../.vim/autoload/onedark.vim
fi

cp .vimrc ../.vimrc
cp .bashrc ../.bashrc
cp .gitconfig ../.gitconfig
cp .tmux.conf ../.tmux.conf
cp .zshrc ../.zshrc
cp .aliases ../.aliases

exit 0
