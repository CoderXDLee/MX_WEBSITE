---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "1.3_如何使用字体颜色行距等设置文本视图的样式"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Text and image"]
categories: ["SwfitUI"]
date: 2019-07-24T15:42:28+08:00
lastmod: 2019-07-24T15:42:28+08:00
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
`Text` 不仅在外观方面可以让我们进行可预测的广泛控制，而且它们还可以与 `Dynamic Type` 等 Apple 的核心技术无缝协作。

### 1. 设置字体
默认情况下，文本视图有一个 `Body` 动态类型样式，但是我们可以通过以下方式调用 `.font()`，从其它 _sizes_ 和 _weights_ 进行选择:
```swift
struct ContentView: View {
    var body: some View {
        // 1. 设置字体
        Text("This is an extremely long text string that will never fit even the widest of Phones")
            .font(.largeTitle)
    }
}
```
效果预览:
![1.3_text_font_large_title](img/1.3_text_font_large_title.png "Set a font for text")
我们现在在文本视图下面使用了两个修改器，这没关系 - 你可以将它们堆叠起来，并且它们都会生效。

### 2. 设置文本对齐方式
特别是，现在我们有多行文本，我们需要调整文本的对齐方式，使其居中，如下所示:
```swift
struct ContentView: View {
    var body: some View {
        // 2.设置文本对齐方式
        Text("This is an extremely long string that will never fit even the widest of Phones")
            .font(.largeTitle)
            .multilineTextAlignment(.center)
    }
}
```
效果预览:
![1.3_text_alignment_center](img/1.3_text_alignment_center.png "Set center alignment for text")

### 3. 设置字体颜色
我们可以通过 `.foregroundColor()` 修改器来设置文本颜色，如下所示:
```swift
struct ContentView: View {
    var body: some View {
        // 3. 设置字体颜色
        Text("The best laid plans")
            .foregroundColor(.red)
    }
}
```
效果预览:
![1.3_text_foregroundcolor](img/1.3_text_foregroundcolor.png "Set a foreground color for text")

### 4. 背景
我们可以使用 `.background()` 来设置背景颜色，但是它不仅仅可以用来设置背景颜色，也可以设置背景视图。无论如何，为了给我们的文本视图设置一个黄色背景，代码如下:
```swift
struct ContentView: View {
    var body: some View {
        // 4. 设置背景颜色
        Text("The best laid plans")
            .foregroundColor(.red)
            .background(Color.yellow)
    }
}
```
效果预览:
![1.3_text_backgroundcolor](img/1.3_text_backgroundcolor.png "Set a background color for text")

### 5. 设置行间距
我们可以设置多行文本的行间距，行间距默认值为0，表示没有额外的行间距，但是我们可以通过以下方式在行与行之间指定一个值来添加额外的行间距。
```swift
struct ContentView: View {
    var body: some View {
        // 5.设置行间距
        Text("This is an extremely long string that will never fit even the widest of Phones")
            .lineLimit(nil)
            .font(.largeTitle)
            .lineSpacing(50)
    }
}
```
效果预览:
![1.3_text_line_spacing](img/1.3_text_line_spacing.png "Set a line spacing for text")