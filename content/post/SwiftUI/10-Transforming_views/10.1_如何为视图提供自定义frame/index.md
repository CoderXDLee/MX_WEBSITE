---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "10.1_如何为视图提供自定义frame"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Transforming views"]
categories: ["SwiftUI"]
date: 2019-08-06T00:19:31+08:00
lastmod: 2019-08-06T00:19:31+08:00
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
默认情况下，视图只占用所需的空间，但是如果您希望更改空间，可以使用 `frame()` 修饰符告诉SwiftUI 您想要的大小范围是什么。

例如，可以创建一个具有200x200可点击区域的按钮，如下所示:
```swift
struct ContentView: View {
    var body: some View {
        Button(action: {
            print("Button tapped")
        }, label: {
            Text("Welcome")
                .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 200, alignment: .center)
                .font(.largeTitle)
        })
    }
}
```
效果预览:
![10.1_give_a_custom_frame](img/10.1_give_a_custom_frame.png "Give a custom frame")
或者，我们可以通过指定一个 frame 来使文本视图填充这个屏幕，这个 frame 的最小宽度和最小高度为0，最大宽度和最大高度是无穷大。如下所示:
```swift
Text("Please login")
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    .font(.largeTitle)
    .foregroundColor(Color.white)
    .background(Color.red)
```