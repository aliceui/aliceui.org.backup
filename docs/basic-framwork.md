# 基础框架

- order: 2
- category: alice

---

<link rel="stylesheet" href="http://modules.spmjs.org/alice/grid/1.0.0/grid.css" />
<link rel="stylesheet" href="http://modules.spmjs.org/alice/animate/1.0.0/animate.css" />

## Base 重设

base.css 是 Alice 的浏览器重设样式。（[关于 reset.css](http://meyerweb.com/eric/tools/css/reset/)）

它扫除了浏览器默认样式的基本兼容性问题，像建筑的地基一样，让开发者在平地上放心的建造大楼。
Alice 的 base.css 是结合支付宝开发经验，借鉴 [normalize.css](http://necolas.github.com/normalize.css/) 等业界优秀模块，并加上一些常用 className 而产出的一套重设样式。

### 字体

`alice.base` 采用了 12 像素，1.5 的行高，并且兼容 Mac 和 Window 的字体配置，非常适合国内的网站样式。

```css
body {
    font:12px/1.5 tahoma,arial,Hiragino Sans GB,\5b8b\4f53;
}
```

### 常用功能类

- `fn-clear` 清除浮动

- `fn-hide` 隐藏元素

- `fn-left` `fn-right` 左右浮动

- `fn-text-overflow` 文字单行溢出省略号

    <div class="fn-text-overflow" style="width:100px">文字很长很长很长</div>

- `fn-linear` 简单渐变

- `fn-linear-light` 浅色的简单渐变

- `fn-rmb` 金额样式

    <span class="fn-rmb">￥23.67</span>

- `fn-webkit-adjust` 用于修复 webkit 下小于 10px 的中文字体

灵活使用这些类会大大提高样式开发效率，请点击 [演示页面](http://aliceui.org/base) 和 [代码](https://github.com/aliceui/base/blob/master/src/base.css) 查看详情。


## Rei - iconfont

Rei（读音为“丽”）是支付宝的 iconfont 集，是一种把图标放入自定义字体中，然后使用字体图标来替代普通图标的技术。同时，Rei也是动漫女神。

字体图标具有良好的兼容性，矢量，规范，减少图片请求，适应性强等特点，大量先进的网站（包括 github 等）正在使用这种技术。
Alice 全面使用了 iconfont 技术，使得所有的通用组件都不会产生图片请求，并且也获得了良好的兼容性和通用性。

Rei 目前涵盖了网站常用各类图标约 70 多个，兼容包括 `ie6/7/8` 在内的各主流浏览器，你可以自由的在页面中使用它。

<style>
.icon {
    display: inline-block;
    *display: inline;
    *zoom: 1;
    height: 20px;
    width: 136px;
    color: #888;
    font-size: 13px;
    margin-bottom: 5px;
}
.icon .iconfont {
    margin-right: 10px;
    font-size: 14px;
    width: 18px;
    display: inline-block;
    *display: inline;
    *zoom: 1;
}
</style>

<div class="iconset fn-clear">
    <div class="icon">
        <i class="iconfont" title="自助服务">&#x005B;</i> 自助服务
    </div>
    <div class="icon">
        <i class="iconfont" title="图片">&#x00E7;</i> 图片
    </div>
    <div class="icon">
        <i class="iconfont" title="图片">&#x00E7;</i> 图片
    </div>
    <div class="icon">
        <i class="iconfont" title="图片">&#x00E7;</i> 图片
    </div>
    <div class="icon">
        <i class="iconfont" title="图片">&#x00E7;</i> 图片
    </div>
    <div class="icon">
        <i class="iconfont" title="图片">&#x00E7;</i> 图片
    </div>
    <div class="icon">
        <i class="iconfont" title="图片">&#x00E7;</i> 图片
    </div>
    <div class="icon">
        <i class="iconfont" title="图片">&#x00E7;</i> 图片
    </div>
    <div class="icon">
        <i class="iconfont" title="图片">&#x00E7;</i> 图片
    </div>
    <div class="icon">
        <i class="iconfont" title="图片">&#x00E7;</i> 图片
    </div>
    <div class="icon">
        <i class="iconfont" title="图片">&#x00E7;</i> 图片
    </div>
    <div class="icon">
        <i class="iconfont" title="图片">&#x00E7;</i> 图片
    </div>
    <div class="icon">
        <i class="iconfont" title="图片">&#x00E7;</i> 图片
    </div>
    <div class="icon">
        <i class="iconfont" title="图片">&#x00E7;</i> 图片
    </div>
    <div class="icon">
        <i class="iconfont" title="图片">&#x00E7;</i> 图片
    </div>
    <div class="icon">
        <i class="iconfont" title="图片">&#x00E7;</i> 图片
    </div>
    <div class="icon">
        <i class="iconfont" title="图片">&#x00E7;</i> 图片
    </div>
    <div class="icon">
        <i class="iconfont" title="图片">&#x00E7;</i> 图片
    </div>
    <div class="icon">
        <i class="iconfont" title="图片">&#x00E7;</i> 图片
    </div>
    <div class="icon">
        <i class="iconfont" title="添加联系人">&#x0062;</i> 添加联系人
    </div>
</div>

支付宝员工请直接访问 [site.alipay.im/rei/](http://site.alipay.im/rei/) 来获取字体代码。

## Grid 栅格

Alice 的布局是 990px 定宽 25 栅格，这是依托于支付宝实际需求的栅格系统，
在 [我的支付宝](https://my.alipay.com/) 有应用。具体使用方式请见文档：[aliceui.org/grid](http://aliceui.org/grid) 。

![](https://i.alipayobjects.com/e/201303/2KLao4hPu8.png)


## CSS3 Animate

Alice 引入了一个优秀的 CSS3 [动画库](http://aliceui.org/animate) 。

你可以通过简单的增减类名的方式在你的项目中实现 [数十种动画效果](http://daneden.me/animate/)。比如：

> 以下动画效果在支持css3 animate的高级浏览器中有效。

<style>
.animate-demo {
    width: 80px;
    height: 80px;
    background: #42B8F7;
    line-height: 80px;
    text-align: center;
    color: #fff;
    display: inline-block;
}
#test2 {
    background: #5FC161;    
}
</style>

````html
<div id="test1" class="animate-demo">点击我</div>
<div id="test2" class="animate-demo">点击我</div>

<script>
seajs.use(['$'], function($) {
    $('#test1').click(function() {
        $(this).addClass('animated bounceOutLeft');
    });
    $('#test2').click(function() {
        $(this).addClass('animated rotateInUpRight');
    });
});
</script>
````

所有的动画效果请点击 [daneden.me/animate](daneden.me/animate/) 查看。
