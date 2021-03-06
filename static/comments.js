const COMMENT_META_SEPARATOR = " - ";

function formatIsoDate(dateString) {
    const date = new Date(dateString);
    const minutes = String(date.getMinutes()).padStart(2, "0");
    return date.toDateString() + ", " + date.getHours() + ":" + minutes;
}

function addHTMLElement(parent, tagName, cssClass, content) {
    const element = document.createElement(tagName);
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
    const ul = document.createElement("ul");
    comments.forEach(function(comment) {
        const commentLi = document.createElement("li");
        commentLi.setAttribute("id", comment.id);
        commentLi.setAttribute("class", "comment");
        if (comment.deleted) {
            addDiv(commentLi, "comment-meta", "[This comment has been deleted]");
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
    const section = document.getElementById("comments");
    addHTMLElement(section, "h2", null, "Comments");
    const container = addDiv(section, null, null);
    container.setAttribute("id", "comments-container");
    createComments(container, comments);

    addHTMLElement(section, "p", "comments-are-closed", "(Comments are closed)");

    // Scroll to the right comment if the url contains a hash (since HTML
    // elements for comments are created on the fly, they do not exist when the
    // page has finished loading so the browser does not scroll to it)
    if (document.location.hash) {
        document.location.replace(document.location.href);
    }
}

function getURLWithoutHash() {
    const loc = document.location;
    return loc.protocol + "//" + loc.host + "/" + loc.pathname;
}

function loadComments() {
    $.getJSON(getURLWithoutHash() + "/comments.json").success(onCommentsReceived);
}

$(document).ready(loadComments);
