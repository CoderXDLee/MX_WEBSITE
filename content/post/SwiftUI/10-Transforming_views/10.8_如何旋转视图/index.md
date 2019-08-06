---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "10.8_如何旋转视图"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Transforming views"]
categories: ["SwiftUI"]
date: 2019-08-06T11:16:22+08:00
lastmod: 2019-08-06T11:16:22+08:00
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
SwiftUI的 `rotationEffect()` 修改器让我们可以使用度数或弧度自由旋转视图。

### 2. 使用角度旋转视图
例如，如果我们想将某些文本旋转-90度以使其向上读取，我们可以使用：
```swift
struct ContentView: View {
    var body: some View {
        Text("Up we go")
            .rotationEffect(.degrees(-90))
    }
}
```
效果预览:
![10.8_rotate_90_degree](img/10.8_rotate_90_degree.png "Rotate a text by -90 degrees so that it reads upwards")

### 3. 使用弧度旋转视图
如果我们更喜欢使用弧度，只需传入 `.radians()` 作为参数，如下所示：
```swift
struct ContentView: View {
    var body: some View {
        Text("Up we go")
            .rotationEffect(.radians(.pi))
    }
}
```
效果预览:
![10.8_rotate_pi](img/10.8_rotate_pi.png "Using radians")

### 4. 使用滑块交互
视图旋转速度如此之快，以至于实际上是自由的，所以如果需要，甚至可以使用滑块进行交互:
```swift
struct ContentView: View {
    
    @State private var rotation: Double = 0
    
    var body: some View {
        VStack {
            Slider(value: $rotation, in: 0...360, step: 1) { _ in
                print(self.rotation)
            }
            Text("Up we go")
                .rotationEffect(.degrees(rotation))
        }
    }
}
```
效果预览:
![10.8_rotate_by_slider](img/10.8_rotate_by_slider.gif "Rotate a view by a slider")

### 5. 设置旋转锚点
默认情况下，视图围绕其中心旋转，但如果要从特定点固定旋转，则可以为其添加额外参数。 例如，如果你想让旋转器围绕视图的左上角旋转旋转，你可以这样写：

默认情况下，视图围绕其中心旋转，但如果要从特定点固定旋转，可以为此添加一个额外参数。例如，如果要使上方的滑块围绕视图左上角旋转，可以编写以下命令:
```swift
struct ContentView: View {
    
    @State private var rotation: Double = 0
    
    var body: some View {
        VStack {
            Slider(value: $rotation, in: 0...360, step: 1) { _ in
                print(self.rotation)
            }
            Text("Up we go")
                .rotationEffect(.degrees(rotation), anchor: UnitPoint(x: 0, y: 0))
        }
    }
}
```
效果预览:
![10.8_rotate_by_slider_with_anchor](img/10.8_rotate_by_slider_with_anchor.gif "Rotate a text by slider with an anchor")