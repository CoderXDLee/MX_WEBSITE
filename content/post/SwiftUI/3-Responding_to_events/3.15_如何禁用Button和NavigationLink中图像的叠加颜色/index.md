---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "3.15_如何禁用Button和NavigationLink中图像的叠加颜色"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Responding to events"]
categories: ["SwiftUI"]
date: 2019-11-19T16:39:10+08:00
lastmod: 2019-11-19T16:39:10+08:00
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

默认情况下，在 `NavigationLink` 或 `Button` 内部绘制的图像几乎不会表现出预期的效果: 整个图像将被不透明的蓝色或视图中带有任何强调色的颜色覆盖。

有两种方法可以解决这个问题；选择哪种方法取决于我们想要的行为(behavior)。

首先，可以将 `buttonStyle()` 修饰符与 `PlainButtonStyle()`一起使用，如下所示:
```swift
struct ContentView: View {
    var body: some View {
        // 1. NavigationLink
        NavigationView {
            NavigationLink(destination: Text("Detail view here")) {
                Image("example-image")
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}
```
效果预览:
![3.15_overlay_color_image_inside_navigationlink](img/3.15_overlay_color_image_inside_navigationlink.png "Overlay color image inside navigation link")

或像这样的普通按钮:
```swift
struct ContentView: View {
    var body: some View {
        // 2. Button
        Button(action: {
            // your action here
        }) {
            Image("example-image")
        }
        .buttonStyle(PlainButtonStyle())
    }
}
```
效果预览:
![3.15_overlay_color_image_inside_button](img/3.15_overlay_color_image_inside_button.png "Overlay color image inside button")

使用该修饰符后，我们的原始图像将按预期显示。

或者，我们也可以使用 `renderingMode()` 模式修饰符来获得略有不同的结果:
```swift
struct ContentView: View {
    var body: some View {
        // 3. renderingMode
        NavigationView {
            NavigationLink(destination: Text("Detail view here")) {
                Image("example-image")
                    .renderingMode(.original)
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}
```
效果预览:
![3.15_overlay_color_image_inside_navigationlink_renderingmode](img/3.15_overlay_color_image_inside_navigationlink_renderingmode.png "Using renderingMode")

区别是微妙的，但很重要: 如果在列表中使用 Button，则使用 `.buttonStyle(PlainButtonStyle())` 意味着只能轻按按钮内容周围的空格，而如果使用 `.renderingMode(.original)`，则整个单元格仍可轻敲。