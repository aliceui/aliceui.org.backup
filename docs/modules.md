# 样式库

- order: 3
- category: alice

---

<link type="text/css" rel="stylesheet" media="screen" href="../static/allinone/dist/allinone-full.css">

<div class="alice-modules"></div>

<script>
seajs.use(['$', 'gallery/underscore/1.4.3/underscore'], function($, _) {
    $.getJSON('../static/allinone/package.json', function(data) {
        var html = '\
            <div class="module">\
                <h2 class="module-title"></h2>
                <div class="module-code"></div>
            </div>\';
        var moduleNode = $(html);
        moduleNode.find('.module-title').html(data.name);

        var deps = _.keys(data.dependencies);
        _.each(deps, function(dep) {
            moduleNode.find('. module-code')
                .load('/' + dep + ' .nico-insert-code')
                .appendTo('.alice-modules');
        });
    });
});
</script>
