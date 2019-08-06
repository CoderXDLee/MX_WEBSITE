---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "10.4_如何堆叠修改器以创建更高级的效果"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Transforming views"]
categories: ["SwiftUI"]
date: 2019-08-06T10:07:51+08:00
lastmod: 2019-08-06T10:07:51+08:00
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
我们添加到视图中的每个修改器都会调整其前面的内容，并且可以多次重复使用修改器。

例如，我们可以在文本视图周围添加填充和背景色，然后添加更多的填充和不同的背景色，然后添加更多的填充和第三种背景色，所有这些都可以产生特定的效果:
```swift
struct ContentView: View {
    var body: some View {
        Text("Forecast: Sun")
            .font(.largeTitle)
            .foregroundColor(Color.white)
            .padding()
            .background(Color.red)
            .padding()
            .background(Color.orange)
            .padding()
            .background(Color.yellow)
    }
}
```
效果预览:
![10.4_stack_modifiers](img/10.4_stack_modifiers.png "Stack modifiers")