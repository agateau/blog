public: no
pub_date: 2018-12-16 21:35:41 +01:00
tags: [howto, libgdx]
title: "libgdx layout tips"
disqus: false

## layout()

DO: resize and reposition children
DONT: resize or reposition ourselves
DONT: call invalidateHierarchy()

## After resizing ourself

call invalidateHierarchy()

## After making changes which require children to be layouted

call invalidate()

## Misc

To react to an actor changing position or size: reimplement
Actor.positionChanged() or Actor.sizeChanged()
