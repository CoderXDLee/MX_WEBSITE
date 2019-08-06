---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "10.5_如何在视图周围绘制边框"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Transforming views"]
categories: ["SwiftUI"]
date: 2019-08-06T10:17:54+08:00
lastmod: 2019-08-06T10:17:54+08:00
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
### 1. 简介
SwiftUI 为我们提供了一个专用的 `border` 修改器，用于在视图周围绘制边框。根据我们是要指定笔划宽度(a stroke width)还是圆角半径(a corner radius)，它有一些变化，因此下面是几个示例:

### 2. 绘制1个点的边框
下面的代码在文本视图周围绘制1个点的黑色边框:
```swift
struct ContentView: View {
    var body: some View {
        Text("Hello SwiftUI")
            .border(Color.black)
    }
}
```
效果预览:
![10.5_border_1_point](img/10.5_border_1_point.png "This adds a simple 1-point black border around a text view")

### 3. 先添加填充再绘制边框
如果要使边框不位于视图边缘，请先添加一些填充：
```swift
struct ContentView: View {
    var body: some View {
        Text("Hello SwiftUI")
            .padding()
            .border(Color.black)
    }
}
```
效果预览:
![10.5_border_with_padding](img/10.5_border_with_padding.png "Add some padding first, then add border")

### 4. 添加4个点的红色边框
```swift
struct ContentView: View {
    var body: some View {
        Text("Hello SwiftUI")
            .padding()
            .border(Color.red, width: 4)
    }
}
```
效果预览:
![10.5_border_4_point_red](img/10.5_border_4_point_red.png "This adds a 4 point red border")