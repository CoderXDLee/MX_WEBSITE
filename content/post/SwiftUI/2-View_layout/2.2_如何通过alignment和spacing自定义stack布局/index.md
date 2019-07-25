---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "2.2_如何通过alignment和spacing自定义stack布局"
subtitle: ""
summary: " "
authors: []
tags: []
categories: []
date: 2019-07-25T10:54:52+08:00
lastmod: 2019-07-25T10:54:52+08:00
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

### 1. `spacing`
我们可以通过在 SwiftUI stacks 的构造方法中填一个值来设置间距，如下所示:
```swift
var body: some View {
    VStack(spacing: 50) {
        Text("Hello SwiftUI")
            .background(Color.red)
        Text("Hello M X")
            .background(Color.blue)
    }
}
```
运行效果:
![stack_spacing](img/stack_spacing.png "Set a spacing for stack")

### 2. `Divider`
我们可以在项目之间创建分隔符，以便 SwiftUI 在 _stack_ 中的每个项目之间进行小的视觉区分，如下所示:
```swift
var body: some View {
    VStack {
        Text("Hello SwiftUI")
           .background(Color.red)
        Divider()
        Text("Hello M X")
           .background(Color.blue)
    }
}
```
运行效果:
![stack_divider](img/stack_divider.png "Set a divider for stack")

### 3. `alignment`
默认情况下，_stacks_ 中的项目居中对齐。

* 在 _HStack_ 中: 项目在中间垂直对齐，因此如果有两个不同高度的文本视图，它们都将与垂直中心对齐。
* 在 _VStack_ 中: 项目在中间水平对齐，因此如果有两个长度不同的文本视图，它们都将与水平中心对齐。

要调整这种情况，请在创建 _stack_ 时按以下方式传递一个 _alignment_ 参数:
```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("Hello SwiftUI")
           .background(Color.red)
        Text("Hello M X")
            .background(Color.blue)
    }
}
```
运行效果:
![stack_alignment_leading](img/stack_alignment_leading.png "Set alignment to .leading")

这将使 `Hello SwiftUI` 和 `Hello M X` 左对齐，但它们最终将位于屏幕的中间，因为 stack 只占用所需的空间。

### 4.同时设置 `alignment` 和 `spacing`
我们可以同时使用 _alignment_ 和 _spacing_ ，如下所示:
```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        Text("Hello SwiftUI")
            .background(Color.red)
        Text("Hello M X")
            .background(Color.blue)
    }
}
```
运行效果:
![stack_alignment_spacing](img/stack_alignment_spacing.png "Using alignment and spacing in stack")

这将使两个文本视图水平对齐到 `leading`（对于从左到右的语言是左对齐），并在它们之间放置20个点的垂直间距。