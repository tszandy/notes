# list git tag 
git tag

# tag a commit to $tag_name
git tag $tag_name

# push tag to remote
git push ${remote_name} $tag_name
git push origin $tag_name

# delete tag $tag_name
git tag -d $tag_name

# delete tag remotelly $tag_name
git push --delete ${remote_name} $tag_name
git push --delete origin $tag_name
