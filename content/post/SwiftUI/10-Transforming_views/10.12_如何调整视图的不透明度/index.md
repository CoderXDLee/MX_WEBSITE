---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "10.12_如何调整视图的不透明度"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Transforming views"]
categories: ["SwiftUI"]
date: 2019-08-06T14:19:22+08:00
lastmod: 2019-08-06T14:19:22+08:00
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
通过 `opacity()` 修改器，我们可以将任何 SwiftUI 视图设置成部分或全部透明。它接收 _0(完全不可见)_ 到 _1(完全不透明)_ 之间的值。就像 UIKit 中 `UIView` 的 `alpha` 属性一样。

例如: 下面代码创建一个带有红色背景的文本视图，然后给它30％的不透明度:
```swift
struct ContentView: View {
    var body: some View {
        Text("Now you see me")
            .padding()
            .background(Color.red)
            .opacity(0.3)
    }
}
```
效果预览:
![10.12_opacity](img/10.12_opacity.png "Set opacity is 0.3")