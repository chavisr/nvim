```sh
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
tar -xzf nvim-linux-x86_64.tar.gz -C ~/.local/

mkdir ~/.local/bin
ln -s ~/.local/nvim-linux-x86_64/bin/nvim ~/.local/bin/nvim

git clone https://github.com/chavisr/nvim ~/.config/nvim
```
