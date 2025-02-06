This is my .config/nvim in MacOs or Linux.

## lsp config 
1. lua-language-server
    * macos: brew install lua-language-server
    * ubuntu: <br>
        sudo apt update <br>
        sudo apt install lua5.4 <br>
        cd <br>
        git clone https://github.com/sumneko/lua-language-server <br>
        git submodule update --init --recursive <br>
        cd 3rd/luamake <br>
        compile/install.sh <br>
        cd lua-language-server <br>
        cd ../.. <br>
        ./3rd/luamake/luamake rebuild <br>
        echo 'export PATH="$HOME/lua-language-server/bin:$PATH"' >> ~/.zshrc
        source ~/.zshrc
2. npm i typescript-language-server -g 
3. npm install -g vscode-html-languageserver-bin
4. 

## Linux noted
Font in default terminal Linux maybe not match with icon, recommend use Nerb font (download and add fonts)
1. Choose & download: (Nerdfonts)[https://www.nerdfonts.com/font-downloads]
2. mkdir -p ~/.fonts 
3. mv /path/to/downloaded/*.otf ~/.fonts
4. fc-cache -f -v 
Choose new font for terminal & reset
