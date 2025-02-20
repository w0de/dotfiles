#!/bin/zsh
set -eo pipefail

u=$(whoami)

if test -d $HOME/.oh-my-zsh; then
	test -d $HOME/.oh-my-zsh.backups || mkdir $HOME/.oh-my-zsh.backups
	mv $HOME/.oh-my-zsh "$HOME/.oh-my-zsh.backups/$(date +'%s')"
fi

echo -e "\nInstalling oh-my-zsh...\n"
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "zsh installed"
test -z "${BREWTSTRAP}" || ./brew.sh
echo -e "\nInstalling rc files...\n"
rm -f $HOME/.{shevek,hitchhiker,quotes}rc
cp -r ./.{*{rc,config,_profile},vim,macos} $HOME/
cp ./.quotes.json $HOME/
echo "sudo chown root:wheel sudo_local"
chmod 444 sudo_local && sudo chown root:wheel sudo_local && sudo cp sudo_local /etc/pam.d/
echo "source $HOME/.zsh_profile" >> $HOME/.zshrc
exec zsh -l
source $HOME/.zsh_profile
