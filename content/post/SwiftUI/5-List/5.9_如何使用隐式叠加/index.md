---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "5.9_如何使用隐式叠加"
subtitle: ""
summary: " "
authors: [admin]
tags: ["List"]
categories: ["SwiftUI"]
date: 2019-08-01T23:23:26+08:00
lastmod: 2019-08-01T23:23:26+08:00
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

如果创建一个动态列表并在每行中放置多个内容，会发生什么情况？SwiftUI 的解决方案简单、灵活，并且在默认情况下为我们提供了良好的行为: 它创建了一个隐式的 `HStack` 来保存您的项目，因此它们会自动进行水平布局。
例如，如果我们想要创建一行，其中左侧有一张小图片，剩余的空间分配给一个文本字段，那么我们将从一个结构开始，这样保存数据:
```swift
struct User: Identifiable {
    var id = UUID()
    var username = "Anonymous"
}
```
我已经给出了这两个默认值，以便简化示例。
完成后，我们可以创建一个包含三个用户的数组，并在动态列表中显示它们，如下所示：
```swift
struct ContentView : View {
    let users = [User(), User(), User()]

    var body: some View {
        List(users) { user in
            Image("paul-hudson")
                .resizable()
                .frame(width: 40, height: 40)
            Text(user.username)
        }
    }
}
```
运行效果:
![5_9_list_implicit_stacking](img/5_9_list_implicit_stacking.gif "Implicit stacking")