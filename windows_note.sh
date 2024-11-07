# open app in administrator mode 
ctrl + shif + (left_click/Enter)

# view/switch application
alt + tab

# create new desktop 
ctrl + win + d

# view/switch desktop
win + tab

# delete desktop
win + tab then delete

# show folder or files in desending order always.
selecting View > Details, then selecting Add Columns > ensuring Date Modified is checked, 
and then Sort by > Date Modified > check Decending ... then you go to Folder Options, and View Tab 
and select the Apply to Folders

# delete services
sc delete "$service_name"

# register dll file
regsvr32 ${path_to_dll_file}

# unregister dll file
regsvr32 /u /s ${path_to_dll_file}
/u    unregister server calling dll unregister server.
/s    silent; display no message boxes.

# go to front of page
ctrl + home

# go to end of page
ctrl + end

# Capture Screenshots Win 10
win + shift + s

# create new virtual desktop
ctrl + win + d

# close currect desktop
ctrl + win + f4

# switch desktop
ctrl + win + (left/right)

# move window to other screen
win + shift + (left/right)

# host file location
code c:/Windows/System32/Drivers/etc/hosts

# show all the network share inside this computer
net share

# connect a network drive
net use Z: \\Desktop-av9j78m\d "" /user:Guest /persistent:yes
net use Z: /delete

net use Y: \\Weis-Mac-mini.local\disk_2 /Persistent:Yes
net use Y: /delete

# share a folder
right click a folder -> go to "Share with"

# credential manager
"Control Panel" -> "Credential Manager"
