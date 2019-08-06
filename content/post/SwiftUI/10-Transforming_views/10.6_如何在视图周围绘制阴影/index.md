---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "10.6_如何在视图周围绘制阴影"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Transforming views"]
categories: ["SwiftUI"]
date: 2019-08-06T10:37:26+08:00
lastmod: 2019-08-06T10:37:26+08:00
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
### 1. 简介
SwiftUI 为我们提供了一个专用的 `shadow()` 修改器，用于在视图周围绘制阴影。 我们可以控制阴影的颜色、半径和位置，还可以通过调整修改器顺序来控制视图的哪些部分被阴影遮盖。

### 2. 通过模糊半径绘制阴影
在其基本形式中，我们只需指定模糊的半径即可添加阴影，如下所示:
```swift
struct ContentView: View {
    var body: some View {
        Text("Hello SwiftUI")
            .padding()
            .shadow(radius: 5)
            .border(Color.red, width: 4)
    }
}
```
效果预览:
![10.6_shadow_through_radius](img/10.6_shadow_through_radius.png "Add a shadow just by specifying the radius of the blur")
这段代码添加了一个非常轻微的阴影，以文本为中心的5点模糊。

### 3. 绘制红色阴影
我们还可以指定所需的颜色以及原始视图的X和Y偏移。 例如，下面的代码会创建一个强烈的红色阴影，其中包含5点模糊，以文本为中心：
```swift
struct ContentView: View {
    var body: some View {
        Text("Hello SwiftUI")
            .padding()
            .shadow(color: Color.red, radius: 5)
            .border(Color.red, width: 4)
    }
}
```
效果预览:
![10.6_shadow_red](img/10.6_shadow_red.png "This creates a strong red shadow with a 5 point blur")

### 4. 为阴影设置偏移量
如果要为阴影指定偏移，请将 `x` 和/或 `y` 参数添加到修改器，如下所示:
```swift
struct ContentView: View {
    var body: some View {
        Text("Hello SwiftUI")
            .padding()
            .shadow(color: Color.red, radius: 5, x: 20, y: 20)
            .border(Color.red, width: 4)
    }
}
```
效果预览:
![10.6_shadow_red_x20_y20](img/10.6_shadow_red_x20_y20.png "Add x and/or y parameters to the modifier")

### 5. 为边框绘制阴影
请记住，SwiftUI 按照列出修改器的顺序来应用它们，因此如果我们希望可以将阴影应用于边框，只需将边框修改器放在阴影修改器之前:
```swift
struct ContentView: View {
    var body: some View {
        Text("Hello SwiftUI")
            .padding()
            .border(Color.red, width: 4)
            .shadow(color: Color.red, radius: 5, x: 20, y: 20)
    }
}
```
![10.6_shadow_set_shadow_for_border](img/10.6_shadow_set_shadow_for_border.png "Apply a shadow for the border")