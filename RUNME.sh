if [ ! -d "../.vim/bundle/Vundle.vim" ]
then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [ -d "../.vim/colors" ]
then
    cp -r colors/ ../.vim/
else
    mkdir ../.vim/colors 
    cp -r colors/ ../.vim/
fi

if [ -d "../.vim/autoload" ]
then
    cp -r autoload/ ../.vim/
else
    mkdir ../.vim/autoload/
    cp -r autoload/ ../.vim/
fi

if [ -d "../.vim/pack" ]
then
    cp -r pack/ ../.vim/
else
    mkdir ../.vim/autoload/
    cp -r pack/ ../.vim/
fi

cp .vimrc ../.vimrc; cp .bashrc ../.bashrc; cp .gitconfig ../.gitconfig; cp .tmux.conf ../.tmux.conf; cp coc-settings.json ../.vim/coc-settings.json
