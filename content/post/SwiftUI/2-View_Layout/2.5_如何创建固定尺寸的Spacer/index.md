---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "2.5_如何创建固定尺寸的Spacer"
subtitle: ""
summary: " "
authors: [admin]
tags: ["View layout"]
categories: ["SwfitUI"]
date: 2019-10-12T23:25:11+08:00
lastmod: 2019-10-12T23:25:11+08:00
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

SwiftUI 的 `Spacer` 视图会自动填充其扩展轴上的所有可用空间，这是一种奇特的说法: 即根据我们所放置的内容，它们在水平或垂直方向上会占用尽可能多的空间。

如果要制作一个精确大小的 `Spacer`，则可以执行与其他视图相同的操作: 使用具有所需大小的 `frame()` 修饰符。

例如，这显示了两个文本视图，它们之间有一个50点的空格：
```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Text("First Label")
                .background(Color.red)
            Spacer()
                .frame(height: 50)
            Text("Second Label")
                .background(Color.blue)
        }
    }
}
```
效果预览:
![2.5_make_a_fix_spacer.png](img/2.5_make_a_fix_spacer.png "Make a fix size spacer view")