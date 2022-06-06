### neovim & vim-plug
**Install neovim**
```
sudo apt install neovim
```
**Create directory**
```
mkdir ~/.config/nvim
```
**Install vim-plug**
```
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
**vim-plug commands**
```
:PlugStatus
:plugInstall
:PlugUpdate
:PlugDiff
:PlugClean
:PlugUpgrade
```