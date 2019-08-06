---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "11.5_如何添加和删除带有转换的视图"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Animation"]
categories: ["SwiftUI"]
date: 2019-08-06T18:11:29+08:00
lastmod: 2019-08-06T18:11:29+08:00
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
我们可以使用常规的 Swift 条件在设计中包含或排除某个视图。 

### 1. 默认动画 - fade
例如，当点击按钮时，这会添加或删除一些详细信息文本:
```swift
struct ContentView: View {
    @State private var showDetails = false

    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    self.showDetails.toggle()
                }
            }, label: {
                Text("Tap to show details")
            })

            if showDetails {
                Text("Details go here.")
            }
        }
    }
}
```
效果预览:
![11.5_show_details_by_click_button](img/11.5_show_details_by_click_button.gif "Show details")

### 2. 使用 transition 控制视图从底部滑入
默认情况下，SwiftUI 使用 `fade淡入淡出动画` 来插入或删除视图，但如果需要，可以通过将`transition()` 修改器附加到视图来更改它。
例如，我们可以将详细信息文本视图从底部滑入或滑出，如下所示:
```swift
struct ContentView: View {
    @State private var showDetails = false

    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    self.showDetails.toggle()
                }
            }, label: {
                Text("Tap to show details")
            })

            if showDetails {
                Text("Details go here.")
                    .transition(.move(edge: .bottom))
            }
        }
    }
}
```
效果预览:
![11.5_show_details_from_bottom](img/11.5_show_details_from_bottom.gif "Show details from bottom")

### 3. 使用 transaction(.slide)
还有 `.slide` 过渡，它导致视图从其前导中动画化并在其后缘上动画化:
```swift
struct ContentView: View {
    @State private var showDetails = false

    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    self.showDetails.toggle()
                }
            }, label: {
                Text("Tap to show details")
            })

            if showDetails {
                Text("Details go here.")
                    .transition(.slide)
            }
        }
    }
}
```
效果预览:
![11.5_show_details_transaction_slide](img/11.5_show_details_transaction_slide.gif "Show details with transaction.slide")

### 4. 设置 transition(.scale)
以及 `.scale` 转换，它使视图在进入时从零缩放到全尺寸，然后在退出时返回到零：
```swift
struct ContentView: View {
    @State private var showDetails = false

    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    self.showDetails.toggle()
                }
            }, label: {
                Text("Tap to show details")
            })

            if showDetails {
                Text("Details go here.")
                    .transition(.scale)
            }
        }
    }
}
```
效果预览:
![11.5_show_details_transaction_scale](img/11.5_show_details_transaction_scale.gif)