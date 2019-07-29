---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "5.1_使用List"
subtitle: ""
summary: " "
authors: [admin]
tags: ["List"]
categories: ["SwiftUI"]
date: 2019-07-29T01:40:08+08:00
lastmod: 2019-07-29T01:40:08+08:00
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
SwiftUI 的 `List` 视图类似于 `UITableView`，它可以根据您的需要显示静态或动态表视图单元格(table view cells)。 但是，它使用起来要简单得多:

* 我们不需要在 storyboard 中创建原型cell( _prototype cell_ ); 
* 也不需要在代码中注册 Cell; 
* 我们不需要告诉它有多少行; 
* 我们不需要手动出列(dequeue)和配置单元格等等。

相反，SwiftUI 的列表是为可组合性而设计的 - 旨在能够从较小的东西构建更大的东西。 因此，SwiftUI 不需要一个手动配置单元的大视图控制器，而是让我们构建小视图，知道如何将自己配置为列表行，然后使用它们。

在代码大小方面（如果没有其他的话），差异是惊人的——您可以删除几乎所有的表视图代码，仍然可以获得与您习惯的相同的出色外观和感觉。