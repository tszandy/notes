go is a tool for managing Go source code.

Usage:

        go <command> [arguments]

The commands are:

        bug         start a bug report
        build       compile packages and dependencies
        clean       remove object files and cached files
        doc         show documentation for package or symbol
        env         print Go environment information
        fix         update packages to use new APIs
        fmt         gofmt (reformat) package sources
        generate    generate Go files by processing source
        get         add dependencies to current module and install them
        install     compile and install packages and dependencies
        list        list packages or modules
        mod         module maintenance
        work        workspace maintenance
        run         compile and run Go program
        test        test packages
        tool        run specified go tool
        version     print Go version
        vet         report likely mistakes in packages

Use "go help <command>" for more information about a command.

Additional help topics:

        buildconstraint build constraints
        buildmode       build modes
        c               calling between Go and C
        cache           build and test caching
        environment     environment variables
        filetype        file types
        go.mod          the go.mod file
        gopath          GOPATH environment variable
        gopath-get      legacy GOPATH go get
        goproxy         module proxy protocol
        importpath      import path syntax
        modules         modules, module versions, and more
        module-get      module-aware go get
        module-auth     module authentication using go.sum
        packages        package lists and patterns
        private         configuration for downloading non-public code
        testflag        testing flags
        testfunc        testing functions
        vcs             controlling version control with GOVCS

Use "go help <topic>" for more information about that topic.




usage: go get [-t] [-u] [-v] [build flags] [packages]

Get resolves its command-line arguments to packages at specific module versions,
updates go.mod to require those versions, and downloads source code into the
module cache.

To add a dependency for a package or upgrade it to its latest version:

        go get example.com/pkg

To upgrade or downgrade a package to a specific version:

        go get example.com/pkg@v1.2.3

To remove a dependency on a module and downgrade modules that require it:

        go get example.com/mod@none

To upgrade the minimum required Go version to the latest released Go version:

        go get go@latest

To upgrade the Go toolchain to the latest patch release of the current Go toolchain:

        go get toolchain@patch

See https://golang.org/ref/mod#go-get for details.

In earlier versions of Go, 'go get' was used to build and install packages.
Now, 'go get' is dedicated to adjusting dependencies in go.mod. 'go install'
may be used to build and install commands instead. When a version is specified,
'go install' runs in module-aware mode and ignores the go.mod file in the
current directory. For example:

        go install example.com/pkg@v1.2.3
        go install example.com/pkg@latest

See 'go help install' or https://golang.org/ref/mod#go-install for details.

'go get' accepts the following flags.

The -t flag instructs get to consider modules needed to build tests of
packages specified on the command line.

The -u flag instructs get to update modules providing dependencies
of packages named on the command line to use newer minor or patch
releases when available.

The -u=patch flag (not -u patch) also instructs get to update dependencies,
but changes the default to select patch releases.

When the -t and -u flags are used together, get will update
test dependencies as well.

The -x flag prints commands as they are executed. This is useful for
debugging version control commands when a module is downloaded directly
from a repository.

For more about modules, see https://golang.org/ref/mod.

For more about using 'go get' to update the minimum Go version and
suggested Go toolchain, see https://go.dev/doc/toolchain.

For more about specifying packages, see 'go help packages'.

This text describes the behavior of get using modules to manage source
code and dependencies. If instead the go command is running in GOPATH
mode, the details of get's flags and effects change, as does 'go help get'.
See 'go help gopath-get'.

See also: go build, go install, go clean, go mod.