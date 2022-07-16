public: true
pub_date: 2022-07-14 20:34:53 +01:00
tags: [dev, git, tips, pko]
title: Your git log is not a changelog!

When you maintain a project, publishing new releases can quickly become a chore, so naturally one tries to automate it as much as possible.

One release step which is often automated is updating the changelog. We already have git commit messages, so let's gather all the messages since the last tag and "Voilà!" changelog entries for the new version!

There is however a problem with this idea:

<big>**Git commit messages and changelogs do not have the same target audience.**</big>

<!-- break -->

The changelog targets your users. It must answer questions like:

- "What cool new feature is in this version?"
- "Is this annoying bug fixed?"
- "Is it safe to upgrade, or do I need to adjust my code/workflow to this new version?"

Git commit messages, on the other hand, target your project contributors. And most often contributors look at git log messages for one reason: they are trying to understand the reason for a change. This means the most important question git commit messages must answer one question: **why was this change made?** Sometimes the answer to this question also answers a user question, for example when  the change fixes a bug reported on the current version. Often it does not: users do not care about changes improving the CI setup, refactorings, test coverage improvements, or fixes for a regression introduced *after* the latest release.

## "Just squash commits! This way each commit match a changelog entry"

I think this is a mistake. While it's true that you can generate a more useful changelog using squashed commits, you also create a less useful git history. In other words: you optimize your commit messages for your users, but the target audience for your commit messages are contributors!

I am not against rewriting commits, but I believe one must do so to make them easier to understand for other contributors, not to make generating the changelog easier. When you track a bug or a behavior change with tools like `git bisect`, you get a much more precise result with fine-grained commits than with squashed commits.

## "But if you don't squash commits, then the git history is full of merge commits!"

Some people dislike merge commits. I don't. I wish git had a way to define a "meta-commit" to group related commits together, but it does not have that. Merge commits can simulate this to a certain extent though.

Consider a project where 3 features F1, F2 and F3 have been implemented. If the project used squashed commits, the history would look like this:

```
o---o---o---o
    F1  F2  F3
```

On a project using merge commits, it would look like this instead:

```
  o--o   o--o--o   o
 /    \ /       \ / \
o------o---------o---o
       F1        F2  F3
```

You can see how the merge commits group the work on F1, F2 and F3, giving you more details as a contributor about how they came to be. F3 is only one commit, so it could have been merged without a merge commit, but depending on the way your project works, the merge commit can provide valuable information, even for a single commit: for example it may help you find the pull/merge request created for this commit. The discussions on the request may provide more answers to the "why?" question the commit message is expected to answer.

## "But then the git history is messy!"

If there is more than one person working on a project, the history from the previous section may end up looking like this instead:

```
  o--o   ----o-----
 /    \ /          \
o------o-------o----o
 \     F1     /F2   F3
  \          /
   o--o--o--o
```

If that bothers you, you can always ask contributors to rebase before merging. As long as the branch is merged using a merge commit (use `git merge --no-ff` to ensure it), you can ensure you get a nice [alligator git history][alligator].

[alligator]: https://euroquis.nl/blabla/2019/08/09/git-alligator.html

## "But writing changelogs by hand is tedious!"

I used to do that, and I agree it is tedious. It's more efficient to update your changelog as you go, when the changes are fresh in your mind.

There are tools to help with this. I recently started using [Changie][] to prepare [Pixel Wheels][] changelog. There are other tools like this, or you can build your own. This is what Python core developers did with [Blurb][].

[Blurb]: https://pypi.org/project/blurb/

A tool like Changie helps, but it still requires discipline to ensure one does not forget to use it when code is merged in the main branch. You can help contributors remember to use it by making it an item in your pull/merge request template check list. You can even go further and make the CI rejects merges unless a changelog entry is present. You would need a way to mark a branch has not needing a changelog entry though, for example a keyword in a commit message or in the pull/merge request body.

[Changie]: https://github.com/miniscruff/changie
[Pixel Wheels]: /projects/pixelwheels

## Conclusion

Git commit messages and changelogs have different target audiences.

Do not lessen the value of your git history by coercing commits to generate a more useful changelog.

Use tools like Changie to help you write useful changelog entries as you go.
