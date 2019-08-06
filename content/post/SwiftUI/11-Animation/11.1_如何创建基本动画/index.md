---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "11.1_如何创建基本动画"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Transforming views"]
categories: ["SwiftUI"]
date: 2019-08-06T16:16:55+08:00
lastmod: 2019-08-06T16:16:55+08:00
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
SwiftUI 通过其 `animation()` 修改器内置了对动画的支持。 要使用此修改器，请将其放在视图的任何其它修改器之后，并告诉它我们想要什么样的动画。

### 2. 缩放动画
例如，下面代码创建一个按钮，每次按下它时，其缩放效果会增加1:
```swift
struct ContentView: View {
    
    @State private var scale: CGFloat = 1
    
    var body: some View {
        Button(action: {
            self.scale += 1
        }, label: {
            Text("Tap here!")
            .scaleEffect(scale)
                .animation(.default)
        })
    }
}
```
效果预览:
![11.1_animation_default_scale_button](img/11.1_animation_default_scale_button.gif "Scale a button using the default animation")

### 2. 设置动画持续时间
如果需要，我们可以为动画指定精确的持续时间。 例如，下面代码会在三秒钟内激活缩放效果:
```swift
struct ContentView: View {
    
    @State private var scale: CGFloat = 1
    
    var body: some View {
        Button(action: {
            self.scale += 1
        }, label: {
            Text("Tap here!")
            .scaleEffect(scale)
                .animation(.linear(duration: 3))
        })
    }
}
```
效果预览:
![11.1_animation_linear_scale_button_3s](img/11.1_animation_linear_scale_button_3s.gif "Set a linear animation with 3s duration")

### 3. 曲线动画
我们也可以指定曲线动画，在 `.easeIn`, `.easeOut`, `.easeInOut`, and `.custom` 之间进行选择，后者允许我们指定自己的控制点。

例如，下面代码会激活缩放效果，使其开始慢并逐渐变快:
```swift
struct ContentView: View {
    
    @State private var scale: CGFloat = 1
    
    var body: some View {
        Button(action: {
            self.scale += 1
        }, label: {
            Text("Tap here!")
            .scaleEffect(scale)
                .animation(.easeIn)
        })
    }
}
```
效果预览:
![11.1_animation_easein_scale_button](img/11.1_animation_easein_scale_button.gif "Set a easeIn animation")

### 4. 设置多个动画变量
我们可以为许多其他修改器设置动画，例如2D和3D旋转，不透明度，边框等。 例如，下面代码会使按钮旋转并在每次点击时增加其边框:
```swift
struct ContentView: View {
    @State private var angle: Double = 0
    @State private var borderThickness: CGFloat = 1

    var body: some View {
        Button(action: {
            self.angle += 45
            self.borderThickness += 1
        }, label: {
            Text("Tap here")
                .padding()
                .border(Color.red, width: borderThickness)
                .rotationEffect(.degrees(angle))
                .animation(.default)
        })
    }
}
```
效果预览:
![11.1_animation_default_multi_var](img/11.1_animation_default_multi_var.gif)