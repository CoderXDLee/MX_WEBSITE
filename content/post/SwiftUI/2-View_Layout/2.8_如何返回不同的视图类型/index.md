---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "2.8_如何返回不同的视图类型"
subtitle: ""
summary: " "
authors: [admin]
tags: ["View layout"]
categories: ["SwfitUI"]
date: 2019-07-25T13:47:21+08:00
lastmod: 2019-07-25T13:47:21+08:00
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

当我们从视图的 body 返回 `some View` 的时候，Swift 会理解为这意味着我们拥有一个特定的返回类型。

例如: 如果我们想掷硬币并显示 "你赢了!"的图像，或是一些文字，表示 "下次运气更好"， 那么我们不能这样写: 
```swift
var body: some View {
    if Bool.random() {
        Image("example-image")
    } else {
        Text("Better luck next time")
    }
}
```
这段代码会报错:
![2.8_error_return_view_type](img/2.8_error_return_view_type.png "Compilation error")
因为它可能返回 _Image_ 或者 _Text_ ，这是不允许的 --  我们`必须精确返回一种类型`。

有两种方法可以解决这个问题。
### 1. Group
第一种方法是将输出包装在一个 `group` 中，这样无论我们发送图像视图还是文本视图，它们都将返回到一个 `group` 中:
```swift
var body: some View {
    Group {
        if Bool.random() {
            Image("example-image")
        } else {
            Text("Better luck next time")
        }
    }
}
```
运行效果:
![2.8_return_view_in_group](img/2.8_return_view_in_group.png "Return an image or a text in a group.")

### 2. AnyView
第二种方法，SwiftUI 提供了一个名为 `AnyView` 的类型擦除包装器，我们可以返回这种类型:
```swift
var body: AnyView {
    if Bool.random() {
        return AnyView(Image("example-image"))
    } else {
        return AnyView(Text("Better luck next time"))
    }
}
```
效果预览:
![2.8_return_view_in_anyView.png](img/2.8_return_view_in_anyView.png "Return an image or a text in an anyView.")

如果你还没有听说过这个概念，它会强制让 Swift 忘记 `AnyView` 中包含的特定类型，让它们看起来像是一样的东西。但这会降低性能，所以请不要经常使用它。
尽管 `Group` 和 `AnyView` 都为我们实现了相同的布局效果，但通常最好使用 `Group`，因为它对 SwiftUI 效率更高。
