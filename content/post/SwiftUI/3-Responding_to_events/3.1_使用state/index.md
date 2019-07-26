---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "3.1_使用state"
subtitle: ""
summary: " "
authors: [admin]
tags: ["SwiftUI"]
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

所有的应用程序都会发生状态改变。 
例如:

* 用户点击了一个按钮来显示更多信息
* 用户在文本框中输入了一些文本
* 用户从日期选择器中选择了一个日期

所有涉及应用程序从一种状态转变到另一种状态的事情，都叫做应用程序改变状态。

state 的问题是它很混乱: 当它发生变化时，我们需要发现变化并更新我们的布局以匹配。 这可能一开始听起来很简单，但随着我们的状态不断增长，它变得越来越难 - 很容易忘记更新一件事，或者更新顺序出错，以致用户界面状态不符合预期。
SwiftUI通过从控件中移除状态来解决这个问题。 当我们向视图添加属性时，它们实际上是惰性的 - 当然，它们具有值，但更改它们（这些值）并不会做任何事情。 但是如果我们在这些属性之前添加了特殊的@State属性，SwiftUI将自动监视变化并更新使用该状态的视图的任何部分。
当涉及某种状态时 - 例如，当切换开关（toggle switch）改变时告诉状态属性改变 - 我们不能直接引用该属性。这是因为Swift认为我们现在所指的是值，而不是说“请注意这件事”。幸运的是，SwiftUI的解决方案是在属性名称前放置一个美元符号，这样我们就可以引用数据本身而不是它当前的值。我知道这开始有点令人困惑，但在我们学习一两个小时后就会理解它是第二天性。
请记住，SwiftUI是声明性的，这意味着我们预先告诉它所有可能状态的所有布局，并让它知道当属性发生变化时如何在它们之间移动。我们称之为绑定（binding） - 要求 SwiftUI 同步UI控件和底层属性之间的更改。
如果你已经习惯了一种更为迫切的编程风格，那么使用 state 一开始会让你头疼一些，但请相信我 - 一旦你完成了这一点，一切都会一帆风顺。