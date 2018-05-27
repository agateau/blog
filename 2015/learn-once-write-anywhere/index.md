pub_date: 2015-02-04 23:22:17 +01:00
public: true
tags: [react, qml, javascript]
title: "Learn Once, Write Anywhere"
summary: |
    React, a JavaScript web library, comes to "native"

I am writing a web application for my current customer. The application is written using [React][], a "JavaScript library for building user interfaces" built by Facebook.

React is an interesting beast. At first it feels weird, as in "What? I have to mix XML in my JS code? How ugly, can someone please think of the children^Wstandards!", then it gets into you (at least it did for me) and you start enjoying it. It's especially interesting when you have some QML experience: while it's not as declarative as QML, the way it strictly separates mutable state and immutable properties and takes advantage of this separation to automatically render the changed components makes React feels a bit like QML by certain aspects. 

I started to follow a bit more closely what was going on in the React world and stumbled a few days ago on this presentation by Tom Occhino, announcing React Native:

<iframe width="853" height="480" src="https://www.youtube.com/embed/KVZ-P-ZI6W4?rel=0" frameborder="0" allowfullscreen>
</iframe>

([Direct link to the video](https://www.youtube.com/watch?v=KVZ-P-ZI6W4))

In short, Facebook has decoupled React from the DOM and is now using it to build mobile apps. This is not well known mobile-app-embeds-webview approach PhoneGap or Titanium uses: React Native instantiates real, native UI elements, they do not try to emulate them using DOM and CSS.

As Tom Occhino says at [28m30](https://www.youtube.com/watch?v=KVZ-P-ZI6W4&feature=youtu.be&t=28m30s) in the video: their philosophy is not "Write once, run anywhere", but rather "Learn once, write anywhere": they are going to build React bindings for all the platforms they want to support instead of providing cross-platform UI elements which look and behave as close as possible to their native equivalents on the platform your application is running on (the Qt approach). This lets you share all the core, non-visual parts of your application across platforms while providing a native user experience. Others are following a similar "Learn once, write anywhere" approach to mobile app development: Ars Technica reports that Google for example is doing [something similar for their Inbox app][inbox], using Java as the common language.

[inbox]: http://arstechnica.com/information-technology/2014/11/how-google-inbox-shares-70-of-its-code-across-android-ios-and-the-web/

The main drawback of React Native approach is of course, that you have to write different UI code for each of the platforms you want to support, but if you are ready to pay this price you get a real native look and feel, while still being able to share lots of code across platforms.

I have always been impressed by how deep Qt goes on the desktop to support OS-specific features, but even on the desktop, there are times where you have to write platform-specific code. Given that there tend to be more differences between mobile OS than between desktop OS, I wonder if the Qt approach is going to continue to be good enough or if having platform-specific code for all UI is the only way to go.

It's worth noting that cross-platform for Facebook currently only means 3 platforms: HTML, Android and iOS: it's nowhere near Qt breath and is unlikely to reach platform parity any time soon. I can see them add Windows Phone support if it ever gains more traction, but I think Facebook is perfectly happy with HTML for the desktop, so I don't expect them to provide any Qt bindings. I wonder how hard it would be to put together though, given that Qt already has a JavaScript engine (not going to try this myself, it's too big for a side-project :), someone else willing to give it a try?)

Time will tell if React is going to change the way web and mobile apps are built in the future or if it's just going to be blown away by the next JavaScript framework of the day given the frightening speed at which the JavaScript ecosystem mutates.

<a href="https://flattr.com/submit/auto?user_id=agateau&description=React%2C+a+JavaScript+web+library%2C+comes+to+%22native%22&url=http%3A%2F%2Fagateau.com%2F2015%2Flearn-once-write-anywhere&title=Learn+Once%2C+Write+Anywhere" target="_blank">
<img src="https://api.flattr.com/button/flattr-badge-large.png" alt="Flattr this" border="0">
</a>

[React]: http://facebook.github.io/react/
