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
由于 SwiftUI 将重点放在声明性用户界面上，因此它为我们提供了一种构建表单的奇妙机制——用于收集信息的用户输入控件集合，例如订单或设置界面。
更好的是，SwiftUI 的几个部分会自动适应放置在表单中——它们的外观和行为会发生变化，因此它们可以更好地与其他输入控件组一起工作。
如果你认为这很聪明，你会喜欢这个: SwiftUI 实际上动态地调整布局，以便它可以根据你的代码运行的平台自动为我们制作全新的屏幕 - 它完全解耦了目的 我们的视觉控制。 这意味着我们描述了我们想要的东西，SwiftUI 找出了在当前平台上实现这一目标的惯用方法。
提示：`Form` 和 `VStack` 一样是常规的容器，因此您可以根据自己的目的在这两者之间自由切换。