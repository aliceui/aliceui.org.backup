# 规范和最佳实践

- order: 7
- category: alice

---

> When other men are limited by of laws, remember, Everything is permitted. 
*「 Assassin's Creed: Brotherhood 」*

入乡随俗，有一些规则是必须要遵守的，有一些则是经验总结，欢迎拍砖。
这页文档将介绍使用 Alice 开发样式时需要遵守的规范，统一可行的规范能保证团队开发产出优秀的代码。

---

## 模块组织规范

Alice 的样式模块组织方式追求扁平化的方式，分为三个层级：

1. 基础框架（reset + iconfont + 栅格）

2. 通用模块（符合 Alice 规范的样式模块）

3. 页面样式（继承通用模块）

Alice 推荐采用上述的层次来组织你的样式文件，在基础框架的基础上开发一定数量的通用模块，
在页面样式模块中继承基础框架和通用模块，并进一步开发。

## 模块化命名规范

本文主要内容来自原 http://aliceui.com/alice-css-guide/ 一文。

### 什么是模块化的样式

Alice 对于模块话样式的理解是组件应该像一个盒模型，不和页面的其他元素互相影响。
完美的 Alice 模块应该是一个“口”字型结构。比如 box 组件：

![](https://raw.github.com/slowhost/upload/1362842084975/box.png)

ui-box 组件能够嵌到页面上任何一个位置，box 内部也能够嵌入别的模块（比如 list 组件），它们之间不会互相影响。

### 怎样才能写出模块化的样式

一种简单的方式是使用 Alice 的类命名规范，当团队中都能采用这种方式书写样式，就能很好地避免样式冲突。
在模块化和命名上，以一个Tab组件为例，分解如下：

![](https://raw.github.com/slowhost/upload/1362844273297/222.jpg)

值得注意的是：

- 组件名是必选的
- 状态请参照下文中“状态的规范”
- 在组件窗口最外一层添加状态，而非给每一个内容添加状态。除非内容有独立的状态

    比如，我们可以这样写：

    ```html
    <div class="ui-new ui-new-hover">
       <h3>TITLE</h3>
       <p class="ui-new-cnt">
          ....
       </p>
    </div>
    ```

    但不要这样写：

    ```html
    <div class="ui-new">
       <h3 class="ui-new-title-hover">TITLE</h3>
       <p class="ui-new-cnt ui-new-cnt-hover">
           ....
       </p>
    </div>
    ```


- 充分考虑组件标签的语义化

    语义化是什么？什么样的写法才是正确的。这里给一个建议，把你将要构建的页面当成一本书。是段落的，你就用 P(aragraph)；是标题的，就用 H(eader)；是引用的，就用 Blockquote。
    而不是简单的，块状的东西由块状元素包含，行内的元素用行内的标签包含。这里有点要求就是， 去深入了解每个 HTML 标签的用法。关于灵活。像 “在组件窗口最外一层添加状态，而非给每一个内容添加状态。除非内容有独立的状态” 就是一种灵活的表现。让你更灵活去地改变状态。

    关于 HTML 的语义化，可以参考：[这样去写你的 HTML](http://sofish.de/1688) 。


### Alice 类命名规范

![](http://aliceui.com/images/alice-css-guide/dcbzbj8j_35c92sj7fs_b.png)

- 组件名

    尽量让人看到名字就能知道是什么组件，比较 ui-tab，比如 ui-nav 这样的命名。
    用 HTML ENTRY 来引用，不要写空标签，应使用 HTML ENTRY 来替代，以达到语义化的要求。
    HTML ENTRY 请参考这个文档：https://docs.google.com/Doc?docid=0AWiI12yCmwaoZGNiemJqOGpfMTVmaHZtOWNkeg
    
- 组件整体状态 = 组件名 + 状态

    常用的状态有：hover, current, selected, disabled, focus, blur, checked, success, error 等。通常你的命名应该看起来像 .ui-name-hover, .ui-name-error 这样。
    
- 组件模块 = 组件名 + 模块名

    常用模块名有：cnt(content), hd(header), text(txt), img(images/pic),item, cell 等，只要词义表达了组件要实现的功能或者要表现出来的的外观就可以了。
    
- 组件模块状态 = 组件模块 + 状态

    参照常用状态。

命名注意：
    
- 组件嵌套：大组件可有子组件命名。

    拿支付宝某项目中的的 .ui-nav 为例，如果有多级，可以这样命名：

    ui-nav > ui-subnav(ui-nav的子类) > ui-list(嵌套进去的其他组件)

    ```html
    <ul class="ui-nav">
        <li class="ui-nav-item">
            <a href="#">nav Triggle Link</a>
            <ul class="ui-subnav">
                <li class="ui-subnav-item">
                    <a href="#">subNav Triggle Link</a>
                        <ul class="ui-list" ....
    ```

    
- 多状态：用唯一的命名来代替，而非抽象名词。

    拿 ui-button 为例：

    ```
    ui-button ui-button-1pxcorner [, ui-button-indexsign [, ui-button-SOMEID]]
    ```

    而不要用 ui-button-round，这样，就可能会有： ui-button-round-a ui-button-round-b … 了。
    按钮又有多个状态，命名就会太长了 ui-button-round-a-disabled 。
    
- 格调统一：

    比如你比较喜欢 ui-tip-container ，另外的一个相同作用的地方，就不要写 ui-message-cnt 了，用 `ui-tip-container ui-message-container` 或 `ui-tip-cnt ui-messages-cnt` 这样会是更好的选择。

### 命名规范的最后

说了这么多，其实简单就是一句话，用 `-` 来做命名空间上的区隔，最小化两个组件之间的命名冲突。

在 Alice 中，第一个 `ui-` 是作为通用组件的标识。你可以选取其他前缀来分类你的模块。


## CSS 编码规范

直接参考 Google 的规范吧，懒得写了。

[http://google-styleguide.googlecode.com/svn/trunk/htmlcssguide.xml](http://google-styleguide.googlecode.com/svn/trunk/htmlcssguide.xml)

## 写样式的最佳实践

1. 使用 iconfont 代替雪碧图。

2. 坚持渐进增强策略，大胆使用新的 CSS3 技术，对低级浏览器保持基本的视觉支持。

3. 设计 Html 结构是开发样式模块的核心工作，不要为了视觉效果迁就 Html 结构。

4. 使用 fn-clear 来清除浮动，慎用 `overflow: hidden;` 。

5. 样式模块不要依赖 reset.css ，要有对自身的 reset 代码。

6. 欢迎补充。


## 常见兼容解决方案

1. inline-block

    ```css
    display: inline-block;
    *display: inline;
    *zoom: 1;
    ```

2. 最小高度 min-height

    ```css
    min-height: 200px;
    _height: 200px; / hack for ie6 */
    ```

3. 顺时针翻转 90 度。

    ```css
    -webkit-transform: rotate(90deg);
    -moz-transform: rotate(90deg);
    -o-transform: rotate(90deg);
    filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=1);
    -ms-filter: "progid:DXImageTransform.Microsoft.BasicImage(rotation=1)";
    transform: rotate(90deg);
    ```
