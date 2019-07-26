---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "2.7_如何使用size_classes创建不同的布局"
subtitle: ""
summary: " "
authors: [admin]
tags: ["SwiftUI"]
categories: ["SwiftUI"]
date: 2019-07-26T16:52:17+08:00
lastmod: 2019-07-26T16:52:17+08:00
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
SwiftUI 通过在环境中暴露 _size classes_ 来原生支持它。如果要使用它，我们首先需要创建一个 `@Environment` 对象来存储其值，如下所示:
```swift
@Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
```
然后在我们需要时检查该属性的值，查找 `.compact` 或 `.regular`，如下所示:
```swift
if horizontalSizeClass == .compact {
    return Text("Compact")
} else {
    return Text("Regular")
}
```
将所有代码组合在一起，可以创建这样的视图:
```swift
struct ContentView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        if horizontalSizeClass == .compact {
            return Text("Compact")
        } else {
            return Text("Regular")
        }
    }
}
```
运行效果:

(1) 正向竖屏
![size_classes_compact](img/size_classes_compact.png "Text - Compact")
(2) 横屏 - 刘海在右侧
![size_classes_regular01](img/size_classes_regular01.png "Text - Regular01")
(3) 横屏 - 刘海在左侧
![size_classes_regular02](img/size_classes_regular02.png "Text - Regular02")