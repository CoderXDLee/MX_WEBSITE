---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "1.8_如何显示几何形状"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Text and image"]
categories: [SwiftUI]
date: 2019-07-24T15:46:01+08:00
lastmod: 2019-07-24T15:46:01+08:00
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

如果我们想在应用程序中使用简单地几何形状，我们可以直接创建它们，然后根据需要对它们进行着色和定位。
### 1. 矩形
例如，如果我们想要一个 `200x200` 红色矩形，可以使用如下代码:
```swift
var body: some View {
    Rectangle()
        .fill(Color.red)
        .frame(width: 200, height: 200)
}
```
运行效果:
![square_red_wh200](img/square_red_wh200.png "Square: 200 x 200")

### 2. 圆
同样，如果你想要一个 `50x50` 的蓝色圆圈，您可以使用如下代码:
```swift
var body: some View {
    Circle()
        .fill(Color.blue)
        .frame(width: 50, height: 50)
}
```
运行效果:
![circle_blue_r50](img/circle_blue_r50.png "Circle: 50 x 50")
