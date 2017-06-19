public: no
pub_date: 2014-12-10 17:44:00 +01:00
tags: [Git, Howto]
title: "Git rewrite author"
disqus: false

## Using git filter-branch

Rewrite the author of all commits, keep tags

    git filter-branch --force \
      --commit-filter 'GIT_AUTHOR_EMAIL=mail@agateau.com GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL git commit-tree "$@"' \
      --tag-name-filter cat

## Using git-rebase (affects only a series of commits)

Set the right author info in the repo.

Run:

    git rebase -i <commit_id> --exec 'git commit --amend --no-edit --reset-author'
