---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "7.1_使用容器"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Container"]
categories: ["SwiftUI"]
date: 2019-08-02T18:06:43+08:00
lastmod: 2019-08-02T18:06:43+08:00
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
SwiftUI 设计为开箱即用，这意味着我们可以根据需要将一个视图放在另一个视图中。

这在处理我们习惯的主要容器视图（如导航控制器和选项卡栏控制器）时特别有用。我们可以将想要的任何视图直接放置到另一个容器视图中，Swiftui将自动调整其布局。

在这方面，Swiftui自己的容器—— `NavigationView`、`TabbedView`、`Group` 等等——与我们用自己的视图组合制作的容器没有什么不同。