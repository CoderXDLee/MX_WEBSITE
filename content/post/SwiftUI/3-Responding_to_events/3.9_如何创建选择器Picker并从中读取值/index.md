---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "3.9_如何创建选择器Picker并从中读取值"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Responding to events"]
categories: ["SwiftUI"]
date: 2019-07-27T23:56:24+08:00
lastmod: 2019-07-27T23:56:24+08:00
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
SwiftUI 的 `Picker` 视图将 UIPicker 和 UITableView 结合在一起。同时也适应其它操作系统上的其它样式。最棒的是我们真的不需要关系它是如何工作的 -- SwiftUI 可以很好的自动适应它的环境。
与大多数其它控件一样，必须将 picker 附加到某种 state，以跟踪 picker 的选择。例如: 这会创建一个 colors 数组和一个存储所选颜色的整数，然后将其与 picker，Text 视图一起使用，以便您可以看到正在读取的值:
```swift
struct ContentView: View {
    
    var colors = ["Red", "Orange", "Yellow", "Green"]
    @State private var selectedColor = 0
    
    var body: some View {
        VStack {
            Picker(selection: $selectedColor, label: Text("Please choose a color")) {
                ForEach(0..<colors.count) {
                    Text(self.colors[$0]).tag($0)
                }
            }
            Text("You selected: \(colors[selectedColor]) ")
        }
    }
}
```
运行效果:
![picker_select_color](img/picker_select_color.gif "Selected color")

注意: 将选择器视图放在某个内容中非常重要，以确保它在iOS上以默认的轮子样式显示。