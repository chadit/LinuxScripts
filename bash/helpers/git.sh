git_cleanup(){
	go clean -x
	git prune && git gc --aggressive
}


git_remove_non_master_branch(){
 git branch | grep -v "qa" | grep -v "prod" | grep -v "develop" | grep -v "staging" | grep -v "master" | xargs git branch -D
}

#diff two files with vim
#vim -d <file1> <file2>


#1. Pull latest on develop
#2. checkout feature branch
#3. git rebase -i origin/develop
#4. view list, reorder if needed (:wq to exit)
#5. resolve conflicts and commit
#6. repeat till none are shown



#reset a single file
## git checkout dbe4cca438a372c0a0685d85b524e6d64094187d -- README.md

# reset a single file from origin/develop
## git checkout origin/develop -- fileName
## git checkout upstream/develop -- README.md

branch_rebase(){
	name=$1
	echo "rebasing branch ($name)"

	if [ "`git branch --list develop`" ]
	then
    	git checkout develop
	else
		git checkout master
	fi

	git pull
	git checkout $name

	if [ "`git branch --list develop`" ]
	then
    	git rebase -i origin/develop
	else
		git rebase -i origin/master
	fi
}


#Create a new branch git and github
branch_create(){
 name=$1
 echo "creating a new branch ($name) for git"
 git pull
 git checkout -b $name
 git push origin $name
 git push --set-upstream origin $name
 echo "completed the creation of the branch"
}

# Reset a branch with Origin
branch_reset(){
 git fetch --prune
 git reset --hard @{upstream}
 git clean -x -d -f
 #git prune && git gc --aggressive
}

branch_prune(){
  git prune && git gc --aggressive
}

branch_delete(){
	name=$1
	echo "remove branch $name"
	if [ "`git branch --list develop`" ]
	then
    	git checkout develop
	else
		git checkout master
	fi

	git push origin --delete $name
 	git branch -D $name
}

git_merge_no_commit(){
	git add -A
	git commit --amend --no-edit
	#git commit -ammend --no-edit
}

git_update_folder(){
   local CURRENTDIR=`pwd`
   local FOLDER=$1
   echo $FOLDER
   if [ -z "$FOLDER" ]; then
   	echo "no value"
   	return
   fi
   cd $FOLDER
	for d in */ ; do
		if [ -d "$d" ]; then
			#git config core.filemode false
        	echo " --- start --- "
  			cd $d && echo `pwd` && branch_reset && git pull && go clean -cache && git prune && git gc --aggressive 
  			echo " --- end --- "
		fi
    	cd $FOLDER
   done
   cd $CURRENTDIR
}