#!/bin/bash

#Install ZSH and Oh My ZSH
apt update && apt install zsh -y 

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Install p10k theme & autosuggestions & zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
 
echo "source ${ZSH_CUSTOM:-$HOME}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZSH_CUSTOM:-$HOME}/.zshrc

source zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#Edit ZSH config file
sed -i 's\ZSH_THEME="robbyrussell"\ZSH_THEME="powerlevel10k/powerlevel10k"\' /root/.zshrc

sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions)/' /root/.zshrc

#Restart ZSH and set up
exec zsh
