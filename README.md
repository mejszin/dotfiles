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
### GNU Screen
**Start screen session with tabs**
```
screen -AdmS myshell -t tab0 bash
screen -S myshell -X screen -t "My 1st Title" sudo -u louis ./my_first_script.sh
screen -S myshell -X screen -t "My 2nd Title" sudo -u louis ./my_second_script.sh
```
