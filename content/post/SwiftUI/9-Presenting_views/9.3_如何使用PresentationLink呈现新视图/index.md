---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "9.3_如何使用PresentationLink呈现新视图"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Presenting views"]
categories: ["SwiftUI"]
date: 2019-08-05T18:11:53+08:00
lastmod: 2019-08-05T18:11:53+08:00
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
SwiftUI 的 `PresentationLink` 用于以现有视图控制器的基础上以模态方式呈现新视图控制器，例如在 `UIViewController` 上调用 `present()`。 要使用一个，给它一些要显示的内容（一些文本、一个图像等）加上一个目的地，然后让 SwiftUI 处理其余的内容。

> 提示: 在beta 1和beta 2中，它被命名为 `PresentationButton`。

例如，如果我们有这样的详细视图:
```swift
struct DetailView: View {
    var body: some View {
        Text("Detail")
    }
}
```
然后你我们可以这样呈现:
```swift

```