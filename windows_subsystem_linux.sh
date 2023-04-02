# Lists distributions (Show detailed information about all distributions.)
wsl -l -v


Usage: wsl.exe [Argument] [Options...] [CommandLine]

Arguments for running Linux binaries:

    If no command line is provided, wsl.exe launches the default shell.

    --exec, -e <CommandLine>
        Execute the specified command without using the default Linux shell.

    --
        Pass the remaining command line as is.

Options:
    --cd <Directory>
        Sets the specified directory as the current working directory.
        If ~ is used the Linux user's home path will be used. If the path begins
        with a / character, it will be interpreted as an absolute Linux path.
        Otherwise, the value must be an absolute Windows path.

    --distribution, -d <Distro>
        Run the specified distribution.

    --user, -u <UserName>
        Run as the specified user.

Arguments for managing Windows Subsystem for Linux:

    --help
        Display usage information.

    --install [Options]
        Install additional Windows Subsystem for Linux distributions.
        For a list of valid distributions, use 'wsl --list --online'.

        Options:
            --distribution, -d [Argument]
                Downloads and installs a distribution by name.

                Arguments:
                    A valid distribution name (not case sensitive).

                Examples:
                    wsl --install -d Ubuntu
                    wsl --install --distribution Debian

    --set-default-version <Version>
        Changes the default install version for new distributions.

    --shutdown
        Immediately terminates all running distributions and the WSL 2
        lightweight utility virtual machine.

    --status
        Show the status of Windows Subsystem for Linux.

    --update [Options]
        If no options are specified, the WSL 2 kernel will be updated
        to the latest version.

        Options:
            --rollback
                Revert to the previous version of the WSL 2 kernel.

            --inbox
                Only update the inbox WSL 2 kernel. Do not install WSL from the Microsoft Store.

            --web-download
                Download the most recent version of WSL from the internet instead of the Microsoft Store.

Arguments for managing distributions in Windows Subsystem for Linux:

    --export <Distro> <FileName>
        Exports the distribution to a tar file.
        The filename can be - for standard output.

    --import <Distro> <InstallLocation> <FileName> [Options]
        Imports the specified tar file as a new distribution.
        The filename can be - for standard input.

        Options:
            --version <Version>
                Specifies the version to use for the new distribution.

    --list, -l [Options]
        Lists distributions.

        Options:
            --all
                List all distributions, including distributions that are
                currently being installed or uninstalled.

            --running
                List only distributions that are currently running.

            --quiet, -q
                Only show distribution names.

            --verbose, -v
                Show detailed information about all distributions.

            --online, -o
                Displays a list of available distributions for install with 'wsl --install'.

    --set-default, -s <Distro>
        Sets the distribution as the default.

    --set-version <Distro> <Version>
        Changes the version of the specified distribution.

    --terminate, -t <Distro>
        Terminates the specified distribution.

    --unregister <Distro>
        Unregisters the distribution and deletes the root filesystem.