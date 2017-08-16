title: "Burger Party 0.12: Good Bye Mini-Games, Hello Achievements!"
public: true
pub_date: 2014-03-16 21:13:00 +01:00
tags: [Greeenyetilab, burgerparty]


Time for a new release of Burger Party. In this version I made the difficult decision to remove the mini-games. The reason behind this is I was worried it would take way too long to get them to a level of quality I consider good enough for a public release.

I initially decided to add the mini-games as an incentive for players to play the game again, instead of introducing more classical incentives like achievements. My reasoning was that getting a small game was a more satisfying reward than random emblems. Retrospectively I think it was a mistake. Last month I spent quite some time with the family playing [Zombie Tsunami][zt]. I can attest achievements are powerful motivators :-). This was the last push which made me decide to replace mini-games with achievements.

[![Achievements](/projects/burgerparty/0.12/thumb-achievements.png)](/projects/burgerparty/0.12/achievements.png)

[zt]: https://play.google.com/store/apps/details?id=net.mobigame.zombietsunami

I originally planned to have Burger Party in English only, using as little text as possible to keep it usable even if the player does not speak English. I still want to keep the amount of text to the minimum, but one can't avoid text to explain achievements, so I had to dive into translations. I like the gettext way of translating better than the Java, constants everywhere, way. Therefore I came up with a custom gettext-based system to handle translations. I plan to release it later under a permissive license. So far only the achievements are translated and they are available in English and in French. The final game will be fully translated, and I hope I can get at least a Spanish translation ready in time.

The game currently features a little dozen achievements, but I already have a few others to implement for the next version. If you have cool ideas for achievements, I would love to hear about them!

That's it for [this version](/projects/burgerparty/), I hope you like it!

PS: If you liked the Burger Vaders mini-game, you might be less sad to learn it is likely going to serve as the base for my next game... but I refrain myself from starting working on it for now: I want to finish this one first!
