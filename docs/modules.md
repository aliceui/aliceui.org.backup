# 样式库

- order: 3
- category: alice

---

<link type="text/css" rel="stylesheet" media="screen" href="../static/allinone/dist/allinone-full.css">

<div class="alice-modules"></div>

<script>
seajs.use(['$', 'gallery/underscore/1.4.3/underscore'], function($, _) {
    $.getJSON('../static/allinone/package.json', function(data) {
        var deps = _.keys(data.dependencies);
        _.each(deps, function(dep) {
            $('<div class="alice-module"></div>')
                .load('/' + dep + ' .nico-insert-code')
                .appendTo('.alice-modules');
        });
    });
});
</script>
