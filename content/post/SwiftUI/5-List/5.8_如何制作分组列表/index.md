---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "5.8_如何制作分组列表"
subtitle: ""
summary: " "
authors: [admin]
tags: ["List"]
categories: ["SwiftUI"]
date: 2019-08-01T23:22:15+08:00
lastmod: 2019-08-01T23:22:15+08:00
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
SwiftUI 的 List 支持 _grouped_ 或 _plain_ 样式，就像 `UITableView` 一样。默认为 _plain_ 样式，但如果要改为 _grouped_ 样式，则应使用 列表 的 `.listStyle(.grouped)` 修饰符。
例如，这里定义了一个示例行，并将其放置在分组列表中：
```swift
struct ExampleRow : View {
    var body: some View {
        Text("Example Row")
    }
}

struct ContentView : View {
    var body: some View {
        List {
            Section(header: Text("Examples")) {
                ExampleRow()
                ExampleRow()
                ExampleRow()
            }
        }.listStyle(.grouped)
    }
}
```
运行效果:
![5_8_list_grouped_style](img/5_8_list_grouped_style.gif "List - grouped style")