seajs.use(['$', 'arale/fixed/1.0.0/fixed'],
function($, Fixed) {
    
    Fixed('.side-area', 20);

    window.substractTitle = function(item) {
        if (item.find('a')[0]) {
            item = item.find('a');
        }
        var list = $($('#list-template').html());
        list.find('a').html(item.html());
        list.find('a').attr('href', '#' + item.attr('id'));
        list.appendTo('.side-area');
    };

    $('.content h2').each(function(i, item) {
        item = $(item);
        substractTitle(item);
    });

});
