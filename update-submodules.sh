#!/bin/sh

git submodule foreach 'git fetch origin && git rebase origin/master || echo skip'
