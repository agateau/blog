public: no
pub_date: 2017-12-17 19:08:10 +01:00
tags: [Howto, libgdx]
title: "Generating libgdx API doc"
disqus: false

Content
Get libgdx sources:

    git clone https://github.com/libgdx/libgdx
    cd libgdx
    git checkout x.y.z

Generate doc in a doc/ dir:

    javadoc -d doc -sourcepath gdx/src -subpackages com
