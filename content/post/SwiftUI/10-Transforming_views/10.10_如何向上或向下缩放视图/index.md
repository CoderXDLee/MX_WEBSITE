---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "10.10_如何向上或向下缩放视图"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Transforming views"]
categories: ["SwiftUI"]
date: 2019-08-06T13:13:23+08:00
lastmod: 2019-08-06T13:13:23+08:00
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
### 1. 初识
SwiftUI的 `scaleEffect()` 修改器允许我们自由地增大或减小视图的大小。

### 2. 放大视图
例如，我们可以将文本视图设置为常规大小的五倍，如下所示:
```swift
struct ContentView: View {
    var body: some View {
        Text("Up we go")
            .scaleEffect(5)
    }
}
```
![10.10_scale_up_5](img/10.10_scale_up_5.png "Make a text view five times its regular size")

### 3. 独立缩放XY
如果需要，可以独立缩放X和Y尺寸，从而可以挤压以下视图:
```swift
struct ContentView: View {
    var body: some View {
        Text("Up we go")
            .scaleEffect(x: 1, y: 5)
    }
}
```
![10.10_scale_x_y](img/10.10_scale_x_y.png "Scale the X and Y dimensions independently")

### 4. 设置锚点
如果您想要更多控制，可以为此缩放指定锚点，如下所示:
```swift
struct ContentView: View {
    var body: some View {
        Text("Up we go")
            .scaleEffect(2, anchor: UnitPoint(x: 1, y: 1))
    }
}
```
![10.10_scale_with_anchor](img/10.10_scale_with_anchor.png "Specify an anchor")
这使得文本视图两倍于常规大小，从右下角缩放。