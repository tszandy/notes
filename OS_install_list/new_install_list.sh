node:
    Windows:
        https://nodejs.org/dist/v22.12.0/node-v22.12.0-x64.msi
    Linux:
        sudo apt update
        curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
        sudo apt install -y nodejs

nodemon:
    npm install -g nodemon

bazel:
    Windows:
        choco install bazel
    Mac:
        brew update
        brew install bazel


chrome:
    Linux:
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P ~/Downloads
        sudo dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb

git:
    Linux:
        sudo apt update
        sudo apt install -y git
    Windows:
        https://git-scm.com/downloads

sdkman (manage mutiple version of maven and java)
    install:
        curl -s "https://get.sdkman.io" | bash
    install maven
        sdk install maven 3.8.5
    use maven
        sdk use maven 3.8.5
    list maven version
        sdk list maven
    
    install java:
        sdk install java 11.0.24-amzn
        sdk install java 8.0.422-amzn
    use java:
        sdk use java 11.0.24-amzn
        sdk use java 8.0.422-amzn
    list java version
        sdk list java

rvm ( ruby version manager)
    install:
        sudo apt update
        sudo apt install curl gpg
        gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 62C9E5F4DA300D94AC364F6EF4E25F6B04569C3E
        curl -sSL https://get.rvm.io | bash -s stable
        source ~/.rvm/scripts/rvm

Chocolatey
    Windows
        powershell(admin)
        Set-ExecutionPolicy Bypass -Scope Process -Force
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

dbeaver
    Linux:
        wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
        echo "deb https://dbeaver.io/debs/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/dbeaver.list
        sudo apt update
        sudo apt install dbeaver-ce
    Windows:
        https://dbeaver.io/download/

Github Desktop
    Mac:
        https://central.github.com/deployments/desktop/desktop/latest/darwin
    Linux:
        wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
        sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'
        sudo apt update && sudo apt install github-desktop

Docker Desktop
    https://www.docker.com/products/docker-desktop/

golang
    wget https://go.dev/dl/go1.23.2.src.tar.gz
    sudo tar -C /usr/local -xzf go1.23.2.src.tar.gz

gvm (Go Version Manager)
    Linux/Mac:
        bash <(curl -s https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
        source ~/.gvm/scripts/gvm
    bashrc:
        echo '[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"' >> ~/.bashrc
    zshrc:
        echo '[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"' >> ~/.zshrc
    List Installed go versions:
        gvm list
    Remove go version:
        gvm uninstall go1.22
    List Available go versions:
        gvm listall
    Install go:
        gvm install go1.22.12
        gvm install go1.24.10
    Use go:
        gvm use go1.22.12
        gvm use go1.24.10
        gvm use go1.24.10 --default

gosec
    go install github.com/securego/gosec/v2/cmd/gosec@latest
    gosec ./...

govulncheck
    go install golang.org/x/vuln/cmd/govulncheck@latest
    govulncheck ./...

golangci-lint
    go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
    golangci-lint run
    golangci-lint run --enable=golint --disable=errcheck

pm2
    npm install -g pm2

tmux
    mac:
        brew install tmux
    Linux:
        sudo apt update
        sudo apt install tmux -y

redis:
    Mac:
        brew install redis

git auto-complete
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
    if [ -f ~/.git-completion.bash ]; then
        . ~/.git-completion.bash
    fi

yarn
    Mac:
        brew install yarn
    Linux:
        sudo apt update
        sudo apt install -y yarn
