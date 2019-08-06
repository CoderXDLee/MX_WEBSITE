---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "10.7_如何剪裁视图使其只有部分可见"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Transforming views"]
categories: ["SwiftUI"]
date: 2019-08-06T11:01:10+08:00
lastmod: 2019-08-06T11:01:10+08:00
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
通过使用 `clipShape()` 修改器，SwiftUI允许我们剪切任何视图以控制其形状。

### 2. 创建圆形按钮
例如: 下面的代码使用系统图像 `bolt.fill` 创建一个按钮，给它一些填充和背景颜色，然后使用圆形剪裁它，以便我们得到一个圆形按钮:
```swift
struct ContentView: View {
    var body: some View {
        Button(action: {
            print("Button tapped!")
        }, label: {
            Image(systemName: "bolt.fill")
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .clipShape(Circle())
        })
    }
}
```
效果预览:
![10.7_create_circle_button](img/10.7_create_circle_button.png "Create a circle button")

`Circle` 剪辑形状将始终从视图中创建圆圈，即使它们的宽度和高度不相等 - 它只会裁剪较大的值以匹配较小的值。

### 3.
除了 `Circle` 之外，还有 `Capsule`，它可以看到圆形的菱形形状。 例如，下面的代码使用 `Capsule` 形状创建相同的按钮:
```swift
struct ContentView: View {
    var body: some View {
        Button(action: {
            print("Button tapped!")
        }, label: {
            Image(systemName: "bolt.fill")
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                .background(Color.green)
                .clipShape(Capsule())
        })
    }
}
```
效果预览:
![10.7_create_capsule_button](img/10.7_create_capsule_button.png "Create a capsule button")