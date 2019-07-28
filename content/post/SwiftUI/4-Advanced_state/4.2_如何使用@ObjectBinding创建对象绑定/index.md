---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "4.2_如何使用@ObjectBinding创建对象绑定"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Advanced state"]
categories: ["SwiftUI"]
date: 2019-07-29T00:09:24+08:00
lastmod: 2019-07-29T00:09:24+08:00
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
### 1. 两件重要的事情
当使用对象绑定时，我们需要处理两个细微不同的东西:

* BindableObject 协议，用于一些可以存储数据的类。
* @ObjectBinding 属性包装器，在视图中用于存储可绑定对象实例。

### 2. 示例
举个例子，这是一个遵循 `BindableObject` 协议的 `UserSettings` 类:
```swift
import Combine
import SwiftUI

class UserSettings: BindableObject {
    var didChange = PassthroughSubject<Void, Never>()
    
    var score = 0 {
        didSet {
            didChange.send(())
        }
    }
}
```
这段代码代码量很小，但是却包含了相当多的知识点，接下来我们逐一解释:

* 第一: `didChange`是 `PassthroughSubject` 的一个实例。 
  - 这个类来自 `Combine` 框架，我们需要添加 `import Combine` 以使我们的代码能够编译。
  - _passthrough subject_ 的工作很简单: 每当我们想要告诉世界我们的对象发生了变化，我们就要求  _passthrough subject_ 为我们做这件事情。它被称为 _pass through_ ，因为我们传递给它的值实际上会传递给任何正在观察变化对象的视图。
  - `PassthroughSubject` 在技术上被称为 _publisher_ ，因为它对世界发布了变化的公告。
* 第二: `PassthroughSubject` 是 `Void` 和 `Never` 的泛型。 
  * 第一个参数 `Void` 意味着 "**我不发送任何值**"。在 SwiftUI 的情况下，我们不需要发送值，因为我们想要的是视图刷新 - 它将自动从 `@ObjectBinding` 状态中获取新数据。 
  * 第二个参数 `Never`，意味着 "**我永远不会抛出错误**"。如果你想，你可以定义一个自定义的错误类型，如 `NetworkError`，并将其发送，但是通常会发现在可绑定对象内部本地处理错误。
* 第三: 我们在 `UserSettings` 的 _score_ 属性上附加了一个 `didSet` 属性观察器，这样我们就可以在该值发生变化时运行代码。 在我们的示例代码中，每当得分发生变化时，我们都会调用 `didChange.send(())`，这就是告诉 `didChange` 发布者发布我们的数据已更改的消息，以便任何订阅的视图都可以刷新。

我们可以在这样的视图中使用 `UserSettings`类: 
```swift
struct ContentView: View {
    
    @ObjectBinding var settings = UserSettings()
    
    var body: some View {
        VStack {
            Text("Your score is \(settings.score)")
            Button(action: {
                self.settings.score += 1
            }) {
                Text("Increase Score")
            }
        }
    }
}
```
正如你所看到的，除了使用带有 `@ObjectBinding` 属性包装器的 _settings_ 之外，其他所有内容都或多或少看起来相同 - SwiftUI 负责处理我们的所有实现细节。
但是有一个重要区别: _settings_ 属性未声明为 `private`。 这是因为绑定对象可以被多个视图使用，因此通常会公开共享它。 

> 警告: 当您使用 publisher 宣布您的对象已更改时，这必须在主线程上发生。