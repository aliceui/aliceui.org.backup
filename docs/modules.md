# 样式库

- order: 3
- category: alice

---

这里是 Alice 的通用样式模块库。

---

<script type="text/template" id="alice-module">
    <div class="alice-module">
        <div class="alice-module-head">
            <h2 class="alice-module-title">
                <a herf="/button"></a>
            </h2>
            <span class="alice-module-version">1.0.0</span>
            <p class="alice-module-description"></p>
        </div>
    </div>
</script>

<script type="text/template" id="alice-module-demo">
    <div class="alice-module-demo">
        <h3 class="alice-module-subtitle"></h3>
        <a class="alice-module-sourcecode" href="javascript:;">查看源码</a>
        <div class="alice-module-dom"></div>
        <pre class="alice-module-code prettyprint"></pre>
    </div>
</script>

<style>
.alice-module {
    border-bottom: 1px solid #eee;    
    padding: 0;
    margin-bottom: 20px;
}
.alice-module-head {
    overflow: hidden;
    margin: 20px 0 0 0;    
}
.alice-module-title {
    margin: 0;
    font-size: 28px;
    font-family: Trebuchet MS;
    display: inline;
}
.alice-module-title a {
    color: #7CAE23;
    cursor: pointer;
}
.alice-module-link {
    font-size: 14px;
}
.alice-module-version {
    font-size: 12px;
    font-weight: normal;
    margin-left: 0.5em;
    color: #888;
    font-family: Menlo,Monaco,"Courier New",monospace;
}
.alice-module-description {
    font-size: 14px;
    color: #888;
    margin: 10px 0 20px;
}
.alice-module-demo {
    border: 1px solid #eee;
    border-bottom: none;
    padding: 20px 130px 20px 20px;
    position: relative;
    overflow: hidden;
}
.alice-module-demo:hover {
    background: #fdfdfd;
}
.alice-module-code {
    display: none;
}
.alice-module-subtitle {
    position: absolute;
    top: 0;
    right: 0;
    border-radius: 3px;
    margin: 0;
    color: #666;
    font-size: 12px;
    background: #F8F8F8;
    border-bottom: 1px solid #ddd;
    border-left: 1px solid #ddd;
    display: block;
    font-size: 12px;
    width: 100px;
    padding: 5px 10px;
    opacity: 0.8;
}
.alice-module-sourcecode {
    position: absolute;
    right: 125px;
    top: 0;
    font-size: 12px;
    padding: 5px 10px;
    background: #EFFFE4;
    border-radius: 3px;    
    display: none;
    z-index: 99;
    opacity: 0.8;   
}
.alice-module-dom a {
    color: #08c;
}
</style>

<div class="alice-modules"></div>

<link type="text/css" rel="stylesheet" media="screen" href="../static/allinone/dist/allinone-full.css">
<link type="text/css" rel="stylesheet" media="screen" href="../static/tomorrow.css">
<script src="../static/google-code-prettify/run_prettify.js"></script>

<script>
seajs.use(['$', 'gallery/underscore/1.4.3/underscore'], function($, _) {
    
    $('.alice-modules').on('mouseenter', '.alice-module-demo', function() {
        $(this).find('.alice-module-sourcecode').fadeIn(200);
    }).on('mouseleave', '.alice-module-demo', function() {
        $(this).find('.alice-module-sourcecode').fadeOut(200);         
    });

    $('.alice-modules').on('click', '.alice-module-sourcecode', function() {
        var code = $(this).parent().find('.alice-module-code');
        if (code.is(':hidden')) {
            code.slideDown(200);
        } else {
            code.slideUp(200);
        }
    });

    $.getJSON('../static/allinone/package.json', function(data) {
        var deps = _.pairs(data.dependencies);
        _.each(deps, function(dep) {
            var moduleNode = $($('#alice-module').html());
            moduleNode.find('.alice-module-title a')
                .attr('href', '/' + dep[0])
                .html(dep[0]);
            moduleNode.appendTo('.alice-modules');

            $.ajax({
                url: '/' + dep[0],
                dataType: 'html',
                success: function(data) {
                    data = $(data);
                    moduleNode.find('.alice-module-description')
                        .html(data.find('.entry-content > p:first-child').html());
                    moduleNode.find('.alice-module-version')
                        .html(data.find('.version a').html());

                    data.find('.nico-insert-code').each(function(index, item) {
                        var demoNode = $($('#alice-module-demo').html());
                        item = $(item);
                        var subtitle = item.prev().html();
                        if (item.prev()[0].tagName !== 'H3' || !subtitle) {
                            subtitle = '默认';
                        }
                        var code = HtmlToCode(item.html());
                        
                        demoNode.find('.alice-module-subtitle').html(subtitle);
                        demoNode.find('.alice-module-dom').html(item.html());                        
                        demoNode.find('.alice-module-code').html(code);
                        demoNode.appendTo(moduleNode);
                    });
                }
            });

        });
    });

    
    function HtmlToCode(html) {
        var code = html;
        code = code.replace(/</g, '&lt;').replace(/>/g, '&gt;');
        code = code.replace(/^\s*\n/, '').replace(/\n\s*$/, '');
        code = PR.prettyPrintOne(code, 'html', false);
        return code;
    } 

});
</script>
