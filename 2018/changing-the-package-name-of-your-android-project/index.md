pub_date: 2018-05-27 20:08:26 +01:00
public: true
tags: [pixelwheels, android, dev]
title: Changing the package name of your Android project

So you want to change the Java package name of your Android project, but you've heard that you won't be able to push updates to Google Play if you do so? That's almost true.

<!-- break -->

I had this issue with Pixel Wheels. It was originally called Tiny Wheels, but I had to [rename it][rename]. I initially kept the `com.agateau.tinywheels` package name, but I was not happy with that.

It turns out Google Play does not check the Java package name, but the Android application ID. The application ID for my game was, and still is, `com.agateau.tinywheels.android` (the `.android` suffix comes from libgdx, but this has been [fixed now][android-suffix]). As long as this ID stays the same (it is usually defined in the `build.gradle` of your game/application, Pixel Wheels application ID is [defined here][pw-applicationId]), you can rename your Java packages to whatever you want: Google Play will happily accept your apk as an update of the old one.

[rename]: /2018/tinywheels-0-5-0
[android-suffix]: https://github.com/libgdx/libgdx/commit/816cc0cda01ff5260fcec39e166dcc6cf79dcc3a
[pw-applicationId]: https://github.com/agateau/pixelwheels/blob/master/android/build.gradle#L5
