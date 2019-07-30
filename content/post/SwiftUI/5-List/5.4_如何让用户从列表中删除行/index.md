---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "5.4_如何让用户从列表中删除行"
subtitle: ""
summary: " "
authors: [admin]
tags: ["List"]
categories: ["SwiftUI"]
date: 2019-07-30T23:55:31+08:00
lastmod: 2019-07-30T23:55:31+08:00
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

通过将 `OnDelete(perform:)` 处理程序附加到部分或全部数据，SwiftUI 可以方便地让用户滑动以删除行。此处理程序需要具有一个特定签名，它可以接受多个索引以删除，如:
```swift
func delete(at offsets: IndexSet) {
```
在这里，您可以循环访问集合中的每个索引，或者只读取第一个索引（如果您只想处理它的话）。因为SwiftUI 正在监视您的状态，所以您所做的任何更改都将自动反映在您的UI中。
注意：此功能的 WWDC 演示使用了一个名为 `remove(atOffsets:)` 的不存在的Swift数组方法，它为我们完成了所有这些工作 - 希望这将在未来版本中出现。
例如，此代码创建一个包含三个项目列表的 ContentView 结构，然后附加一个 `OnDelete(perform:)` 修饰符，用于删除列表中的任何项目:
```swift
struct ContentView: View {
    
    @State var users = ["Paul", "Taylor", "Adele"]
    
    var body: some View {
        List {
            ForEach(users, id: \.self) { user in
                Text(user)
            }
            .onDelete(perform: delete)
        }
    }
    
    func delete(at offsets: IndexSet) {
        if let first = offsets.first {
            users.remove(at: first)
        }
    }
}
```
运行效果:
![5_4_list_delete_row](img/5_4_list_delete_row.gif "Delete a row")
如果您运行该代码，您会发现可以滑动以删除列表中的任何行。