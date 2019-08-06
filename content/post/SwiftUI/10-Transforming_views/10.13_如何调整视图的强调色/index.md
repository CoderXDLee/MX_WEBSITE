---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "10.13_如何调整视图的强调色"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Transforming views"]
categories: ["SwiftUI"]
date: 2019-08-06T14:35:43+08:00
lastmod: 2019-08-06T14:35:43+08:00
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
iOS 使用 `tints colors` 为应用程序提供协调的主题，SwiftUI 中的 `accent colors` 也提供了相同的功能。就像在 UIKit 中一样，当您设置一个视图的 `accent color` 时，它会影响其中的所有内容，因此如果您设置顶级控件的 `accent color`，那么一切都会变色。

例如，下面代码会在 `VStack` 中创建一个按钮，然后给它一个橙色的强调颜色:
```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {}, label: {
                Text("Tap here")
            })
        }
        .accentColor(Color.orange)
    }
}
```
效果预览:
![10.13_accent_color](img/10.13_accent_color.png "Set accent color")