---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "12.2_如何将文本视图组合在一起"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Composing views"]
categories: ["SwiftUI"]
date: 2019-08-07T16:46:10+08:00
lastmod: 2019-08-07T16:46:10+08:00
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
SwiftUI 的文本视图会重载 `+` 运算符，以便我们可以将它们组合在一起以创建新的文本视图。

当我们需要在视图中使用不同的格式时，这很有用，因为我们可以使每个文本视图看起来完全符合我们的要求，然后将它们连接在一起以创建单个组合文本视图。 更好的是，`VoiceOver` 在阅读它们时会自动将它们识别为单个文本。

### 2. 组合3个文本视图 - 不同字体
例如，下面代码会创建三个文本视图，然后使用 `+` 将它们连接到要返回的单个文本视图中:
```swift
struct ContentView: View {
    var body: some View {
        Text("SwiftUI")
            .font(.largeTitle)
        + Text("is ")
            .font(.headline)
        + Text("awesome")
            .font(.footnote)
    }
}
```
效果预览:
![12.2_combine_three_text_views](img/12.2_combine_three_text_views.png "Combine three text views")

 
### 3. 组合3个文本视图 - 不同文本颜色
```swift
struct ContentView: View {
    var body: some View {
        Text("SwiftUI ")
            .foregroundColor(.red)
        + Text("is ")
            .foregroundColor(.orange)
        + Text("awesome")
            .foregroundColor(.blue)
    }
}
```
效果预览:
![12.2_combine_three_text_views_different_foregroundcolor](img/12.2_combine_three_text_views_different_foregroundcolor.png "Combine three text views with different foreground colors")

> **提示**: 像这样组合文本视图与我们在 SwiftUI 中组合字符串一样接近。