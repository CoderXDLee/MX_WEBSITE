---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "5.7_如何向列表中添加sections"
subtitle: ""
summary: " "
authors: [admin]
tags: ["List"]
categories: ["SwiftUI"]
date: 2019-08-01T23:21:13+08:00
lastmod: 2019-08-01T23:21:13+08:00
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

SwiftUI 的列表视图内置了对 _sections_ 和 _section headers_ 的支持，就像 UIKit 中的 `UITableView` 一样。若要给某些 cells 添加一个 _section_，首先在其周围放置一个 `Section`，也可以添加 _header_ 和 _footer_。
举个例子，这里有一行包含提醒应用的任务数据：
```swift
struct TaskRow: View {
    var body: some View {
        Text("Task data goes here")
    }
}
```
我们要做的是创建一个列表视图，它有两个Sections：一个用于重要任务，另一个用于次要任务。这是它的样子：
```swift
struct ContentView : View {
    var body: some View {
        List {
            Section(header: Text("Important task")) {
                TaskRow()
                TaskRow()
                TaskRow()
            }
            Section(header: Text("Other task")) {
                TaskRow()
                TaskRow()
            }
        }
    }
}
```
运行效果:
![5_7_list_sections](img/5_7_list_sections.gif "List sections")