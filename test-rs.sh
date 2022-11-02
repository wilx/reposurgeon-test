#!/bin/bash

set -eux

function create_repo() {
    mkdir -vp "$1"
    pushd "$1"
    git init .
    local TXT="$1".txt
    echo "File in $1" >"$TXT"
    git add "$TXT"
    git commit -m "Commit in $1"
    popd
}

rm -rf repos || true
mkdir -v repos
pushd repos
create_repo "repo-1"
create_repo "repo-2"
create_repo "repo-3"
popd

mkdir -vp ./repos/merged

./reposurgeon/reposurgeon <main-script

pushd ./repos/merged

git branch
ls
git log --all --graph
