---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "5.6_如何使用EditButton在列表上启用编辑"
subtitle: ""
summary: " "
authors: [admin]
tags: ["List"]
categories: ["SwiftUI"]
date: 2019-07-31T00:40:13+08:00
lastmod: 2019-07-31T00:40:13+08:00
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
如果您已配置 SwiftUI 列表视图以支持删除或编辑其项目，则可以允许用户通过在某个地方添加 `EditButton` 来切换列表视图的编辑模式。
例如，这个 ContentView 结构定义了一个用户数组，附加了一个 `OnDelete()` 方法，然后在导航栏中添加了一个编辑按钮:
```swift
struct ContentView : View {
    
    @State var users = ["Paul", "Taylor", "Adele"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users.identified(by: \.self)) { user in
                    Text(user)
                }
                .onDelete(perform: delete)
            }
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func delete(at offsets: IndexSet) {
        if let first = offsets.first {
            users.remove(at: first)
        }
    }
}
```
运行后，您会发现您可以点击编辑按钮来启用或禁用列表中项目的编辑模式。