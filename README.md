### VIM as IDE

Install + clone latest plugins with the following script (root privileges needed to install packages with apt-get).

Remove or rename your old `.vim` and `.vimrc` before running installation script, otherwise they will be renamed to `.vim(rc)_XXXX`.

```
git clone https://github.com/dalibor-drgon/vim-ide ~/.vim --depth=1
cd ~/.vim && chmod +x ./installVim.sh && ./installVim.sh
```

Some plugins require Source Code Pro font installed in order to correctly
display the interface. Pleace make sure you have installed this font - 
https://github.com/powerline/fonts/tree/master/SourceCodePro

![img1](https://i.imgur.com/RCkThOZ.png)
![img2](https://i.imgur.com/WfooTHC.png)
