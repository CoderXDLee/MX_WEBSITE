---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "2.1_如何使用VStack和HStack创建stacks"
subtitle: ""
summary: " "
authors: [admin]
tags: ["View layout"]
categories: ["SwfitUI"]
date: 2019-07-25T10:10:50+08:00
lastmod: 2019-07-25T10:10:50+08:00
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

SwiftUI 的内容视图(content views)必须返回一个视图，即我们希望它们显示的视图。当我们想要一次性在屏幕上显示多个视图时，我们需要告诉 SwiftUI 如何排列它们，这就是 `堆栈（stacks）`的来源。

`堆栈（Stacks）` 相当于 UIKit 中的 **UIStackView** 。有三种形式: 

* 水平（HStack）
* 垂直（VStack）
* 基于深度（ZStack）

当我们想放置子视图以便它们重叠时可以使用后者。

### 1. VStack
让我们从一些简单的事情开始，先创建一个文本视图:
```swift
struct ContentView: View {
    var body: some View {
        VStack {
            // 1. 创建一个文本视图
            Text("Hello SwiftUI")
                .background(Color.red)
        }
    }
}
```
效果预览:
![2.1_single_text](img/2.1_single_text.png "A single text")

如果我们想在下面再放一个文本视图，我们不能只写:
```swift
var body: some View {
    Text("Hello SwiftUI")
    Text("Hello M X")
}
```
这样的话，编译器会直接报错。

> 记住，我们只能返回一个视图，否则代码就不会工作。

那么怎么办呢？我们需要将其放置在 `VStack` 中，以便将文本视图放置在彼此上方:
```swift
struct ContentView: View {
    var body: some View {
        VStack {
            // 2. 创建两个文本视图
            Text("Hello SwiftUI")
                .background(Color.red)
            Text("hello M X")
                .background(Color.blue)
        }
    }
}
```
效果预览:
![2.1_two_text_in_vstack](img/2.1_two_text_in_vstack.png "Two texts in VStack")

您会注意到: `VStack` 位于屏幕的中心，标签也居中，并且它们之间有一些自动间隔。

### 2. HStack
如果我们希望文本视图并排水平放置，请使用如下方式将 `VStack` 替换为 `HStack`:
```swift
struct ContentView: View {
    var body: some View {
        HStack {
            // 3. 水平放置
            Text("Hello SwiftUI")
                .background(Color.red)
            Text("hello M X")
                .background(Color.blue)
        }
    }
}
```
效果预览:
![2.1_two_text_in_hstack](img/2.1_two_text_in_hstack.png "Two texts in HStack")