---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "10.15_如何模糊视图"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Transforming views"]
categories: ["SwiftUI"]
date: 2019-08-06T15:37:49+08:00
lastmod: 2019-08-06T15:37:49+08:00
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
### 1. 初识
`blur()` 修改器允许我们根据自己的选择对视图应用实时高斯模糊。

### 2. 给图像设置模糊
例如: 下面代码会创建一个 `300x300` 的个人资料图片，然后添加一个20点的高斯模糊:
```swift
struct ContentView: View {
    var body: some View {
        Image("avatar")
            .resizable()
            .frame(width: 300, height: 300)
            .blur(radius: 20)
    }
}
```
效果预览:
![10.15_blur_20_radius](img/10.15_blur_20_radius.png "Set a blur for a image view")

### 3. 给文本设置模糊
我们可以模糊我们想要的任何内容，包括文本视图:
```swift
struct ContentView: View {
    var body: some View {
        Text("Welcome to my SwiftUI app")
            .blur(radius: 2)
    }
}
```
效果预览:
![10.15_set_blur_for_text](img/10.15_set_blur_for_text.png "Set a blur for a text view")