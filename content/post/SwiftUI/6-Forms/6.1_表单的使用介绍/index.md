---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "6.1_表单的使用介绍"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Forms"]
categories: ["SwiftUI"]
date: 2019-08-02T00:21:32+08:00
lastmod: 2019-08-02T00:21:32+08:00
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
### 简介

* SwiftUI 专注于声明性用户界面，因此它为我们提供了一种构建 `表单(Form)` 的绝佳机制也就不足为奇了。
* `表单(Form)` 指的是用于**收集信息**的用户输入控件的集合，例如 _订单表单_ 或 _设置界面_ 。
* 更好的是，在表单中，SwiftUI 的几个部分会自适应放置——它们的外观和行为会发生变化，因此它们与其它输入控件组一起工作得更好。

如果你认为这很聪明，你会喜欢这个: 实际上 SwiftUI 会动态地调整布局，以便它可以根据代码运行的平台自动为我们生成全新的页面 - 它完全将控件的目的与它们的视觉效果分离开来。 这意味着我们描述了我们想要的东西，SwiftUI 找出了在当前平台上实现这一目标的惯用方法。

> **提示:** `Form` 和 `VStack` 一样是常规容器，因此我们可以根据需要在这两者之间自由切换。