---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "8.3_如何向alert_buttons添加actions"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Alerts and action sheets"]
categories: ["SwiftUI"]
date: 2019-08-05T15:54:28+08:00
lastmod: 2019-08-05T15:54:28+08:00
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
基本的 SwiftUI alert 如下所示:
```swift
Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
```

但是，我们经常需要将操作附加到按钮上，以便在点击按钮时执行特定操作。要做到这一点，请在按钮上附加一个闭包，当按钮被点击时闭包将被调用，如下所示:
```swift
struct ContentView: View {
    
    @State private var showAlert = false
    
    var body: some View {
        Button(action: {
            self.showAlert = true
        }, label: {
            Text("Show alert")
        })
        .alert(isPresented: $showAlert,
               content: {
                Alert(title: Text("Are you sure you want to delete this?"),
                      message: Text("There is no undo."),
                      primaryButton: .destructive(Text("Delete"), action: {
                        print("Deleting...")
                      }),
                      secondaryButton: .cancel())
        })
    }
}
```
效果预览:
![8.3_add_actions_to_alert_buttons](img/8.3_add_actions_to_alert_buttons.gif "Add actions to alert buttons")

> 提示: 在预览视图中，点击 `Delete` 按钮，控制台没有日志输出。