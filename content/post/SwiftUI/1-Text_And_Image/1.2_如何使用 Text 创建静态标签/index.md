---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "1.2_如何使用 Text 创建静态标签"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Text and image"]
categories: ["SwfitUI"]
date: 2019-07-24T13:35:01+08:00
lastmod: 2019-07-24T13:35:01+08:00
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---

<!-- more -->
### 1. 简介
`Text` 主要用于在屏幕上显示静态文本，相当于 UIKit 中的 `UILabel`。

### 2. 基本用法
最基本的用法如下:
```swift
Text("Hello world")
```
在 `ContentView` 的预览窗口中，我们可能会看到 `Automatic preview updating paused`， 继续按 `Resume` 以让 Swift 开始构建代码并向我们展示 `ContentView` 外观的实时预览。

效果预览:
![1.2_automatic_preview_updating_paused](img/1.2_automatic_preview_updating_paused.png "Automatic preview updating paused, need to resume.")
![1.2_text_hello_world](img/1.2_text_hello_world.png "Hello world")

### 3. 设置显示行数
默认情况下，Text 视图会根据需要自动换行(包含尽可能多的行)，但是如果我们更希望限制它们可以使用的行数，则应该添加 `lineLimit` 修改器，如下所示:
```swift
Text("Hello world")
    .lineLimit(3)
```
> **提示**: 请注意 `lineLimit(3)` 位于 `Text("Hello World")` 下方靠右侧的方式。这不是必需的，但从长远来看，它确实使我们的代码更易于阅读。

如果对某些文本设置行限制，然后为其提供一个太长而不适合可用空间的字符串，SwiftUI将截断文本，使其以 `...` 结尾。

或者，我们可以为 `lineLimit()` 方法指定 `nil`，这样就允许它根据需要运行任意多行:
```swift
Text("This is an extremely long string that will never fit even the widest of Phones.")
    .lineLimit(nil)
```
效果预览:
![1.2_text_line_limit_nil](img/1.2_text_line_limit_nil.png "lineLimit = nil")
> **注意:** 这里设置 `lineLimit(0)` 不能实现多行显示，这一点跟 UIKit 中是不一样的。

效果预览:
![1.2_text_line_limit_0](img/1.2_text_line_limit_0.png "lineLimit = 0")

### 4. 文本截断
我们也可以调整 SwiftUI 截断文本的方式: 默认情况下，从末尾删除文本并在那里显示省略号，但也可以将省略号放在中间或开头，具体取决于字符串各个部分的重要程度。

例如: 以下代码会在中间截断文本
```swift
Text("This is an extremely long string that will never fit even the widest of Phones.")
    .lineLimit(0)
    .truncationMode(.middle)
```
效果预览:
![1.2_text_truncation_mode_middle](img/1.2_text_truncation_mode_middle.png "truncationMode = middle")
不管我们如何截断文本，我们将看到文本视图始终位于主视图（main view）的中心。这是 SwiftUI 的默认行为 -- 除非我们明确告诉 SwiftUI 将视图定位到其它位置，否则 SwiftUI 会将视图定位到相对于屏幕中心的位置。