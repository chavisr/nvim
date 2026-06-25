```sh
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
tar -xzf nvim-linux-x86_64.tar.gz -C ~/.local/

ln -s ~/.local/nvim-linux-x86_64/bin/nvim ~/.local/bin/nvim

git clone https://github.com/chavisr/nvim ~/.config/nvim
```

```sh
curl -L https://github.com/nicowillis/git-static/releases/download/v2.39.0/git-linux-x86_64 -o ~/.local/bin/git
chmod +x ~/.local/bin/git
```
