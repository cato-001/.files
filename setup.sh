script_dir=$( cd "$( dirname '${BASH_SOURCE[0]}' )" && pwd )

# Create SymLinks
ln -sf "$script_dir"/ideavimrc.symlink ~/.ideavimrc
ln -sf "$script_dir"/bashrc.symlink ~/.bashrc
ln -sf "$script_dir"/bash_aliases.symlink ~/.bash_aliases
ln -sf "$script_dir"/bash_logout.symlink ~/.bash_logout
ln -sf "$script_dir"/vimrc.symlink ~/.vimrc
ln -sf "$script_dir"/tmux.symlink ~/.tmux.conf

echo "symlinks created!"
