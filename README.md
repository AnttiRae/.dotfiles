# .dotfiles
my dotfiles

dotfiles config --local status.showUntrackedFiles no

# ZSH
[Theme](https://github.com/romkatv/powerlevel10k) install:  
`git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k`  
[oh my zsh](https://github.com/ohmyzsh/ohmyzsh) install:   
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`  
zsh plugins installation:  
[Auto suggest](https://github.com/zsh-users/zsh-autosuggestions):  
`git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`  
[Syntax highlight](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md):  
`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`  

# i3 installation  
`sudo pacman -S i3-wm dunst i3status compton rxvt-unicode nitrogen rofi dmenu thunar ranger`
