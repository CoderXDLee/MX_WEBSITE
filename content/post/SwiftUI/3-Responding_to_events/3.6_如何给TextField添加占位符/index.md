---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "3.6_如何给TextField添加占位符"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Responding to events"]
categories: ["SwiftUI"]
date: 2019-07-27T22:59:59+08:00
lastmod: 2019-07-27T22:59:59+08:00
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
SwiftUI 的 `TextField` 支持占位符文本，就像 `UITextField` 一样 -- 当 TextField 为空时在 TextField 中显示灰色文本。要么使用提示（”Enter your password“），要么显示一些示例数据。

要设置 placeholder，请将其作为 TextField 初始化设置的一部分传入，如下所示:
```swift
struct ContentView : View {
    
    @State var emailAddress = ""
    
    var body: some View {
        TextField($emailAddress, placeholder: Text("test@gmail.com"))
            .textFieldStyle(.roundedBorder)
            .padding()
    }
}
```
运行效果:
![textfield_placeholder](img/textfield_placeholder.png "Set a placeholder for text field)
这将在 TextField 中显示占位文本 `test@gmail.com`，而 TextField 为空，但一旦用户在其中键入内容，占位文本就会消失。