#!/bin/sh


echo "start deploy";

npm install;

LAST_BRANCH=$GIT_BRANCH;
LAST_COMMIT=$GIT_COMMIT;

# BRANCH有值表示是手动参数化构建
if [ $BRANCH == "dev" ]
then
	echo "in branch dev";
    git checkout dev;
    git pull --rebase;
    LAST_BRANCH="origin/dev";
    LAST_COMMIT=$(git rev-parse HEAD);
elif [ $BRANCH == "master" ]
then
  echo "in branch master";
    git checkout master;
    git pull --rebase;
    LAST_BRANCH="origin/master";
    LAST_COMMIT=$(git rev-parse HEAD);
else echo ""error
fi


echo $LAST_COMMIT;
echo $LAST_BRANCH;

node deploy.js $LAST_COMMIT $LAST_BRANCH;
