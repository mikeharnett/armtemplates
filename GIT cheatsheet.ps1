

MAKE CHANGES
Review edits and craf a commit transaction

git status
#Lists all new or modified files to be commited

git add [file]
#Snapshots the file in preparation for versioning

git reset [file]
#Unstages the file, but preserve its contents

$ git diff
#Shows file differences not yet staged

$ git diff --staged
#Shows file differences between staging and the last file version

$ git commit -m "[descriptive message]"
#Records file snapshots permanently in version history



SYNC CHANGES

git fetch [bookmark]
#Downloads all history from the repository bookmark

git merge [bookmark]/[branch]
#Combines bookmark’s branch into current local branch

git push [alias] [branch]
#Uploads all local branch commits to GitHub

git pull
#Downloads bookmark history and incorporates changes