---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "10.17_如何通过着色和去饱和度等调整视图"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Transforming views"]
categories: ["SwiftUI"]
date: 2019-08-06T15:59:46+08:00
lastmod: 2019-08-06T15:59:46+08:00
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
SwiftUI 允许我们通过使用各种修改器来调整视图的亮度、色调、色调、饱和度等等来精细地控制视图的外观。

### 1. 给图像视图着色
例如，下面代码会创建一个图像视图并将整个事物着色为红色:
```swift
struct ContentView: View {
    var body: some View {
        Image("avatar")
            .resizable()
            .frame(width: 300, height: 300)
            .colorMultiply(.red)
    }
}
```
效果预览:
![10.17_colormultiply_red](img/10.17_colormultiply_red.png "Set colorMultiply to red")

### 2. 调整视图饱和度
我们可以将视图的饱和度调整为任意数量，其中0.0为完全灰色，1.0为其原始颜色:
```swift
struct ContentView: View {
    var body: some View {
        Image("avatar")
        .resizable()
        .frame(width: 300, height: 300)
            .saturation(0.5)
    }
}
```
效果预览:
![10.17_saturation_0.5](img/10.17_saturation_0.5.png "Set saturation to 0.5")

### 3. 动态调整视图对比度
甚至可以使用 `contrast()` 修改器动态调整视图的对比度。如果值为0.0，则不会产生对比度（浅灰色图像），1.0将提供原始图像，高于1.0的所有内容都会添加对比度。
```swift
struct ContentView: View {
    var body: some View {
        Image("avatar")
        .resizable()
        .frame(width: 300, height: 300)
            .contrast(0.5)
    }
}
```
效果预览:
![10.17_contract_0.5](img/10.17_contract_0.5.png "Set contrast to 0.5")