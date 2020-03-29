pub_date: 2016-05-02 18:52:39 +01:00
public: true
tags: [qt, qml, drag'n'drop]
title: Reordering a Qt Quick ListView via drag'n'drop - part 2
summary: |
    Let users scroll our ListView by dragging items.

Welcome to this second article in the "Reordering a Qt Quick ListView via drag'n'drop" series. If you haven't read it already, I suggest you start with [the first article](/2016/reordering-a-listview-via-dragndrop-1).

In this article we are going to add a handy feature to our ListView: the ability to automatically scroll the ListView when dragging an item to its top or bottom edge. This is nice when you want to drag an item to a place which is not currently visible.

Here is this new behavior in action:

[![Drag scrolling](thumb_drag-scroll.png)](drag-scroll.gif)

We are going to implement this by using the MouseArea of the DraggableItem introduced in the first article. When the mouse cursor in this MouseArea is close enough to the borders of the ListView we will trigger scrolling animations. This is a bit less elegant than adding MouseAreas at the top and bottom of the ListView, but has the nice advantage of not requiring any change in the ListView.

The first thing we are going to do is add a few properties to our component:

```qml
// Size of the area at the top and bottom of the list where drag-scrolling happens
property int scrollEdgeSize: 6
// Internal: set to -1 when drag-scrolling up and 1 when drag-scrolling down
property int _scrollingDirection: 0
// Internal: shortcut to access the attached ListView from everywhere.
// Shorter than root.ListView.view
property ListView _listView: ListView.view
```

Now we can declare two animations to scroll the list:

```qml
SmoothedAnimation {
    id: upAnimation
    target: _listView
    property: "contentY"
    to: 0
    running: _scrollingDirection == -1
}
SmoothedAnimation {
    id: downAnimation
    target: _listView
    property: "contentY"
    to: _listView.contentHeight - _listView.height
    running: _scrollingDirection == 1
}
```

These two animations operate on the ListView and will make it scroll by animating its `contentY` property, depending on the value of `_scrollingDirection`. All that remain is to update `_scrollingDirection` when dragging to the top or bottom edge of the ListView. We do this by changing the binding of `scrollingDirection` when we enter the "dragging" state:

```qml
            _scrollingDirection: {
                var yCoord = _listView.mapFromItem(dragArea, 0, dragArea.mouseY).y;
                if (yCoord < scrollEdgeSize) {
                    -1;
                } else if (yCoord > _listView.height - scrollEdgeSize) {
                    1;
                } else {
                    0;
                }
            }
```

Here we define a complex expression for `scrollingDirection`: first we compute the y coordinate relative to the ListView. Then we check its value to see if we are on either the top or bottom edge, and update the value accordingly.

We can now scroll the ListView by dragging items to its top or bottom edge. You might notice an annoying bug though: when you drop an item below the last item the dropped item does not become visible. To workaround this, we need a little hack: once the ListView has moved the dropped item at its final position, we can call the `ListView.positionViewAtIndex()` method to ensure our item is visible. The trick is, even if the code connected to the `moveItemRequested` moves the Item synchronously, we cannot call `positionViewAtIndex` right after the signal has been emitted: we need to wait until the ListView has actually adjusted itself after the move. To do so, we can use a Timer object to delay the call to `positionViewAtIndex`. This is what `emitMoveItemRequested` now looks like:

```qml
function emitMoveItemRequested() {
    var dropArea = contentItemWrapper.Drag.target;
    if (!dropArea) {
        return;
    }
    var dropIndex = dropArea.dropIndex;
    if (model.index < dropIndex) {
        dropIndex--;
    }
    if (model.index === dropIndex) {
        return;
    }
    root.moveItemRequested(model.index, dropIndex);
    makeDroppedItemVisibleTimer.start();
}
```

And this is our Timer:

```qml
Timer {
    id: makeDroppedItemVisibleTimer
    interval: 0
    onTriggered: {
        _listView.positionViewAtIndex(model.index, ListView.Contain);
    }
}
```

An interval of 0 means the timer will be triggered as soon as we are back to the event loop. Note that this only works because in our example the code connected to the `DraggableItem.moveItemRequested` signal is synchronous: it does not delay the move of the dropped item. If the code were asynchronous, you would have to find a way to call `ListView.positionViewAtIndex` after the move is done, which most likely would require calling it outside of DraggableItem.

We are done with drag-scrolling, the user can now scroll long lists to find the place to drop the dragged item. The source code for this article is available in the [associated GitHub repository, under the "2-drag-scroll" tag][gh]. You can now continue to the [next article of the series][next].

[gh]: https://github.com/agateau/listviewdragitem/tree/2-drag-scroll
[next]: ../reordering-a-listview-via-dragndrop-3
