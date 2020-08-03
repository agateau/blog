const COMMENT_META_SEPARATOR = " - ";

function formatIsoDate(dateString) {
    var date = new Date(dateString);
    return date.toDateString() + ", " + date.getHours() + ":" + date.getMinutes();
}

function addHTMLElement(parent, tagName, cssClass, content) {
    var element = document.createElement(tagName);
    if (cssClass) {
        element.setAttribute("class", cssClass);
    }
    if (content) {
        element.innerHTML = content;
    }
    parent.appendChild(element);
    return element;
}

function addDiv(parent, cssClass, content) {
    return addHTMLElement(parent, "div", cssClass, content);
}

function createComments(container, comments) {
    var ul = document.createElement("ul");
    comments.forEach(function(comment) {
        var commentLi = document.createElement("li");
        commentLi.setAttribute("id", comment.id);
        commentLi.setAttribute("class", "comment");
        if (comment.deleted) {
            addDiv(commentLi, "message", "[deleted]");
        } else {
            const permalink = "<a href='#" + comment.id + "'>link</a>";
            const meta = comment.author
                + COMMENT_META_SEPARATOR + formatIsoDate(comment.createdAt)
                + COMMENT_META_SEPARATOR + permalink;
            addDiv(commentLi, "comment-meta", meta);
            addDiv(commentLi, "message", comment.message);
        }
        ul.appendChild(commentLi);
        if (comment.replies) {
            createComments(commentLi, comment.replies);
        }
    });
    container.appendChild(ul);
}

function onCommentsReceived(comments) {
    if (!comments) {
        return;
    }
    var section = document.getElementById("comments");
    addHTMLElement(section, "h2", null, "Comments");
    var container = addDiv(section, null, null);
    container.setAttribute("id", "comments-container");
    createComments(container, comments);
}

function getURLWithoutHash() {
    var loc = document.location;
    return loc.protocol + "//" + loc.host + "/" + loc.pathname;
}

function loadComments() {
    var baseURL = getURLWithoutHash();
    $.getJSON(baseURL + "/comments.json")
        .success(onCommentsReceived);
}

$(document).ready(loadComments);
