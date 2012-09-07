function embedVideos(lst) {
    console.log("lst: " + lst);
    $.each(lst, embedVideo);
}

function embedVideo(idx, element) {
    _embedVimeo(element);
}

// Vimeo ----------------------------------
function _embedVimeo(element) {
    var endpoint = "http://vimeo.com/api/oembed.json";
    var videoUrl = $(element).attr("href");

    var args = {
        "byline": false,
        "title": false,
        "portrait": false,
        "url": videoUrl
        };

    $.get(endpoint, args)
        .success(function(data) {
            dct = jQuery.parseJSON(data);
            $(element).replaceWith(dct["html"]);
        });
}
