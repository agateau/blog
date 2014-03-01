pub_date: 2014-03-01 22:40:13 +01:00
public: true
tags: [KDE, KF5, Graphviz, CMake]
title: "Dependency diagrams on api.kde.org!"
summary: |
    Dependency diagrams are now automatically generated on api.kde.org.

Today I am happy to announce that after a bit of work we finally got dependency diagrams for KDE Frameworks 5 automatically generated on [api.kde.org][ako-kf5]. Pick a framework, then click on the "Dependencies" link in the sidebar. For example, a tier 2 framework like [KAuth][], a tier 3 one like [KIconThemes][] or if your looking for something a bit crazier, here is [KIO][].

[ako-kf5]: http://api.kde.org/frameworks-api/frameworks5-apidocs/
[KAuth]: http://api.kde.org/frameworks-api/frameworks5-apidocs/kauth/html/kauth-dependencies.html
[KIconThemes]: http://api.kde.org/frameworks-api/frameworks5-apidocs/kiconthemes/html/kiconthemes-dependencies.html
[KIO]: http://api.kde.org/frameworks-api/frameworks5-apidocs/kio/html/kio-dependencies.html

Getting this to work was a bit more involved than I originally thought because the first part of the diagram generation is done by running `cmake --graphviz` on the source code. This means it must be run on a system with all the necessary dependencies installed. We ended up having the build servers run this part and rsync'ing the result to the server responsible for running Doxygen.

If you are interested in how it works, the code is available in the [kapidox repository][kapidox]. Feel free to ping me if you need help with it.

[kapidox]: http://quickgit.kde.org/?p=kapidox.git

I am still debating whether it makes sense to host the ["mother of all diagrams"][moad] on api.kde.org or not. My gut feeling tells me that while it's impressive, it is of limited value and this is only going to get worse as we add new frameworks (the linked diagram is already outdated). It would probably be more interesting to produce a readable diagram of all tier 1 and tier 2 frameworks instead. I experimented a bit with this, but I am not done yet: I need to find a way to get more vertical spaces between cluster graphs. Right now [the result is not useful](tier-1-2-qt.png) because the arrows are all stuck together, even [without Qt libs](tier-1-2.png).

[moad]: kf5.png
