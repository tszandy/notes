# Node Package Manager
npm

npm init --yes # initialize npm package manager document.

npm install -g grunt-cli

npm install -g nodemon

npm install ${package_name} --save-dev

npm install ${package_name} --save

npm install ${package_name}@${package_version} --save

# npm remove local package
rm -rf node_modules/

# list local dependency
npm list

# list global dependency
npm list -g

"npm install" === "npm i"

npm uninstall ${package_name}

Usage: npm <command>

# install typescript 
npm install typescript --save-dev

# run typescript compiler 
npx tsc

where <command> is one of:
    access, adduser, audit, bin, bugs, c, cache, ci, cit,
    clean-install, clean-install-test, completion, config,
    create, ddp, dedupe, deprecate, dist-tag, docs, doctor,
    edit, explore, fund, get, help, help-search, hook, i, init,
    install, install-ci-test, install-test, it, link, list, ln,
    login, logout, ls, org, outdated, owner, pack, ping, prefix,
    profile, prune, publish, rb, rebuild, repo, restart, root,
    run, run-script, s, se, search, set, shrinkwrap, star,
    stars, start, stop, t, team, test, token, tst, un,
    uninstall, unpublish, unstar, up, update, v, version, view,
    whoami

npm <command> -h  quick help on <command>
npm -l            display full usage info
npm help <term>   search for help on <term>
npm help npm      involved overview

Specify configs in the ini-formatted file:
    /Users/weixie/.npmrc
or on the command line via: npm <command> --key value
Config info can be viewed via: npm help config

npm@6.14.17 /opt/homebrew/Cellar/node@14/14.21.2/lib/node_modules/npm




npm install (with no args, in package dir)
npm install [<@scope>/]<pkg>
npm install [<@scope>/]<pkg>@<tag>
npm install [<@scope>/]<pkg>@<version>
npm install [<@scope>/]<pkg>@<version range>
npm install <alias>@npm:<name>
npm install <folder>
npm install <tarball file>
npm install <tarball url>
npm install <git:// url>
npm install <github username>/<github project>

aliases: i, isntall, add
common options: [--save-prod|--save-dev|--save-optional] [--save-exact] [--no-save]


In global mode (ie, with -g or --global appended to the command), it installs the current package context (ie, the current working directory) as a global package.

With the --production flag (or when the NODE_ENV environment variable is set to production), npm will not install modules listed in devDependencies. To install all modules listed in both dependencies and devDependencies when NODE_ENV environment variable is set to production, you can use --production=false.


# npm global home location
## windows
%UserProfile%/AppData/Roaming/npm/node_modules
