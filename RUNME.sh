if [ ! -d "../.vim/bundle/Vundle.vim" ]
then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [ -d "../.vim/colors" ]
then
    cp -r colors/ ../.vim/colors/
else
    mkdir ../.vim/colors 
    cp -r colors/ ../.vim/colors/
fi

if [ -d "../.vim/autoload" ]
then
    cp -r autoload/ ../.vim/autoload/
else
    mkdir ../.vim/autoload/
    cp -r autoload/ ../.vim/autoload/
fi
