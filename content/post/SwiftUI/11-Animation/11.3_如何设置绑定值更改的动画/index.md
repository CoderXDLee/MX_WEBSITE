---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "11.3_如何设置绑定值更改的动画"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Animation"]
categories: ["SwiftUI"]
date: 2019-08-06T17:16:47+08:00
lastmod: 2019-08-06T17:16:47+08:00
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
SwiftUI 的双向绑定让我们可以调整程序的状态，我们可以通过调整视图层次结构来响应它。 例如，我们可能会使某些文本显示或消失，或调整视图的不透明度。

我们可以通过向绑定添加 `animation()` 来对绑定进行修改而引起的更改进行动画处理，而不是立即进行状态更改。例如，此视图有一个切换按钮，根据切换的阶段显示或隐藏文本视图:
```swift
struct ContentView: View {
    
    @State private var showingWelcome = false
    
    var body: some View {
        VStack {
            Toggle(isOn: $showingWelcome, label: {
                Text("Toggle label")
            })
            
            if showingWelcome {
                Text("Hellow SwiftUI")
            }
        }
    }
}
```
效果预览:
![11.3_binding_without_animation](img/11.3_binding_without_animation.gif "Binding without animation")

如果没有动画，文本视图将立即显示或消失，从而导致视觉跳跃。 如果我们修改了 toggle
，那么它被绑定到 `$showingWelcome.animation()` ，那么文本视图将平滑滑入:
```swift
struct ContentView: View {
    
    @State private var showingWelcome = false
    
    var body: some View {
        VStack {
            Toggle(isOn: $showingWelcome.animation(), label: {
                Text("Toggle label")
            })
            
            if showingWelcome {
                Text("Hellow SwiftUI")
            }
        }
    }
}
```
效果预览:
![11.3_binding_with_animation](img/11.3_binding_with_animation.gif "Binding with animation")

如果希望对动画有更多的控制，可以将参数传递给影响转换方式的 `animation()`。例如，下面代码将使文本与弹簧动画一起出现:
```swift
```
效果预览:
![11.3_binding_with_spring_animation](img/11.3_binding_with_spring_animation.gif "Binding with a spring animation")