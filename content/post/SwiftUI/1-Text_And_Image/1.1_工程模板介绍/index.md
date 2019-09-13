---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "1.1_工程模板介绍"
subtitle: ""
summary: "The introduction of SwiftUI project template"
authors: [admin]
tags: ["Text and image"]
categories: ["SwfitUI"]
date: 2019-07-23T15:51:58+08:00
lastmod: 2019-07-23T15:51:58+08:00
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
> **小贴士**: 也许你认为本章是完全可以略读的，但除非你是一个 Swift 天才，否则你应该读到最后再确定。

### 1. 简介
![1.1_swiftui_basic_template](img/1.1_swiftui_basic_template.png)
如图，自 Xcode 11 之后，基本的 *Single View App* 模板为我们提供以下内容:

* `AppDelegate.swift` 
  - 它负责监视外部事件。例如: 如果另一个应用程序试图向我们发送要一个要打开的文件。
* `SceneDelegate.swift` 
  - 它负责管理应用程序的显示方式。例如: 让多个实例同时运行，或者当一个实例移动到后台时采取操作/措施。
* `ContentView.swift` 
  - 它是我们的初始用户界面。如果这是一个 UIKit 项目，它就相当于是 Xcode 提供给我们的 *ViewController* 类。
* `Assets.xcassets` 
  - 它是项目的资产目录。存储着我们项目中使用的所有图像和颜色。
* `LaunchScreen.storyboard` 
  - 它是应用加载时显示的屏幕。
* `Info.plist` 
  - 它是一个属性列表文件，用于存储应用程序的系统级设置。例如: 应该在 iOS 主屏幕的图标下面显示什么名称。
* `Preview content`  
  - 它是一个名为 *Preview content* 的组，其中包含另一个名为 *Preview Assests* 的资产目录。

就是这样 - 只有少量的代码和资源，这意味着我们可以在此基础上进行构建。

### 2. 查看 SceneDelegate
我们真正关心的是 `ContentView.swift`，  事实上，这是唯一重要的部分。这是我们应用程序的主要功能，在这里我们可以立即开始尝试各种 `SwiftUI` 代码。

是什么让 _ContentView.swift_ 显示在屏幕上？  
上面提到: `SceneDelegate.swift` 负责管理应用程序的显示方式。那么，我们打开 `SceneDelegate.swift`，就会看到下面的代码:

```swift
let window = UIWindow(windowScene: windowScene)
window.rootViewController = UIHostingController(rootView: ContentView())
self.window = window
window.makeKeyAndVisible()
```

这段代码创建了一个新的 `ContentView` 实例（这是我们即将看到的主要功能），并将其放在 `window` 中，以便在屏幕上显示。通过显示 `ContentView` 的第一个实例，可以有效地引导我们的应用程序，并从那里结束 - 你想做什么？

### 3. 查看 ContentView
打开  `ContentView.swift` ，让我们看看实际的 SwiftUI 代码。可以看到这样的代码:

```swift
import SwiftUI

struct ContentView : View {
    var body: some View {
        Text("Hello World")
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
```

* 首先，请注意，`ContentView` 是一个结构体。熟悉 UIKit 的开发人员知道 - 我们从用户界面的所有值类型的不可变性和简单性中获益巨大！

* 其次，`ContentView` 遵守 `View` 协议。我们想在 SwiftUI 中显示的所有内容都需要遵守 `View` 协议，这实际上只意味着一件事: 我们需要一个名为 `body` 的属性来返回某种 `View`。

* 第三，`body` 的返回类型是 `some View`。`some` 关键字是在 Swift 5.1 中新增的，是一个名为 **不透明返回类型（opaque return types）** 功能的一部分，在这种情况下，它的意思是 将返回某种视图，但 SwiftUI 不需要知道（或关心）什么。

> **重要说明:** 返回 `some View` 意味着 `body` 属性将返回遵守 `View` 协议的内容。我们不能返回很多东西或忘记返回任何东西 -- Swift 编译器将拒绝构建代码。要清楚，我们的视图正文必须返回一个子视图。

* 第四，body 属性中有 `Text("hello world")`，它创建了文本内容为 "hello world" 的标签。

* 最后，在 ContentView 下面的是一个类似但不同的 struct，称为 `ContentView_Previews`。它不遵守 `View` 协议，因为它专门用于在 Xcode 中显示 视图预览（Preview），而不是在真实 app 中显示在屏幕上。这就是为什么你会看到它在 `#if DEBUG` 和 `#endif` 之间 - 当我们的应用程序在调试环境中运行时，这段代码只构建在 成品（finished product）中，因为它在生产应用程序（Production app）中没有意义。