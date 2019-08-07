---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "11.7_如何创建非对称转换"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Animation"]
categories: ["SwiftUI"]
date: 2019-08-07T15:14:58+08:00
lastmod: 2019-08-07T15:14:58+08:00
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
SwiftUI 允许我们在添加视图时指定一个转换，在删除视图时指定另一个转换，所有转换都使用  `asymmetric()` 转换类型完成。

例如，我们可以创建一个使用非对称过渡的文本视图，以便在添加时从前缘移入，并在移除时向下移动到底边，如下所示:
```swift
Text("Details go here.").transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .bottom)))
```