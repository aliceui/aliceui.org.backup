# 建设组件和样式库

- order: 6
- category: alice

---

> More power comes more responsibility. *「 Spider Man 」2012*

我相信，只是复制几个 Html 结构一定不是你的追求，Alice 可以让你做得更多。

以下内容默认在 Linux\Unix 环境下运行，
并确保你已经安装了 [spm](https://github.com/spmjs/spm) 的 1.7.2 及以上版本、 [nico](http://lab.lepture.com/nico/)、
以及 Alice 所对应的 nico [主题](https://github.com/aliceui/nico-alice/)。
若对工具这块有疑问，可以先阅读 [工具](/docs/tool.html) 。

本页略长，请坐稳。

---

## 开发一个样式组件

我们的页面中总是存在的各式各样的模块化的 DOM 结构，
我们都可以依据复用度来把其中一些组件提炼成样式模块。

### 初始化模块

现在我们要开发一个 box 组件。首先建立一个文件夹，并使用 `spm init` 命令进行初始化。

```
$ mkdir box
$ cd box
$ spm init
```

```
prompt: Please select module type:                                     2
Downloading: http://modules.alipay.im/template/alice/1.0.0/alice.tgz:  
Downloaded: http://modules.alipay.im/template/alice/1.0.0/alice.tgz
prompt: Define value for property 'root': :  alipay-css
prompt: Define value for property 'name': :  box
```

这时程序会让你输入相关的信息，选择 2 (alice) 模板，
填写 root 为 alice（Alice 通用模块） 或 alipay-css（支付宝通用业务模块）或其他，
name 为 box 后，就会生成一个 alice 模块的初始目录结构如下。

```
src/
Makefile
README.md
package.json
```

其中 src 目录存放我们的样式源文件，Makefile 用于构建模块的文档，
README.md 是用来写文档和 DEMO 的地方，package.json 则存放模块的基本信息。
我们可以在 package.json 中的 dependencies 字段中填写所需的依赖。
这个 box 模块不需要依赖所以不需要填写。

### 写文档和设计 Html 结构

我们先打开 README.md 进行编辑。

    # box

    ---

    带边框和标题的标准区块。

    ---

    ## 演示文档

    <link type="text/css" rel="stylesheet" media="screen" href="src/box.css">

    ### 默认用法

    ````html
    <div class="ui-box">
        <div class="ui-box-head">
            <div class="ui-box-head-border">
                <h3 class="ui-box-head-title">区块标题</h3>
            </div>
        </div>
        <div class="ui-box-container"></div>
    </div>
    ````

可以看到我们在上面写了基本的模块描述，并引入了样式源文件，在最下面设计了 box 模块的 Html 结构。
这和 JS 模块的开发过程是类似的，先设计文档和接口再进行开发，而对于样式模块来说，Html 结构就是样式的接口。

像上面使用四个 ```` 符号来包裹代码是 [nico](http://lab.lepture.com/nico/) 的特性，这样可以把代码片段转换成实际的 DOM 结构，
非常方便调试和文档生成。

### 编码和调试

接下来我们打开 src/box.css 进行编辑，现在就是熟悉的样式编码阶段了。
在这个阶段，我们可以到项目目录运行 `make watch` 来打开 nico 的调试功能，
nico 会启动一个 livereload 服务监听生成的文档页面，我们可以用浏览器打开 http://127.0.0.1:8000 访问文档页面并进行调试。
你会看到类似下图的页面。

![](https://i.alipayobjects.com/e/201303/2Ml1vh9J08.png)

### 构建和发布

开发测试完毕后，我们就可以通过一下目录构建出标准的 Alice 模块文件了。

```
$ spm build
```

这个命令会生成一个 dist 目录，里面存放我们构建出来的样式文件。它会读取 package.json 中的 output 
字段来输出用户指定的文件。([output 规则](https://github.com/spmjs/spm/wiki/package.json-:-output))

```
$ spm upload
```

再通过 upload 命令可以把样式模块上传到源中，这样其他模块就可以依赖这个模块了。还可以通过 `spm deploy` 来部署到对应的开发服务器中进行进一步调试。

### 源码托管和文档部署

最后，建议你将这个目录提交到 github 或 gitlab 中，统一管理你的样式模块。一个版本开发构建完成后，用版本号来打一个 tag 。
还可以利用 gh-pages 来部署模块的文档页面。

比如要把这个模块托管到 github 上（例如：https://github.com/afc163/box），在项目的 Makefile 
文件中加入下面的代码：

```
publish: clean build-doc
	@ghp-import _site
	@git push origin gh-pages
```

就可以用`make publish`来发布文档页面到 github 的 gh-pages 中（需要安装 [ghp-import](https://github.com/davisp/ghp-import)）。
就可以访问 https://afc163.github.com/box 来访问对应的文档页了。

如果在支付宝，可以在 http://gitlab.alibaba-inc.com 平台建立一个 group 为 alipay-css 的 git 项目（找@偏右）。
然后在项目的 Makefile 文件中加入下面的代码：

```
name = `cat package.json | grep name | awk -F'"' '{print $$4}'`
root = `cat package.json | grep root | awk -F'"' '{print $$4}'`
html = _site
tmpfile = tmp.tar.gz
publish:
	@nico build -v -C $(THEME)/nico.js
	@rm -f ${tmpfile}
	@tar --exclude='.git/*' -czf ${tmpfile} ${html}
	@curl -F name=${root}/${name} -F file=@${tmpfile} http://site.alipay.im/repository/upload/arale
	@rm -f ${tmpfile}
```

完成后在模块根目录使用 `make publish` 命令就能部署到内部提供的静态站点服务上，访问的路径为 `http://arale.alipay.im/alipay-css/box` 。

> 注意，Makefile 文件的缩进一律用 Tab，否则会报错。

## 开发某页面的样式

这里你将会知道如何依赖和打包 alice 模块。

假设我们现在收到了一个 [我的支付宝](https://my.alipay.com) 页面的开发需求，
拿到 psd 稿后我们发现这个页面上有很多的 alice 通用组件，也有很多的个性化的样式需求。

这时会需要一个我的支付宝的样式模块，命名为 myalipay ，操作步骤和上面的 box 模块类似。
在 Alice 中，一切样式皆模块，所以这个 myalipay 其实和上面的 box 没有本质区别，
只不过它是直接用在页面上的。

> 注意在支付宝内部，root 一般填写对应的系统名称。

生成目录后，我们打开 myalipay/package.json 文件，编辑其中的 dependencies 字段。假设我们需要
用到 alice.box、alice.nav、alice.button 三个组件。

```js
{
  "name": "myalipay",
  "version": "1.0.0",
  "root": "myalipay",
  ...
  "dependencies": {
    "box": "alice/box/1.0.0/box.css",
    "button": "alice/button/1.0.0/button.css",
    "nav": "alice/nav/1.0.0/nav.css"
  }
}
```

然后打开 src/myalipay.css ，在文件前面写入

```css
@import url('box');
@import url('button');
@import url('nav');
```

通过这种类似于 Arale 中 `require('')` 的方式，引入了这三个模块。
然后在 src/myalipay.css 的后面继续编写个性化的样式代码。

当然可以引入内部的模块，比如我们在 src 下建一个 user.css 文件，专门用来写和用户有关的样式。
在 myalipay.css 中可以这样引入：

```css
@import url('box');
@import url('button');
@import url('nav');

@import url('./user.css');  /* 引入内部文件 */
```

最后，和上面一样，用 `spm build` 命令打包出文件，再把 dist 下的文件部署到线上对应目录就可以了。


## 构建团队的样式库

当你构建出了一批样式模块后，你可能需要一个统一的地方展示和管理这些模块（类似这个[页面](http://aliceui.org/Alib)）。
一个维护简单使用方便的样式库对于个人开发者、团队、业务线都有很大的帮助。

Alice 的通用组件样式库是基于支付宝视觉规范的一套模块精选集，数量和质量都会严格控制。
更好的实践是在各小组各产品线参照通用样式库建立自己的样式精选集。（一定程度可以避免玉龙混杂和无法查找组件的问题。）

Alice 提供了一种简单的方式帮助你在 `github` 上搭建自己的样式库。

```
$ curl https://raw.github.com/aliceui/Alib/master/Alib.sh | sh
```

命令运行后会在当前目录建立一个样式库文件夹 `Alib-template`，
现在在 package.json 的 dependencies 字段中写上你要在样式库显示的样式模块。比如：

```js
"dependencies": {
  "box": "alice/box/1.0.0/box.css",
  "button": "alice/button/1.0.0/button.css",
  "nav": "alice/nav/1.0.0/nav.css"
}
```

接下来就可以将这个库部署到对应的 git 托管环境下。

```
$ git remote add origin {{git地址}}
$ git push origin master
```

然后运行下面的命令就可以将样式库部署到对应的 gh-pages 页面。
具体的地址是 `https://username.github.com/{{package.json中的name}}` 。

```
$ make publish
```

这个样式库页面会读取 dependencies 中配置的各模块的文档内容到样式库中，读取的各文档地址是：

```
http(s)://样式库根路径/模块名
```

如果样式库部署到 http://afc163.github.com/Alib 的，那么此页面会读取
afc163.github.com/box、afc163.github.com/button 和 afc163.github.com/nav 这三个页面。（请确保这三个页面有内容！）


### 支付宝前端请按以下步骤操作：

```
$ curl https://raw.github.com/aliceui/Alib/master/Alib-alipay.sh | sh
```

命令运行后会在当前目录建立一个样式库文件夹 `Alib-template`，在 package.json 的 dependencies 字段中写上你要在样式库显示的样式模块。比如：

```js
"dependencies": {
  "box": "app/box/1.0.0/box.css",
  "button": "app/button/1.0.0/button.css",
  "nav": "app/nav/1.0.0/nav.css"
}
```

接下来就可以将这个库部署到对应的 git 托管环境下。
在支付宝内部，我们使用 gitlab.alibaba-inc.com 来作为样式模块的托管服务。
请联系 @偏右 在 alipay-css 这个 group 下建库。

```
$ git remote add origin {{git地址}}
$ git push origin master
```

然后运行下面的命令就可以将样式库部署到基础技术组提供的`site.alipay.im`静态站点服务上。
具体的地址是 `http://style.alipay.im/{{package.json中的name}}` 。比如`http://site.alipay.im/app`。

```
$ make publish
```

这个样式库页面会读取 dependencies 中配置的各模块的文档内容到样式库中，读取的各文档地址是：

```
http://arale.alipay.im/模块root/模块名
```

比如你建立的 Alib 是部署到 http://style.alipay.im/app 的，那么 Alib 页面会用 Ajax 的方式去读取
arale.alipay.im/app/box、arale.alipay.im/app/button 和 arale.alipay.im/app/nav 这三个页面并取到
对应的示例展示在 Alib 的页面上。


### 注意事项

> 注意1：因为是 Ajax 的方式读取各模块页面，
所以请保证模块文档地址可访问，并且样式库和模块文档是同域的。

> 注意2：Alib 对各子模块的页面的标准有要求，请按照 spm init 后的模板来写你的 Demo。

有任何问题，请发 [issue](https://github.com/aliceui/aliceui.github.com/issues/new) 给我们。
