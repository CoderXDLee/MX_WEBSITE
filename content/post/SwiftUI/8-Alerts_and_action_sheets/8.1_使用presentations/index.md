---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "8.1_使用presentations"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Alerts and action sheets"]
categories: ["SwiftUI"]
date: 2019-08-05T11:54:02+08:00
lastmod: 2019-08-05T11:54:02+08:00
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
projects: [""]
---
<!-- more -->
SwiftUI 的声明性编程方法意味着我们不会像在 UIKit 中那样创建和呈现 **警报(Alerts)** 和 **操作表(Action sheets)**。 相反，我们定义了它们应该什么条件下显示，告诉它它们应该是什么样子，然后让它自己计算出其余部分。

这一切都是通过使用 `presentation()` 修饰符来完成的，该修饰符将新 UI 附加到我们的视图中，当满足某个条件时将显示该 UI。我们可以根据需要附加任意多个，并且它们实际上会等待观察，直到它们的状态变为真(true)，这个时候，它们显示自己的 UI。例如: 我们可以在按下按钮时切换一个布尔值，这会触发要显示的警报(alerts)。

我们可以将演示文稿附加到主视图或其任何子视图，甚至是可以调整状态的按钮，以便触发演示文稿。这是一个微妙的区别，但重要的是要理解，这些演示文稿并没有附加到按钮上，因为它是一个按钮，也就是说，由于点按了按钮，所以不会以任何方式显示警报(alerts)。相反，我们将它附加到我们的视图层次结构中，以便 SwiftUI 知道它可能在任何时候显示。