import subprocess

subprocess.call(["ls","-l"])

subprocess.PIPE

# Popen(args, bufsize=-1, executable=None, stdin=None, stdout=None, stderr=None, preexec_fn=None, close_fds=True, shell=False, cwd=None, env=None, universal_newlines=None, startupinfo=None, creationflags=0, restore_signals=True, start_new_session=False, pass_fds=(), *, encoding=None, errors=None, text=None)
command_1 = subprocess.Popen(["ls","-l"],stdout=subprocess.PIPE)
result = subprocess.Popen(["grep","tmux"],stdin = command_1.stdout,stdout = subprocess.PIPE).communicate()[0]

import json
p = subprocess.Popen("Powershell Get-WindowsFeature -Name NET-Framework-Core|ConvertTo-Json",stdout = subprocess.PIPE)
out,err = p.communicate()
obj = json.loads(out)

from subprocess import list2cmdline
