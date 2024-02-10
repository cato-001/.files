cd ~/.files/
git pull
stow .

if [[ -n `git status --porcelain` ]]; then
  cd ~
  exit 0
fi

git add --all
git commit -m "update dotfiles"
git push
cd ~
