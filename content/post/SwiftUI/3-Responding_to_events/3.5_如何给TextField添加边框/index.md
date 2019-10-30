---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "3.5_如何给TextField添加边框"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Responding to events"]
categories: ["SwiftUI"]
date: 2019-07-27T22:42:34+08:00
lastmod: 2019-07-27T22:42:34+08:00
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
SwiftUI 的 `TextField` 视图默认没有样式，这意味着在屏幕上它是一个空白区域。如果这样就符合你想要的风格，那就太好了，你已经完成了。但是，我们大多时候更希望在 `TextField` 周围添加边框，以使其更清晰。

如果想获得我们习惯使用的 UITextField 的圆角矩形样式，我们应该使用 `.textFieldStyle(RoundedBorderTextFieldStyle())` 修饰符，如下所示:
```swift
struct ContentView: View {
    @State private var name = ""
    var body: some View {
        TextField("Enter your name", text: $name)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}
```
效果预览:
![3.5_textfield_style_rounded_border](img/3.5_textfield_style_rounded_border.png "textFieldStyle is roundedBorder style")

