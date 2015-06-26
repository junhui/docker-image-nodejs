
sudo apt-get -y install zsh tmux

chsh -s `which zsh`

curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

cd ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

zshPlugins="plugins=(git zsh-syntax-highlighting)"

echo "Updating ~/.zshrc to make zsh support syntax highlighting"
if grep 'plugins=' ~/.zshrc >/dev/null; then
  sudo sed -i "s/^plugins=(.*\$/$zshPlugins/" ~/.zshrc
else
  sudo sh -c "echo '$zshPlugins' >> ~/.zshrc"
fi

# store all solarized files in one place
mkdir ~/.solarized
cd ~/.solarized
 
# http://www.webupd8.org/2011/04/solarized-must-have-color-paletter-for.html
git clone https://github.com/seebi/dircolors-solarized.git
eval `dircolors ~/.solarized/dircolors-solarized/dircolors.256dark`
ln -s ~/.solarized/dircolors-solarized/dircolors.256dark ~/.dir_colors
 
git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git
./gnome-terminal-colors-solarized/install.sh
 
git clone https://github.com/seebi/tmux-colors-solarized.git
echo "
set -g default-terminal \"screen-256color\"
source ~/.solarized/tmux-colors-solarized/tmuxcolors-dark.conf" >> ~/.tmux.conf
