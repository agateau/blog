pub_date: 2016-02-19 22:58:01 +01:00
public: true
tags: [github, opinion, git, hosting]
title: GitHub lock-in?
summary: |
    Some thoughts on the recent buzz around GitHub and why I think GitHub may not be as evil as some like to say.

There has been [a lot][noise1] [of noise][noise2] recently on how GitHub is bad, and how developers should stop using it.

[noise1]: http://blog.schiessle.org/2016/02/12/the-next-generation-of-code-hosting-platforms/?utm_content=buffer1b401&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer
[noise2]: http://uk.businessinsider.com/github-the-full-inside-story-2016-2?r=US&IR=T

## GitHub is proprietary, therefore it is evil

Most of GitHub is proprietary. That is true, but GitHub is, in my opinion, an "ethical" proprietary software company, if such thing can exist:

They have been running an open-core based, sustainable business model from day 1: you get most features for free, you pay for some of them (private repositories, self-hosted instances...). They do not rely on ads, or on selling your personal information to some creepy entities, or on bundling malware into binary installers (SourceForge used to do that, nice to see the new owners are [getting rid of that abomination][sfdevshare])

They produce and contribute to free software: they created Jekyll, they work on Git itself, they sponsor Git conferences...

They won market share by providing great services, not (as far as I know) by using rogue techniques to eliminate competitors.

[sfdevshare]: https://sourceforge.net/blog/sourceforge-acquisition-and-future-plans/

## Vendor lock-in

### Migrating is a lot of work

I read time and time again that migrating from GitHub is difficult. But how much of this difficulty comes from GitHub itself?

- Source code are git repositories, just clone them and you have all your data
- Wikis can be cloned as git repositories as well (this also means you can edit them offline, really nice)
- There is a REST API to access issues, it is straightforward to get all of them (I did this in the past to migrate the issues of a GitHub project to KDE Bugzilla)

So yes, all your data is accessible, as long as you are willing to do the work. A migration is a lot of work. You will have to:

- Republish your repositories
- Migrate your issues to a different format while trying to minimize data loss
- Migrate wikis, possibly converting from one markup to another
- Recreate all service integrations you were relying on
- Update as much links as possible to avoid 404 errors
- Get your contributors to retrain themselves
- Other tasks I have forgotten

It's hard, but the fact that GitHub is proprietary does not make it harder to migrate away from it. It would be just as much work to migrate from a free-software powered project host.

There is therefore no vendor lock-in, it's just that like any migration, it takes time and dedication to do it right.

A competitor willing to make it easy for GitHub project maintainers to migrate to their services could actually make use of GitHub APIs and provide an automated migration system.

Note: I wrote "your data is accessible", but actually I should rather write "your data is *currently* accessible". Theoretically, nothing prevents GitHub from removing programmatic access to parts of the data they host. That is the greatest danger of not self-hosting your data, and it's true for any hosting platform, even if its software is free: it does not help that the software is free if someone unplugs the servers or hides them behind a paywall. If the data hosted on GitHub (or on any external service) is critical for you, then you'd better setup periodic scripts to backup everything. This way the minute your host goes bad and removes access to your data, you can switch to another service or start hosting your own.

### We have found the problem, and it is us

The second obstacle preventing projects from migrating away from GitHub is user convenience. Developers prefer hosting their projects on GitHub for similar reasons Internet shops open a merchant account on Amazon: potential customers are already there, and they are used to its UI. It is sad though that for many developers leaving the comfort zone of GitHub is not an option, if you want to be a good developer, I consider it a prerequisite to always be willing to learn. If learning how to operate on another code host is too challenging, well, what can I say...

Think I am exaggerating? Read the comments on the [ESLint issue where they discuss migrating away from GitHub][eslint], some of them are disheartening:

> As a fairly nascent developer, I think one of the things that I / people with my experience level care about is establishing credibility / getting credit for open source contributions, and whether we like it or not, github has become the first place to look whenever someone is trying to judge someone's contributions. It shows contribution activity loud and clear on profile pages, and this type of attribution is really helpful / important for new contributors to prove their mettle in the open source world. I feel that not having this kind of attribution would not provide enough motivation / demoralize a lot of people who would want to contribute, and I think this kind of lack of motivation and enthusiasm can be to the detriment of the project in the long term.
>
> Given those considetations, I would really hate to see this project leave Github.

[eslint]: https://github.com/eslint/eslint/issues/5205

I am not going to pretend I never used my contributions to free software to land jobs. But it would never come to my mind to have the arrogance of requesting that a project stays hosted on a particular service because it would make it harder for me to show off if they moved away! Is it not possible to put links in a resume anymore?

## Alternatives

People are also wary of GitHub because of the increased monoculture which results from it having no perceived direct competitors. Again, GitHub has not removed any option from people, they won market share by providing great services people enjoyed using. When/if a competitor gains more traction by providing better services we might see a more diverse project hosting ecosystem. I am looking forward to this, because I think monoculture is indeed dangerous, and a bit more competition on this domain can only benefit us developers. But the ball is in the competitors' hands.

It's not like the field is empty though: there are already plenty of alternative hosting solutions available: [GitLab][], [BitBucket][], Google [is building something][gg], maybe even [SourceForge][] will become less creepy now that it has a new owner. Large free-software communities also often offer hosting projects: the KDE sysadmins do awesome work on KDE infrastructure, GNOME, Debian and others can host your projects as well... Wikipedia has a nice list of [source code hosting facilities][wk].

Alternatively, there are plenty of existing solutions to host your own repositories if you are willing to go this way. If you want a full-blown alternative, I heard GitLab is great. [Gitolite][] is nice for simpler needs. You can also just push bare repositories to a remote server accessible over SSH (my solution for personal needs).

## Conclusion

I believe GitHub is not the problem: there are plenty of alternatives to host your projects if GitHub services do not match your criteria for your new project. GitHub does not actively prevent you from moving away from them if you are willing to do so. You just have to walk the walk.

[wk]: https://en.wikipedia.org/wiki/Comparison_of_source_code_hosting_facilities
[GitLab]: http://gitlab.com
[BitBucket]: http://bitbucket.org
[SourceForge]: http://sourceforge.net
[gg]: https://cloud.google.com/source-repositories/
[Gitolite]: http://gitolite.com/gitolite/

<a href="https://flattr.com/submit/auto?fid=4j3ek3&url=http%3A%2F%2Fagateau.com%2F2016%2Fgithub-lock-in" target="_blank"><img src="//button.flattr.com/flattr-badge-large.png" alt="Flattr this" title="Flattr this" border="0"></a>
