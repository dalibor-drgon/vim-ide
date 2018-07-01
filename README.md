### VIM as IDE

Install + clone latest plugins with script (root privileges needed to install packages with apt-get).

Remove or rename your old `.vim` and `.vimrc` before running install script.
It is important to be in the same directory as the installation script, otherwise it
may not work propertly.

```
git clone https://github.com/dalibor-drgon/vim-ide ~/.vim --depth=1
cd ~/.vim && chmod +x ./installVim.sh && ./installVim.sh
```

Some plugins require Source Code Pro font installed in order to correctly
display the interface. Pleace make sure you have installed this font - 
https://github.com/powerline/fonts/tree/master/SourceCodePro


