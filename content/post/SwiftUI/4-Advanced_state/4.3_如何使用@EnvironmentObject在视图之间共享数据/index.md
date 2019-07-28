---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "4.3_如何使用@EnvironmentObject在视图之间共享数据"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Advanced state"]
categories: ["SwiftUI"]
date: 2019-07-29T01:17:25+08:00
lastmod: 2019-07-29T01:17:25+08:00
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
对于应该与整个应用程序中所有视图共享的数据，SwiftUI 为我们提供了 `@EnvironmentObject` 。这使我们可以在任何需要的地方共享模型数据，同时确保当模型数据发生变化时，我们的视图自动保持更新。

可以将 `@EnvironmentObject` 看作是在多个视图中使用 `@ObjectBinding` 的一种更智能、更简单的方法。而不是在视图 A 中创建一些数据，然后将其传递给视图 B，然后查看视图 C，然后在最终使用数据之前查看视图 D，我们可以在视图中创建它并将其放入环境（environment）中，这样的话，视图B、C、D将会自动访问它。

> **注意:** 环境对象必须由祖先视图（ancestor view）提供 -- 如果 SwiftUI 找不到正确类型的环境对象，将会导致崩溃（crash），这也适用于预览，所以要小心。

### 2. 示例
例如: 这里有一个可绑定对象，用于存储用户设置:
```swift
import Combine
import SwiftUI
​
class UserSettings: BindableObject {
    
    var didChange = PassthroughSubject<Void, Never>()
    
    var score = 0 {
        didSet {
            didChange.send(())
        }
    }
}
```
是的，它只存储一个值，但是没关系 -- 重要的是: 当值发生改变时，`PassthroughSubject` 会告诉所有使用它（这个值）的的视图进行刷新。

**用户设置** 是我们可能希望能够在应用程序的任何地方共享的一个合理的数据，这样我们就不再需要手动处理同步。

因此，当我们的应用程序首次启动时，我们将创建一个 `UserSettings` 的实例。以便在我们的应用程序中随处都可以访问共享实例。

如果打开 _Scenedelegate.swift_ ，您将在 `（_:willConnectTo:options:）`方法：中找到这两行代码
```swift
let window = UIWindow(windowScene: windowScene)
window.rootViewController = UIHostingController(rootView: ContentView())
```
第二行代码创建我们的初始内容视图（ContentView）并将其显示到屏幕上。这就是我们需要传入我们创建的任何环境对象的地方，以便 SwiftUI 可以在 ContentView 以及它使用的任何其它视图中使用我们创建的环境对象。

首先，将其添加为 `SceneDelegate` 的一个属性:
```swift
var settings = UserSettings() 
```
这会创建一个 _settings_ 实例，并安全地存储它。现在回到刚才展示的那两行代码，并更改第二行，以便将我们的 _settings_ 属性作为环境对象传递给 `ContentView`，如下所示:
```swift
window.rootViewController = UIHostingController(rootView: ContentView().environmentObject(settings))
```
完成后，共享的 `UserSettings` 实例可用于 ContentView 以及它承载（hosts）或展现（presents）的任何其它视图。你只需要使用 `@EnvironmentObject` 属性包装器创建一个属性，如下所示:
```swift
@EnvironmentObject var settings: UserSettings
```
这不需要使用默认值进行初始化，因为它将自动从环境中读取。

因此，我们可以创建一个 `ContentView` 结构来增加我们的分数设置，甚至使它呈现出一个显示分数设置的 `Detailview`，所有这些都不需要创建或传递任何 `UserSettings` 的本地实例 -- 它总是使用环境。

以下是实现这一目标的代码:
```swift
struct ContentView : View {
    
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    self.settings.score += 1
                }) {
                    Text("Increase score")
                }
                
                NavigationButton(destination: DetailView()) {
                    Text("Show Detail View")
                }
            }
        }
    }
}
​
struct DetailView : View {
    
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        // A text view that reads from the environment settings
        Text("Score: \(settings.score)")
    }
}
```
因此，一旦你将一个对象注入到环境中，你就可以立即在顶层视图中或者在下面的十层视图中使用它——这并不重要。最重要的是，每当任何视图改变环境时，依赖它的所有视图都会自动刷新，从而保持同步。

如你所见，我们不需要将场景代理（scene delegate）中的 `UserSettings` 实例与我们两个视图中的 `settings` 属性显式关联 - SwiftUI 会自动发现它在环境中有一个 `UserSettings` 实例，因此这就是要使用的实例。

> 警告：既然我们的视图依赖于存在的环境对象，那么您还必须更新预览代码以提供一些要使用的示例设置。例如，使用 `ContentView().EnvironmentObject(UserSettings())` 进行预览应该可以做到这一点。

