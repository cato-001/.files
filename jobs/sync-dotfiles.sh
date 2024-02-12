cd ~/.files/

git pull
stow .

git add --all
git commit -m "update dotfiles"
git push

cd ~
