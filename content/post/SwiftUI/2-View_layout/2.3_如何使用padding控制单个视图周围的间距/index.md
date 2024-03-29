---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "2.3_如何使用padding控制单个视图周围的间距"
subtitle: ""
summary: " "
authors: [admin]
tags: ["View layout"]
categories: ["SwfitUI"]
date: 2019-07-25T11:39:45+08:00
lastmod: 2019-07-25T11:39:45+08:00
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

SwiftUI 允许我们使用 `padding()` 修饰符在视图周围设置单独的填充。
### 1. 系统默认 padding
如果在不传参数的情况下使用 _padding()_ ，我们将在视图的四周获得系统默认填充，如下所示:
```swift
struct ContentView: View {
    var body: some View {
        VStack {
            // 1. 系统默认 padding
            Text("Hello SwiftUI")
                .background(Color.red)
                .padding()
            Text("Hello M X")
                .background(Color.blue)
        }
    }
}
```
效果预览:
![2.3_padding_system_default](img/2.3_padding_system_default.png "Set padding with system default")

> 注意: 这里默认设置了视图四周的填充。

### 2. 只设置一侧系统默认 padding
我们也可以自定义要应用的 填充 和 位置。因此，我们只希望将系统填充应用于一侧:
```swift
struct ContentView: View {
    var body: some View {
        VStack {  
            // 2. 只设置一侧填充
            Text("Hello SwiftUI")
                .background(Color.red)
                .padding(.bottom)
            Text("Hello M X")
                .background(Color.blue)
        }
    }
}
```
效果预览:
![2.3_padding_system_bottom](img/2.3_padding_system_bottom.png "Set bottom padding with system default")

> 注意: 这里只设置了底部填充，与上面的例子不同。

### 3. 用具体数值来设置 padding
我们可能希望控制对所有边应用了多少填充:
```swift
struct ContentView: View {
    var body: some View {
        VStack {  
            // 2. 只设置一侧填充
            Text("Hello SwiftUI")
                .background(Color.red)
                .padding(100)
            Text("Hello M X")
                .background(Color.blue)
        }
    }
}
```
效果预览:
![2.3_padding_100](img/2.3_padding_100.png "Set padding as 100")

### 4. 在视图一侧添加特定数量的填充
我们也可以将这两者结合起来，在视图的一侧添加特定数量的填充：
```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello SwiftUI")
                .background(Color.red)
                .padding(.bottom, 100)
            Text("Hello M X")
                .background(Color.blue)
        }
    }
}
```
效果预览:
![2.3_padding_bottom_100](img/2.3_padding_bottom_100.png "Set bottom padding as 100")
