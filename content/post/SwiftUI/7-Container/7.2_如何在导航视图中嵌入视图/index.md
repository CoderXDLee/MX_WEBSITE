---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "7.2_如何在导航视图中嵌入视图"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Container"]
categories: ["SwiftUI"]
date: 2019-08-02T18:18:22+08:00
lastmod: 2019-08-02T18:18:22+08:00
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
### 1. 简介
SwiftUI 中的 `NavigationView` 几乎等同于 UIKit 中的 `UINavigationController`，因为它不仅可以呈现内容，而且它能够处理视图之间的导航，并在屏幕顶部放置一个导航栏。

### 2. 嵌入文本视图
接下来，我们以最简单的形式，将文本视图放入导航视图中，如下所示:
```swift
struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("Hello SwiftUI")
        }
    }
}
```
效果预览:
![navigationview_embed_text_no_navigationbar](img/navigationview_embed_text_no_navigationbar.png "Embed a text in  the navigationView")

### 3. 设置导航栏标题
但是这样，顶部的导航栏为空。因此，通常在嵌入的内容上使用 `navigationBarTitle()` 修饰符，因此，我们可以在屏幕顶部添加标题，如下所示:
```swift
NavigationView {
    Text("Hello SwiftUI")
        .navigationBarTitle(Text("Welcome"))
}
```
效果预览:
![navigationview_embed_text_has_navigationbar](img/navigationview_embed_text_has_navigationbar.png "Embed a text in the navigationView which has a navigationBar")

### 4. 自定义导航标题
`navigationBarTitle()` 修饰符为我们提供了一些自定义选项。

例如: 默认情况下，它将从呈现它的任何视图继承大型标题显示模式，或者如果它是初始视图，那么它将使用大型标题。但是，如果我们想强制启用或禁用大标题，那么我们应该使用 `inline` 参数，如下所示:
```
.navigationBarTitle(Text("Welcome"), displayMode: .inline)
```
效果预览:
![navigationview_navigationbar_inline](img/navigationview_navigationbar_inline.png "Display mode is inline.")