#!/bin/bash 


VIM_ROOT=$HOME/.vim
RANDOM_NR=`shuf -i 1000-90000 -n 1`
INSTALL_ROOT=`pwd`

if [ -d $VIM_ROOT -o -L $VIM_ROOT ]; then 
    mv $VIM_ROOT $HOME/.vim_$RANDOM_NR
fi 

cd 
# Move to ~/.vim
BASE_INSTALL_DIR=`basename $INSTALL_ROOT`
if [ $INSTALL_ROOT != $VIM_ROOT ]; then
    mv $INSTALL_ROOT $VIM_ROOT
    cd $VIM_ROOT 
fi

if [ -f $HOME/.vimrc -o -L $HOME/.vimrc ]; then 
    mv $HOME/.vimrc $HOME/.vimrc_$RANDOM_NR
fi

ln -s $VIM_ROOT/vimrc $HOME/.vimrc

echo -e "Installing vim (Vi Improved) package from repository"
#installinv vim-gnome allows copy/pasting beween vim and system clipboard
sudo apt-get --yes install vim vim-gnome

echo -e "Installing ctags"
sudo apt-get --yes install ctags

echo -e "Installing cscope"
sudo apt-get --yes install cscope

echo -e "Installing pip for python-based dpeendencies"
sudo apt-get --yes install pip

echo -e "Installing python dependencies"
sudo pip install pdb pylint

echo -e "Initializing and checking out plugins submodules: "


git submodule init 
git submodule update 
#git submodule foreach git checkout master
#git submodule foreach git pull origin master
#restore all submodules to the commit which is approved by last master commit
#git submodule update --recursive 

echo -e "Installing vi_overlay" 

while true; do
    yn=y
    #automatically answer 'yes' when 'y' is passed as first parameter
    if [ "$1" != "y" ]; then 
        read -p "Do you wish to install vi_overlay (sudo priviledges are required)? [y/n]: " yn
    fi 
    case $yn in 
        [Yy]* ) echo -e "Yes selected";
                if [ -f /usr/bin/vi.default ]; then 
                    sudo rm /usr/bin/vi.default
                fi
                if [ -f /usr/bin/vim.default ]; then 
                    sudo rm /usr/bin/vim.default
                fi
                sudo ln -s /etc/alternatives/vi /usr/bin/vi.default
                sudo ln -s /etc/alternatives/vim /usr/bin/vim.default 
                if [ -f /usr/bin/vi ]; then 
                    sudo rm /usr/bin/vi 
                fi 
                if [ -f /usr/bin/vim ]; then 
                    sudo rm /usr/bin/vim 
                fi 
                if [ -f $HOME/.vim/vimscripts/vi_overlay ]; then 
                    sudo ln -s $VIM_ROOT/vimscripts/vi_overlay /usr/bin/vi
                    sudo ln -s $VIM_ROOT/vimscripts/vi_overlay /usr/bin/vim 
                    sudo chmod +x $VIM_ROOT/vimscripts/vi_overlay
                else 
                    echo -e "WARNING!!! $HOME/.vim/vimscripts/vi_overlay does not exist..."
                fi
                echo -e "vi_overlay installed.";
                break;;
        [Nn]* ) echo -e "No selected"; break;;
        * ) echo -e "Please select yes or no";;
    esac
done

