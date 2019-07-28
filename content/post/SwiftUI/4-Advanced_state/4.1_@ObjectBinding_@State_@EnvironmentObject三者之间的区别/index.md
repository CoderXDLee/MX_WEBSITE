---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "4.1_@ObjectBinding、@State 和 @EnvironmentObject三者之间的区别"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Advanced state"]
categories: ["SwiftUI"]
date: 2019-07-28T22:31:35+08:00
lastmod: 2019-07-28T22:31:35+08:00
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
### 1. `@State`
在任何现代应用程序中，**状态（State）**都是不可避免的。

但是对于 SwiftUI 来说，重要的是要记住:

* 我们所有的视图都只是它们的状态的函数
* 我们不会直接改变视图，而是操纵状态并让它决定结果

SwiftUI 为我们提供了几种在应用程序中存储状态的方法，但是它们之间略有不同，理解它们之间的区别对于正确使用框架是很重要的。

到目前为止，在我们所有的状态示例中，我们都使用 `@State` 来创建如下属性:
```swift
struct ContentView : View {
    @State var score = 0
    // more code
}
```
这段代码在视图中创建了一个属性，但它使用 `@State` 属性包装器（property wrapper）来请求 SwiftUI 来管理内存。这一点很重要: 我们所有的视图都是结构体（structs），这意味着它们不能被改变，如果我们不能在一场比赛中给一个分数加1，那么这就不是一场比赛了。

因此，当我们使用 `@State` 创建一个属性时，就意味着将该属性的控制权交给了 SwiftUI，这样的话，只要视图存在，它就在内存中保持不变。当该状态发生变化时，SwiftUI 知道用最新的变化自动重新加载视图，以便反映其新信息。

`@State` 对于属于特定视图且从未在该视图之外使用的简单属性非常有用，因此通常最好将这些属性标记为私有属性，如下所示:
```swift
@State private var score = 0
```
这再次强化了这样一种观点，即这种状态是专门设计的，永远不会脱离它的视图。简单理解，就是在视图内部使用的。

### 2. `@ObjectBinding`
对于更复杂的属性:

* 当你有一个要使用的自定义类型，该类型可能具有多个属性和方法
* 可能在多个视图中共享时

那么，你应该使用 `@ObjectBinding`。
这与 `@State` 非常相似，只是现在我们使用的是外部引用类型，而不是简单地本地属性，如字符串或整数。我们仍然可以说视图取决于要更改的数据，除了我们负责管理自己的数据: 我们需要创建类的实例，创建自己的属性，等等。

与 `@ObjectBinding` 一起使用的任何类型都应该遵循 `BindableObject` 协议，该协议只有一个要求: 您的类型必须实现某种类型的 `didchange` 属性，该属性在数据发生更改时通知视图。

这就是我的意思，当我说这是你负责管理自己的数据时——当你在绑定对象上设置一个属性时，你就可以决定是否应该强制视图刷新。你通常会的，但不是必须的。

一个可绑定的对象可以使用 `Combine` 框架中 _publisher_  通知其视图重要数据已经更改。如果碰巧有几个视图使用可绑定对象的数据，那么它将自动通知所有这些视图。

> **警告:** 当你使用 _publisher_ 宣布你的对象已更改，这个动作必须在主线程上执行。

### 3. `@EnvironmentObject`
我们已经了解了如何通过 `@State` 声明一个类型的简单属性，该类型数据在发生更改时自动导致视图更新，以及如何通过 `@Objectbinding` 声明外部类型的属性，该属性在更改时可能会或可能不会导致视图更新。这两个都必须由我们的视图设置，但是 `@Objectbinding` 可能与其他视图共享。

针对这种情况，我们还有第三种类型的属性可供使用，即 `@EnvironmentObject`。这是一个通过应用程序本身对视图可用的值 - 

> 它是每个视图都可以读取的共享数据，因此，如果你的应用程序有一些重要的模型数据，所有视图都需要读取，你可以把它从一个视图传递到另一个视图，或者把它放到每个视图都可以即时访问的环境中。

当我们需要在应用程序中传递大量数据时，可以将 `@Environmentobject` 视为一种极大的便利。由于所有视图都指向同一模型，因此如果一个视图更改模型，则所有视图都会立即更新 - 不会有使应用程序的不同部分不同的风险。

### 4. 总结差异

* 将 `@State` 用于属于单个视图的简单属性。 它们通常应标记为 `private`。
* 将 `@ObjectBinding` 用于可能属于多个视图的复杂属性。 无论何时使用引用类型，都应该使用`@ObjectBinding`。
* 将 `@EnvironmentObject` 用于在应用程序中其他位置创建的属性，例如共享数据。

在这三种方法中，您会发现 `@objectbinding` 是最有用和最常用的，因此如果您不确定要使用哪种方法，请从那里开始。