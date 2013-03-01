seajs.use(['$', 'arale/fixed/1.0.0/fixed'],
function($, Fixed) {
    
    Fixed('.side-area', 20);

    $('.content h2:not(.alice-module-title)').each(function(i, item) {
        $('.side-loading').remove();
        item = $(item);
        var list = $($('#list-template').html());
        list.find('a').html(item.html() + list.find('a').html());
        list.find('a').attr('href', '#' + item.attr('id'));
        list.appendTo('.side-area');
    });

});
