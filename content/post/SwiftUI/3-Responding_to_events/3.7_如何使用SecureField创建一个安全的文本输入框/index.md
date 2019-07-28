---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "3.7_如何使用SecureField创建一个安全的文本输入框"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Responding to events"]
categories: ["SwiftUI"]
date: 2019-07-27T23:33:00+08:00
lastmod: 2019-07-27T23:33:00+08:00
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
SwiftUI 的 `SecureTextField` 的工作方式与常规的 `TextField` 完全相同，只是为了保护隐私而屏蔽了字符。当然，它绑定的底层值（underlying value）仍然是一个普通的字符串，因此你可以根据需要检查它。
下面是一个示例，创建了一个绑定到本地 `@State`  属性的 `SecureField`，以便我们显示键入的内容:
```swift
struct ContentView : View {
    
    @State private var password = ""
    
    var body: some View {
        VStack {
            SecureField($password, placeholder: Text("Enter your password:"))
                .padding()
            Text("Your entered: \(password)")
        }
    }
}
```
运行效果:
![securefield_enter_password](img/securefield_enter_password.gif "enter a password")

提示: 在 beta1 和 beta2 中，你应该使用:
SecureField($password)