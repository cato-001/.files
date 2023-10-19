script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Create SymLinks
ln -s "$script_dir"/ideavimrc.symlink ~/.ideavimrc
ln -s "$script_dir"/bashrc.symlink ~/.bashrc
ln -s "$script_dir"/bash_aliases.symlink ~/.bash_aliases
ln -s "$script_dir"/bash_logout.symlink ~/.bash_aliases
ln -s "$script_dir"/vimrc.symlink ~/.vimrc

echo "symlinks created!"
