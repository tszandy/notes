# git restore local change
git restore .


git restore [<options>] [--source=<branch>] <file>...

    -s, --source <tree-ish>
                          which tree-ish to checkout from
    -S, --staged          restore the index
    -W, --worktree        restore the working tree (default)
    --ignore-unmerged     ignore unmerged entries
    --overlay             use overlay mode
    -q, --quiet           suppress progress reporting
    --recurse-submodules[=<checkout>]
                          control recursive updating of submodules
    --progress            force progress reporting
    -m, --merge           perform a 3-way merge with the new branch
    --conflict <style>    conflict style (merge, diff3, or zdiff3)
    -2, --ours            checkout our version for unmerged files
    -3, --theirs          checkout their version for unmerged files
    -p, --patch           select hunks interactively
    --ignore-skip-worktree-bits
                          do not limit pathspecs to sparse entries only
    --pathspec-from-file <file>
                          read pathspec from file
    --pathspec-file-nul   with --pathspec-from-file, pathspec elements are separated with NUL character