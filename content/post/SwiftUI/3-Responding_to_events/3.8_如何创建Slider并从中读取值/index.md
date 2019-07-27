---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "3.8_如何创建Slider并从中读取值"
subtitle: ""
summary: " "
authors: [admin]
tags: ["SwiftUI"]
categories: ["SwiftUI"]
date: 2019-07-27T23:40:23+08:00
lastmod: 2019-07-27T23:40:23+08:00
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
SwiftUI 的 `Slider` 视图的工作原理与 `UISlider` 非常相似，尽管您需要将其绑定到某个地方，以便存储其值。
当我们创建它时，可以提供多种参数，但我们可能最关心的是:

* `Value`:  要绑定到的值是多少
* `From and To`: 滑块的范围
* `By`: 移动滑块时要更改多少值

### 2. 示例
例如: 我们创建一个绑定到  Celsius 属性的滑块，然后在滑块移动时更新文本视图，以便在 **Celsius(摄氏温度)** 和 **Fahrenheit(华氏温度)** 之间进行转换:
```swift
struct ContentView : View {
    
    @State var celsius: Double = 0
    
    var body: some View {
        VStack {
            Slider(value: $celsius, from: -100, through: 100, by: 0.1)
                .padding()
            Text("\(celsius) Celsius is \(celsius * 9 / 5 + 32) Fahrenheit")
        }
    }
}
```
运行效果:
![slider_celsius_to_fahrenheit](img/slider_celsius_to_fahrenheit.gif "celsius to fahrenheit")