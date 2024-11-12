nodemon
    npm install -g nodemon

sdkman (manage mutiple version of maven and java)

dbeaver

Github Desktop
    Mac:
        https://central.github.com/deployments/desktop/desktop/latest/darwin
    Linux:
        wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
        sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'

Docker Desktop
    https://www.docker.com/products/docker-desktop/

golang
    wget https://go.dev/dl/go1.23.2.src.tar.gz
    sudo tar -C /usr/local -xzf go1.23.2.src.tar.gz

gvm (Go Version Manager)

gosec 

govulncheck

golangci-lint

pm2

tmux

git auto-complete
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
    if [ -f ~/.git-completion.bash ]; then
        . ~/.git-completion.bash
    fi
