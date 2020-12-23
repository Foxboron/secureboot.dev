#!/bin/bash

GIT_WORKINGDIR=$(mktemp -d .tmp.XXXX)
trap 'rm -rf "$GIT_WORKINGDIR"' EXIT
git worktree add "$GIT_WORKINGDIR" gh-pages
mdbook build -d "$GIT_WORKINGDIR/docs"
(cd "$GIT_WORKINGDIR"; git add .; git commit -am "Updated webpage"; git push origin gh-pages) 
git worktree remove "$GIT_WORKINGDIR"
