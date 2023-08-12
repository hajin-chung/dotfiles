
## Neovim setup

1. build neovim from source

since v9.1.0 had some issues on vim.lsp, had to build v9.0.0

reference
- (github docs)[https://github.com/neovim/neovim/wiki/Building-Neovim]
- (github issue)[https://github.com/neovim/neovim/issues/23545]

```sh
## setup neovim and copilot
mkdir $HOME/code_local
cd $HOME/code_local
                                                                                                                                                                                                                                                     
sudo apt-get install -y libncurses-dev gettext
wget https://github.com/vim/vim/archive/refs/tags/v9.0.1527.zip
unzip v9.0.1527.zip
pushd vim-9.0.1527
make -j8
sudo make install
popd
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
wget https://github.com/neovim/neovim/archive/refs/tags/v0.9.0.zip                                                                                                                                                                                                              
unzip v0.9.0.zip                                                                                                                                                                                                                                                                
pushd neovim-0.9.0                                                                                                                                                                                                                                                              
make -j8                                                                                                                                                                                                                                                                        
sudo make install
popd       
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
sudo apt-get update                                                                                                                                                                                                                                                             
curl -sL https://deb.nodesource.com/setup_17.x | sudo bash -                                                                                                                                                                                                                    
curl --silent https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -                                                                                                                                                                                         
sudo chmod a+r "/usr/share/keyrings/nodesource.gpg"                                                                                                                                                                                                            
curl -sL https://deb.nodesource.com/setup_17.x | sudo bash -                                                                                                                                                                                                                    
sudo apt-get install -y nodejs                                                                                                                                                                                                                                                  
git clone https://github.com/github/copilot.vim ~/.config/nvim/pack/github/start/copilot.vim
```

2. copy nvim config files into .config

```sh
cp -r nvim ~/.config/
```

3. install Packer


