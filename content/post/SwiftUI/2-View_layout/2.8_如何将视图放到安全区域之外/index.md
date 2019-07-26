---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "2.8_如何将视图放到安全区域之外"
subtitle: ""
summary: " "
authors: [admin]
tags: ["SwiftUI"]
categories: ["SwiftUI"]
date: 2019-07-26T22:12:50+08:00
lastmod: 2019-07-26T22:12:50+08:00
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
默认情况下，我们的 SwiftUI 视图将主要位于安全区域内 - 它将会到达屏幕底部，但不会靠近设备顶部的任何凹口。
如果我们想改变它 - 想让视图真正全屏，即使这意味着被一个缺口或其他硬件切口部分遮挡 - 那么我们应该使用 `edgesIgnoringSafeArea()` 修饰符。
例如，这会创建一个红色文本视图，要求填充所有可用空间，然后将其设置为忽略任何安全区域，以使其真正边缘到边缘。
```swift
var body: some View {
    Text("Hello World")
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)    
        .background(Color.red)
        .edgesIgnoringSafeArea(.all)
}
```
运行效果:
![edgesIgnoringSafeArea](img/edgesIgnoringSafeArea.png "edgesIgnoringSafeArea all")
