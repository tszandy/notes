# limit branches available in this build configuration
+:* # add all the branch
+:<default> # only build the default branch.

# add parameter select
1. go to "Parameters"
2. click "Add new parameter"
3. input 
    "Name" 
    "Kind"
    "Spec" : "Edit"
        "Display" : "Prompt"
        "Type" : "Select"
            Add items to "Edit items" box


# save results as artifact
"Configuration Page" -> "General Settings" -> "Artifact paths" 
${build_path} -> ${host_path}
# example
target/* => test_report

# unique build folder
"Configuration Page" -> "Version Control Settings" -> "Checkout directory" -> select "Custom path" -> %teamcity.agent.home.dir%\${project_name}\%build.counter%