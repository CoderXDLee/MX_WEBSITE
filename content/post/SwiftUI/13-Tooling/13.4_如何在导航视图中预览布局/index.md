---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "13.4_如何在导航视图中预览布局"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Tooling"]
categories: ["SwiftUI"]
date: 2019-08-08T10:02:39+08:00
lastmod: 2019-08-08T10:02:39+08:00
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
如果我们设计了一个视图，我们知道它将作为导航堆栈的一部分显示，但本身不包含导航视图，那么默认情况下，我们将看不到它的导航栏标题或按钮。

幸运的是，我们可以将视图添加到预览中的导航视图中——这模拟了在顶部有一个导航栏，而实际上没有为实时代码添加一个导航栏，因此我们可以准确地看到它的外观。

例如，此视图没有导航视图，但配置为在作为一个视图的一部分呈现时以特定方式显示 - 即从另一个视图推送:
```swift
struct ContentView: View {
    var body: some View {
        Text("Hello World")
            .navigationBarTitle(Text("Welcome"))
    }
}
```

要在导航视图中预览，只需在预览中的内容视图周围添加 `NavigationView`，如下所示:
```swift
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
#endif
```
这使我们可以准确地查看视图的外观，而无需修改视图的实际布局。