#!/bin/zsh
set -eo pipefail

if test -d $HOME/.oh-my-zsh; then
	test -d $HOME/.oh-my-zsh.backups || mkdir $HOME/.oh-my-zsh.backups
	mv $HOME/.oh-my-zsh "$HOME/.oh-my-zsh.backups/$(date +'%s')"
fi

echo -e "\nInstalling oh-my-zsh...\n"
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "zsh installed"
test -z "${BREWTSTRAP}" || ./brew.sh
echo -e "\nInstalling rc files...\n"
cp -r ./.{*{rc,config,_profile},vim,macos} $HOME/
echo "sudo chown root:wheel sudo_local"
chmod 444 sudo_local && sudo chown root:wheel sudo_local && sudo cp sudo_local /etc/pam.d/
echo "source ~/.zsh_profile" >> $HOME/.zshrc
exec zsh -l
