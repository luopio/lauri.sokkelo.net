/* Author:
 Lauri Kainulainen
 */

/* functionality for the expanding projects view */
var projects = {

    $containerElement: null,
    columnWidth: 200,
    cssBreakPoint: 950,


    init: function() {
        if($('#projects-section').size() < 1) { return; }
        projects.$containerElement = $('section#projects-section > div');
        projects.$containerElement.masonry({
            itemSelector : 'article',
            columnWidth : projects.columnWidth,
            gutterWidth : 30,
            isAnimated : true,
            isFitWidth : true
            //columnWidth: function( containerWidth ) {
            // }
        });
        projects.$containerElement.find('article').click(projects.expand);
        projects.$containerElement.find('a.close-button').click(projects.close);

        if(document.location.hash) {
            $(document.location.hash).click();
        }

        var debouncedResize = debounce(function() {
            projects.$containerElement.masonry('reload');
        }, 2000);
        $(window).resize(debouncedResize);

    },

    /* When clicked - expand to show the information and bigger images */
    expand : function(e) {
        $article = $(this);
        if(!$article.hasClass('expanded')) {
            if(document.location && document.location.hash)
                document.location.hash = $(this).attr('id');
            // $article.css('z-index', 10);

            // store the thumbnail url so we can minify the figure later on
            $article.data('bg-image', $article.css('background-image'));
            $article.css('background-image', '');

            $article.addClass('expanded');
            var fw = Math.min($article.parent().width(), 800);
            $article.width(fw);
            $article.find('hgroup, div.more-text').css({width: fw +'px'}).show();

            projects.$containerElement.masonry('reload');

            $article.find('figure, .slideshow, .video')
                .css({width: projects.columnWidth + 'px'})
                .show()
                .animate({
                    width : fw + 'px'
                }, 500, function() {
                    // scroll to the element
                    setTimeout(function() {
                        $("html:not(:animated), body:not(:animated)")
                            .animate({ scrollTop : $article.offset().top - 2 }, 300);
                    }, 1000);

                    // reload once more for the elements that were left under
                    projects.$containerElement.masonry('reload');

                }
            );

        } else {
            projects.minify(0, $article);
        }
    },

    close : function(e) {
        e.preventDefault();
        projects.minify(0, $(this));
        return false;
    },

    minifyImages : function() {
        $.each(projects.$containerElement.find('article'), projects.minify);
    },

    minify : function(i, $el) {
        if($el.hasClass('expanded')) {
            $el.removeClass('expanded');
            $article.css('background-image', $article.data('bg-image'))

            $el.find('div.more-text').hide();
            $el.find('figure, .slideshow, .video').hide();
            $el.find('hgroup').css({width: '200px'});

            $el.animate({
                width : projects.columnWidth + 'px',
                // height : 'auto'
            }, 100, function() {
                projects.$containerElement.masonry('reload');
                // scroll to the element after we can rely on it being in the right pos (css duration)
                setTimeout(function() {
                    $("html:not(:animated),body:not(:animated)").animate({scrollTop : $el.offset().top - 20}, 200);
                }, 700);

            });
        }
    }
};

var coverImageHandler = {

    init: function() {
        var $c = $('#cover-image');
        $(window).scroll(function() {
            var s = $(window).scrollTop();
            var o = (100 - (s / 1.5)) / 100.0;
            if(o >= 0.0) {
                $c.css({'display': 'block', 'opacity': o});
            } else {
                $c.css({'display': 'none', 'opacity': 0});
            }
        }).scroll();
    }
};

