# 基础框架

- order: 2
- category: alice

---

## Base

base.css 是 Alice 的浏览器重设样式。（[关于 reset.css](http://meyerweb.com/eric/tools/css/reset/)）

它扫除了浏览器默认样式的基本兼容性问题，像建筑的地基一样，让开发者在平地上放心的建造大楼。

Alice 的 base.css 是结合支付宝开发经验，借鉴 normalize.css 等业界优秀模块，并加上一些常用 className 而产出的一套重设样式。

**常用的功能类有：**

- `fn-clear` 清除浮动

- `fn-hide` 隐藏元素

- `fn-left` `fn-right` 左右浮动

- `fn-text-overflow` 文字单行溢出省略号

- `fn-linear` 简单渐变

- `fn-linear-light` 浅色的简单渐变

- `fn-rmb` 金额样式

- `fn-webkit-adjust` 用于修复 webkit 下小于 10px 的中文字体

灵活使用这些类会大大提高样式开发效率，请点击 [演示页面](http://aliceui.org/base) 和 [代码](https://github.com/aliceui/base/blob/master/src/base.css) 查看详情。


## Rei - iconfont

Rei（读音为“丽”）是支付宝的 iconfont 集，是一种把图标放入自定义字体中，然后使用字体图标来替代普通图标的技术。同时，Rei也是动漫女神。

字体图标具有良好的兼容性，矢量，规范，减少图片请求，适应性强等特点，大量先进的网站（包括 github 等）正在使用这种技术。

Rei 目前涵盖了网站常用各类图标约 70 多个，兼容包括 ie6/7/8 在内的各主流浏览器，你可以自由的在页面中使用它。比如 <i class="iconfont" title="自助服务">&#x005B;</i> <i class="iconfont" title="图片">&#x00E7;</i> 等等。

支付宝员工请直接访问 [site.alipay.im/rei/](http://site.alipay.im/rei/) 来获取字体代码。

## Grid 栅格



## CSS3 Animate

Alice 引入了一个优秀的 CSS3 [动画库](http://aliceui.org/animate) 。

你可以通过简单的增减类名的方式在你的项目中实现[数十种动画效果](http://daneden.me/animate/)。


