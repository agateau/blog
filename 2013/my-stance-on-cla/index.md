pub_date: 2013-10-29 16:54:12 +01:00
public: true
tags: [canonical, qt, digia, cla]
title: "My stance on Canonical CLA"
summary: |
    My position regarding Contributor License Agreements in general, and
    Canonical CLA in particular

When Canonical announced contributors to its projects had to transfer their
copyright to the company to get their code in, it created a major backlash.

Back then, the document to sign was called "[Canonical Contributor
Agreement][cca-page]" ([local version][cca]). It asked the contributor to assign
his copyright to Canonical in exchange for a royalty-free and perpetual right to
do whatever the contributor wanted with the contributed code. It had several
problems, in particular it made it possible for Canonical to extend which
contributions were covered by editing a page from their web site.

[cca-page]: https://web.archive.org/web/20110708114351/http://www.canonical.com/contributors
[cca]: Canonical%20Contributor%20Agreement%2C%20ver%202.5.pdf

I wasn't very happy with it, but at that time I was working for Canonical so I
didn't have to ask myself whether I should sign it or not. I did however had to
enforce it, and was not very successful at that task, to say the least.

## The CLA

In July 2011, Canonical started asking contributors to sign a different
document: the "Contributor License Agreement" or CLA. This document shares very
little with the previous one. For starters, you retain your copyright and grant
Canonical a license to sublicense your work. It also defines more precisely the
perimeter of the contribution:

> “Contribution” means any work of authorship that is Submitted by You to Us in
> which You own or assert ownership of the Copyright.

[before]: https://web.archive.org/web/20110708114351/http://www.canonical.com/contributors
[after]: https://web.archive.org/web/20110725185209/http://www.canonical.com/contributors

Canonical CLA is rather similar to the CLA which Digia asks contributors to sign
to get their code into Qt. Here are some handy links to compare them (with local
versions in case they go away in the future):

- [Canonical Individual CLA][canonical-cla] ([local version][canonical-cla-local]),
  source: <http://www.canonical.com/contributors>.

- [Qt-Project CLA][qt-cla] ([local version][qt-cla-local]),
  source: <http://qt-project.org/legal.html>.

[canonical-cla]: http://www.canonical.com/sites/default/files/active/images/Canonical-HA-CLA-ANY-I.pdf
[canonical-cla-local]: Canonical-HA-CLA-ANY-I.pdf
[qt-cla]: http://qt-project.org/legal/QtContributionLicenseAgreement.pdf
[qt-cla-local]: QtContributionLicenseAgreement.pdf

The major difference I found is Digia agreement provides a non-retroactive
termination clause. Canonical agreement does not provide such a clause, but I
think it is harmless since it is up to you to decide if you supply a
contribution under the CLA. Should you decide you don't like Canonical CLA
anymore, you just stop contributing.

The worst feature of Canonical CLA as it stands now is that it is god-send ammo
for haters. It precludes any technical discussion: "That project uses CLA, it is
the devil!" (I am not referring to Mir here, but rather to projects like LightDM)

I am personally fine with Canonical CLA, so I signed it. It is actually much
less demanding than FSF requirements to either assign your copyright to them, or
place your contribution under the public domain (see [here][fsf1] and [here][fsf2])

_Update: The FSF only asks you to assign copyright to them for projects they own.
Many GNU projects are not owned by the FSF and thus do not have those
requirements._

[fsf1]: https://www.gnu.org/licenses/why-assign.en.html
[fsf2]: http://www.gnu.org/prep/maintain/maintain.html#Legal-Matters

## Will you get my code in?

I sometimes get asked by people to get their code in projects because they do
not want to sign Canonical CLA. Please don't: if it is against your principles
to sign the CLA, then do not ask me to pretend I wrote code you authored: it is
against my principles to lie. What you can do is:

- File a bug against the project, talk with the maintainers to get it fixed.
- Describe your problem and convince me to fix it (bribing with cookies can
  work)
- Fork the project (but consider if it is really worth the price)

## Final words

I hope this helps clarify my position on this topic, and maybe get some of you
to think about Canonical CLA with a different state of mind.

Of course, you can certainly refuse to sign such a CLA not because of its
content but because you don't like the company behind it. For example if you are
convinced Canonical is using contributions to build a machine to eradicate all
the kittens on Earth, do not sign the CLA! Think about the kittens!

Finally, remember this is not legal advice: I am not a lawyer, I just sometimes
play one on IRC.
