"use strict";

var sThumbnails = [];
var sCurrentIndex = -1;

function showMedia(index) {
    if (sCurrentIndex != -1) {
        $(sThumbnails[sCurrentIndex]).removeClass("current");
    }
    sCurrentIndex = index;
    var element = $(sThumbnails[index]);
    element.addClass("current");
    var full = element.attr("data-full");
    var title = element.attr("title");

    $('#gallery-main-view').attr('src', full);
    $('#gallery-main-caption').html(title);

    var DISABLED_CSS = 'disabled';
    var BLOCKED_CSS = 'icon-blocked';
    var BACKWARD_CSS = 'icon-backward';
    var FORWARD_CSS = 'icon-forward';
    var prevIcon = $('#gallery-prev > span');
    var prevA = prevIcon.parent();
    if (sCurrentIndex > 0) {
        prevA.removeClass(DISABLED_CSS);
        prevIcon.removeClass(BLOCKED_CSS);
        prevIcon.addClass(BACKWARD_CSS);
    } else {
        prevA.addClass(DISABLED_CSS);
        prevIcon.addClass(BLOCKED_CSS);
        prevIcon.removeClass(BACKWARD_CSS);
    }
    var nextIcon = $('#gallery-next > span');
    var nextA = nextIcon.parent();
    if (sCurrentIndex < sThumbnails.length - 1) {
        nextA.removeClass(DISABLED_CSS);
        nextIcon.removeClass(BLOCKED_CSS);
        nextIcon.addClass(FORWARD_CSS);
    } else {
        nextA.addClass(DISABLED_CSS);
        nextIcon.addClass(BLOCKED_CSS);
        nextIcon.removeClass(FORWARD_CSS);
    }
}

$(document).ready(function() {
    sThumbnails = $('a.gallery-thumbnail');
    $.each(sThumbnails, function(index, element) {
        $(element).click(function() {
            showMedia(index);
            return false;
        });
    });

    $('#gallery-prev').click(function() {
        if (sCurrentIndex > 0) {
            showMedia(sCurrentIndex - 1);
        }
        return false;
    });
    $('#gallery-next').click(function() {
        if (sCurrentIndex < sThumbnails.length - 1) {
            showMedia(sCurrentIndex + 1);
        }
        return false;
    });
    showMedia(0);
});
