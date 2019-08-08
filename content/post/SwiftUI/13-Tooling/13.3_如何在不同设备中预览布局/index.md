---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "13.3_如何在不同设备中预览布局"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Tooling"]
categories: ["SwiftUI"]
date: 2019-08-08T09:42:15+08:00
lastmod: 2019-08-08T09:42:15+08:00
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
### 1. 简介
Xcode 的 SwiftUI 预览允许我们使用 `.previewDevice()` 修改器同时以多种屏幕尺寸显示我们的设计。 这需要提供设备的确切名称，如 Xcode 的目的地菜单中所示，例如， "iPhone XS Max"。

### 2. 在 iPhone SE 上预览
例如，下面代码显示了 iPhone SE上的预览:
```
struct ContentView: View {
    var body: some View {
        Text("Hello World")
            .background(Color.red)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
           ContentView()
              .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
        }
    }
}
#endif
```
效果预览:
![13.3_preview_in_device_iphonese](img/13.3_preview_in_device_iphonese_without_devicename.png ""Preview in iPhone SE without device name"")

### 3. 显示设备名称
使用特定设备进行预览时，我们可能会发现添加 `.previewDisplayName()` 修改器非常有用，它允许我们在预览窗口中的设备下添加名称。
```swift
struct ContentView: View {
    var body: some View {
        Text("Hello World")
            .background(Color.red)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
           ContentView()
              .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
              .previewDisplayName("iPhone SE")
        }
    }
}
#endif
```
效果预览:
![13.3_preview_in_device_iphonese_with_devicename](img/13.3_preview_in_device_iphonese_with_devicename.png "Preview in iPhone SE with device name")

### 4. 创建多个设备的预览
例如，下面代码会为两个不同的设备创建两个预览，添加每个设备的名称以明确发生了什么:
```swift
struct ContentView: View {
    var body: some View {
        Text("Hello World")
            .background(Color.red)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
        }
    }
}
#endif
```
