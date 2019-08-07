---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "11.6_如何组合transactions"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Animation"]
categories: ["SwiftUI"]
date: 2019-08-07T09:43:38+08:00
lastmod: 2019-08-07T09:43:38+08:00
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
添加或删除视图时，SwiftUI 允许我们使用 `combined(with:)` 方法组合 **转换** 以创建新的动画样式。 

例如，我们可以同时将视图移动（一次转换）和淡入淡出（第二次转换），如下所示:
```swift
Text("Details go here...")
    .transition(AnyTransition.opacity.combined(with: .slide))
```

为了使组合转换更易于使用和重用，我们可以在 `AnyTransition` 上将它们创建为扩展，如下所示:
```swift
extension AnyTransition {
    static var moveAndScale: AnyTransition {
        AnyTransition.move(edge: .bottom).combined(with: .scale)
    }
}
```

有了这个，我们现在可以使用以下内容添加或删除文本视图:
```swift
Text("Details go here...")
    .transition(.moveAndScale)
```