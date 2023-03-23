# Install Nvim #

```bash
mkdir -p $HOME/tools/ && cd $HOME/tools/
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
tar zxvf nvim-linux64.tar.gz

```

Add path to `.zshrc`
```bash
echo 'export PATH=$HOME/tools/nvim-linux64/bin:$PATH' >> ~/.zshrc
```

Create nvim configuration file
```bash
touch $HOME/.config/nvim/init.vim

```

# Install vim-plug #

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

```

