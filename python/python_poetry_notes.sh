# install powershell
(Invoke-WebRequest -Uri https://install.python-poetry.org -UseBasicParsing).Content | py -

# poetry create new package
poetry new ${package_name}


