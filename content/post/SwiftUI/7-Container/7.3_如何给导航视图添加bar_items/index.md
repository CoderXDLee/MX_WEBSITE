---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "7.3_如何给导航视图添加bar_items"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Container"]
categories: ["SwiftUI"]
date: 2019-08-05T11:06:31+08:00
lastmod: 2019-08-05T11:06:31+08:00
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
通过 `navigationBarItems()` 修饰符，我们可以在导航视图的 _前缘(leading)_ 和 _后缘(trailing)_  添加 **bar items**。这些 **bar items** 可能是一个可点击的按钮，但没有任何限制 - 您可以添加任何类型的视图。

例如: 我们可以在导航视图的后缘(trailing)添加一个 **帮助按钮**:
```swift
struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("Hello SwiftUI")
                .navigationBarTitle(Text("Welcome"))
            .navigationBarItems(trailing:
                Button(action: {
                    print("Help tapped!")
                }, label: {
                    Text("Help")
                })
            )
        }
    }
}
```
效果预览:
![navigationview_add_bar_items](img/navigationview_add_bar_items.png "Add bar items.")