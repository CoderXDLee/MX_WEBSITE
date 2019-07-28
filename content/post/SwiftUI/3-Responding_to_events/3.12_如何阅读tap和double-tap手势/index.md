---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "3.12_如何阅读tap和double Tap手势"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Responding to events"]
categories: ["SwiftUI"]
date: 2019-07-28T18:38:38+08:00
lastmod: 2019-07-28T18:38:38+08:00
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
任何 SwiftUI 视图都可以附加 `点击操作(tap action)`，我们可以指定在触发操作之前应该接收多少次点击。

### 2. 示例
例如: 我们创建一个文本视图，在点击时将打印消息:
```swift
struct ContentView : View {
    var body: some View {
        Text("Tap me!")
            .tapAction {
                print("Tapped")
            }
    }
}
```
运行效果:
![tap_gesture_tap_text](img/tap_gesture_tap_text.gif "Tap a text")

再创建一个图像视图，当双击时将打印消息:
```swift
struct ContentView : View {
    var body: some View {
        Image("example-img")
            .tapAction(count: 2) {
                print("Double tapped!")
            }
    }
```
运行效果:
![tap_gesture_double_tap_image](img/tap_gesture_double_tap_image.gif "Double tapped!")