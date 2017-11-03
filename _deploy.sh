#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0

echo "Pat ok!"

[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

echo "master branch ok!"

git config --global user.email "tapa741@gmail.com"
git config --global user.name "Taavi Päll"

echo "credentials ok!"

git clone -b gh-pages https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git book-output

echo "git clone ok!"

cd book-output
cp -r ../_book/* ./

echo "cp _book ok!"

git add --all *

echo "git add ok!"

git commit -m "Update the book" || true

echo "commit ok!"

git push -q origin gh-pages

echo "push ok!"
