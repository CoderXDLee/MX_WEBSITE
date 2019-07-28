---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "3.1_使用 state"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Responding to events"]
categories: ["SwiftUI"]
date: 2019-07-26T22:48:19+08:00
lastmod: 2019-07-26T22:48:19+08:00
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
### 1. 概念
`所有应用程序都会改变状态。` 

例如:

* 用户可能点击了一个按钮来显示更多信息
* 用户可能已经在文本框中输入了一些文本
* 用户从日期选择器中选择了一个日期

所有涉及应用程序 **从一种状态转变到另一种状态** 的事情，都叫做应用程序改变状态。

### 2. 问题所在
状态的问题在于它是混乱的: **当它发生变化时，我们需要发现变化并更新我们的布局来匹配变化**。 这个一开始听起来可能很简单，但是随着我们的状态的不断增长，它就会变得越来越难 - 因为这个时候，我们很容易忘记更新一件事，或者更新顺序出错，以致于用户界面状态达不到预期效果。

### 3. SwiftUI 如何破解？
SwiftUI 通过 **从控件中移除状态** 来解决这个问题。

当我们向视图添加属性时，这些属性实际上是惰性的 - 当然，它们有值，但是更改这些值并不会做任何事情。 但是如果我们在这些属性之前添加了特殊的`@State` 来包装属性，SwiftUI将自动监视属性变化并更新使用该属性的视图的任何部分。

示例代码:
```swift
@state var name: String = ""
```

> **注意**: `@state` 这种语法称为 属性包装器，这里不作详细介绍，可以自行查找文档。

当涉及到某种状态时 - 例如，当切换开关（toggle switch）改变时告诉状态属性改变。
**这里需要注意的是**: 我们不能直接引用这个属性属性。这是因为 Swift 会认为我们现在所指的是`"属性当前的值"`，而不是说 `"请注意这件事情(属性状态变化)"`。幸运的是，SwiftUI 的解决方案是在属性名称前放置一个`美元符号($)`，这样的话，我们就可以引用属性本身而不是它当前的值。

> 当然，这里一开始理解起有点令人困惑，但在当我们学习一两个示例之后就会理解，非常简单。

最后，请记住，SwiftUI 是声明性的，这意味着我们预先告诉它所有可能状态的所有布局，并让它知道当属性发生变化时如何在它们之间移动。我们称之为 **_绑定（binding）_** - 要求 SwiftUI 同步UI控件和底层属性之间的更改。
如果你已经习惯了一种更为迫切的编程风格，那么使用 state 一开始会让你头疼一些，但不要担心 - 一旦你完成了它，你就很明确了。