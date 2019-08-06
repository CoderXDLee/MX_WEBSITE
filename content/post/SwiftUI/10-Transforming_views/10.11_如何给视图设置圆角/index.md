---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "10.11_如何给视图设置圆角"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Transforming views"]
categories: ["SwiftUI"]
date: 2019-08-06T14:06:51+08:00
lastmod: 2019-08-06T14:06:51+08:00
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
通过 `cornerRadius()` 修改器，我们可以给任何 SwiftUI 视图设置圆角。这需要一个简单地值来限定如何明确地成圆。

因此，我们可以创建一个25点圆角的文本视图，如下所示:
```swift
struct ContentView: View {
    var body: some View {
        Text("Round me")
            .padding()
            .background(Color.red)
            .cornerRadius(20)
    }
}
```
效果预览:
![10.11_round_the_corner_25](img/10.11_round_the_corner_25.png "Round the corner")