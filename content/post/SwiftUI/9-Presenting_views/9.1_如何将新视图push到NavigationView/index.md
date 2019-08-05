---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "9.1_如何将新视图push到NavigationView"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Presenting views"]
categories: ["SwiftUI"]
date: 2019-08-05T16:58:35+08:00
lastmod: 2019-08-05T16:58:35+08:00
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
如果我们有一个导航视图，并且希望将一个新视图 push 到 SwiftUI 的导航堆栈上，那么我们应该使用 `NavigationLink`，在 beta 1和2 中使用的是 `NavigationButton`。这将一个目标作为它的第一个参数，以及在按钮内部显示什么作为它的第二个参数（或者作为一个尾随闭包），并负责将新视图和动画一起 push 到堆栈上。

例如: 如果我们有这样一个 **详细视图**:
```swift
struct DetailView: View {
    var body: some View {
        Text("Detail")
    }
}
```
然后我们可以这样呈现它:
```swift
struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: DetailView(), label: {
                Text("Click!")
                    .background(Color.red)
            })
            .navigationBarTitle(Text("Navigation"))
        }
    }
}
```
效果预览:
![9.1_push_view_to_navigationview](img/9.1_push_view_to_navigationview.png "Push a view onto the navigationView")