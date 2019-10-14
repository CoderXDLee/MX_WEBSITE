---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "2.10_如何使用size_classes创建不同的布局"
subtitle: ""
summary: " "
authors: [admin]
tags: ["View layout"]
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
@Environment(\.horizontalSizeClass) var horizontalSizeClass
```
然后我们可以根据需要检查该属性的值，查找 `.compact` 或 `.regular`，如下所示:
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
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
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
![2.10_size_classes_compact](img/2.10_size_classes_compact.png "Text - Compact")
(2) 横屏 - 刘海在右侧
![2.10_size_classes_regular01](img/2.10_size_classes_regular01.png "Text - Regular01")
(3) 横屏 - 刘海在左侧
![2.10_size_classes_regular02](img/2.10_size_classes_regular02.png "Text - Regular02")

SizeClass 是通过将 VStack 或 HStack 用于内容来使用户界面智能地适应可用空间的好方法。 例如，如果我们有很多空间，则可以水平放置东西，但在空间有限时切换到垂直布局。