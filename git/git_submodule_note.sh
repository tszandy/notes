# add submodule
git submodule add git@github.com:tszandy/notes.git

# there are two way to get project with submodule.

# initialize your local configuration file
git submodule init
# fetch all the data from that project
git submodule update

# recurse clone submodules
git clone --recurse-submodules git@github.com:tszandy/program.git

# after fetch the change from server show the differece between local and server.
git diff --submodule

#  If you don’t want to type --submodule every time you run git diff, you can set it as the default format by setting the diff.submodule config value to “log”
git config --global diff.submodule log
git diff