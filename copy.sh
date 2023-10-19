mkdir alacritty
mkdir i3
mkdir nvim

cp -r ~/.config/alacritty/* ./alacritty/
# for wsl alacritty
cp -r /mnt/c/Users/hajin/AppData/Roaming/alacritty/* ./alacritty/
cp -r ~/.config/i3/* ./i3/
cp -r ~/.config/nvim/* ./nvim/
cp -r ~/.config/i3status/* ./i3status/
cp ~/.bash_profile ./
cp ~/.tmux.conf ./
