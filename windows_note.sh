# open app in administrator mode 
ctrl + shif + left_click

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
