# remove corrupted reference files
rm -f .git/logs/refs/remotes/<remote-name>/<branch>

# remove corresponding refs
rm -f .git/refs/remotes/<remote-name>/<branch>
