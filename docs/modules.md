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
                <h2 class="module-title"></h2>\
                <div class="module-code"></div>\
            </div>';
        var deps = _.pairs(data.dependencies);
        _.each(deps, function(dep) {
            var moduleNode = $(html);
            moduleNode.find('.module-title').html(dep.key);
            moduleNode.find('.module-code').load('/' + dep.key + ' .nico-insert-code');
            moduleNode.appendTo('.alice-modules');
        });
    });
});
</script>
