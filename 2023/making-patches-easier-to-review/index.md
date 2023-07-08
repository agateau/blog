public: true
pub_date: 2023-07-07 20:09:33 +01:00
tags: [tips, git, dev, pko]
title: The Gentle art of making patches easier to review

I recently stumbled upon this excellent 2014 article about patch review by Sage Sharp: [The Gentle Art of Patch Review](https://sage.thesharps.us/2014/09/01/the-gentle-art-of-patch-review/).

I highly recommend reading the whole article, but my main takeaway is that when reviewing code, one should follow three phases:

1. Answer the question: "Good or bad idea?"
2. "Is this architecturally sound?": are the changes done in a way that makes sense given the existing project architecture?
3. only then, can you go all in on nitpicking on naming, spelling mistakes, or ask for the commit history to be cleaned.

I do quite a lot of reviews at work. Sage article made me realize I am often guilty of jumping directly to #3. I have been reflecting on why that happens, and I concluded that it's because it's the path of least resistance.

When I receive a 10,000 line patchset, with 23 commits stepping on each other and no description, the temptation is high to skip phase 1 and 2 and instead say to myself: "I am just going to review the whole patch one line at a time, suggesting new names and micro-optimizations so that it does not look like I clicked on Approve while looking elsewhere".

Since jumping directly to phase 3 is the path of least resistance, when preparing code for review, you should make what you can to reduce the resistance of phase 1 and 2.

<!-- break -->

## Phase 1: Is this a good or bad idea?

For this phase, the place to make review easier is in the description of your patchset: that is the pull request description on GitHub or the body of the mail presenting the patchset in a mail-based workflow.

It does not have to be extra long, just explain in one or two sentences the problem fixed by the patchset, or the new feature it adds... If the changes are significant, then hopefully you discussed them before diving full in: maybe there is an opened issue in the bug tracker, or it was discussed by chat or on a mailing-list. If so, add a link to it to your description.

## Phase 2: Are the changes architecturally sound?

For this phase, there are 3 places to make review easier: patchset description, high-level comments and commit history.

### Patchset description

The patchset description should not paraphrase the patchset, but it should give a high-level overview of the changes.

Let's say as part of your patchset, you moved class Foo from file A to file B. If a reviewer goes directly through the changes (as in, jumps directly to Phase 3), they will have to infer that given that class Foo was removed from A, and a very similar (but maybe not identical!) class Foo was added to B, then it means the patchset moved class Foo from A to B. By listing this move in your description, not only do you save the reviewer the pain of having to infer the move, but you also get the chance to explain *why* you moved this class.

This can be hard. Maybe you do not like writing so this is chore. Well, being able to write prose is a very useful skill, even for the developers! Stepping out of your comfort zone is difficult, but the more you practice, the better your writing will be, the less it will become a shore.

Another reason this can be hard is because you need to write this in English and you think your English is not good enough. As a friend once told me: "The language of Open-Source is broken English", so don't be afraid of this. A broken English description is much more helpful than no description at all, and if someone criticizes your English, well... shame on them! You did the work! And again, practice will improve your English writing too.

### High-level comments

Some coding guidelines require every function, every constant, every class, every module to have documentation. I think those are misguided and often lead to Captain Obvious comments like that:

```python
def activate_rear_engine():
    """Activate the rear engine"""
    ...
```

*Thank you, Captain Obvious*

On the other hand, having a comment attached to a new class or a module is very helpful, especially if it explains how the class works with other classes. Again, keep it high-level.

### Commit history

Ideally changes should be small, but it's not always possible. If the changes are large, chances are they can be split in multiple smaller changes. It is a *lot* easier to review a large patchset if one can go through it commit by commit.

Except... this is a double-edged sword! It is only easier to review if each commit makes sense in isolation and if the set of commits "tell a story". If a commit adds a method to a class and the next commit renames or removes it with a "Oups, that was not a good idea" commit message, then it actually takes longer and is more painful to review commits individually than just reviewing the final state.

This is easier said than done, though: when you are working on your changes, it's common to hit road blocks, change directions, or make unrelated changes. The commit story usually won't be straight and easy to read on your first try.

You know what? That's fine! Just like the first draft of a novel writer is not perfect, so is your commit story. And just like the novel writer, you can edit your story to make it easier to read. Assuming you work with a VCS which lets you rewrite history like Git, once you are done with your first draft, it's time to warm up `git rebase`!

Again, this takes practice to get right, but here are a few tips to get started:

- Splitting commits is more complicated than joining them, so it's simpler to create smaller commits and join them later.
- You can create partial commits using `git add -p` or [git gui](/2016/an-intro-to-git-gui).
- Before starting a large history rewriting session, create a quick backup branch with `git branch backup`. This serves two purposes:
    1. If things go wrong, it's easy to revert to a known good state using `git reset --hard backup` (you can also use `git reflog` to do that, but I find this approach simpler).
    2. When you are done with your rewrite, you can run `git diff backup` to check if the end result is similar enough.
- Maybe some of the changes are unrelated? If it's possible, move them to a separate branch and create a separate patch review for them. The smaller the changes, the easier it is to review.

## Addressing review issues

This part depends on the policy of the project. Some projects prefer if you force-push the fixed patchset as you address issues spotted during review, so that the commit history always looks like what will be committed. Other projects have a no-force-push policy, they will ask you to push fixup commits. This often happens on forges which lack the ability to compare patch-sets (Unfortunately, GitHub is one of them, GitLab is much better in that regard).

If you get asked to do fixup commits, please make sure the history is squashed into a readable and coherent history before the patchset is merged. This greatly simplifies the lives of future developers if they have to revisit the past.

## Wrapping up

To wrap up, to make the life of your reviewer easier (and thus make the review faster and/or more insightful):

- Provide a high-level description of your changes, refer any prior discussion about it.
- Without going all-in and adding comments everywhere, do provide high-level comments for new classes or modules.
- Try to keep your commit history easy to read.

You may also find out during this preparation process that some of your changes are not optimal, or a bug slipped in. When this happens, take the time to fix these issues before posting your patchset for review. In a sense, this process makes you the first reviewer of your code. And the cleaner your patchset, the faster the review!
