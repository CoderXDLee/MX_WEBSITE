---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "6.4_表单中选择器的使用"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Forms"]
categories: ["SwiftUI"]
date: 2019-08-02T13:49:59+08:00
lastmod: 2019-08-02T13:49:59+08:00
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
在表单内部，SwiftUI 的 `选择器视图` 具有特殊的行为，可根据我们使用它们的平台自动进行调整。在 iOS 上，这种行为尤其令人印象深刻，因为选择器可以折叠到一个列表行，该行导航到一个新的可能选项列表中——这是处理许多选项的一种非常自然的方式。

例如，这将创建一个带有选择器的表单，并为其项使用数组：
```swift
struct ContentView : View {
    
    var strengths = ["Mild", "Medium", "Mature"]
    @State var selectedStrength = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker(selection: $selectedStrength, label: Text("Text strength")) {
                        ForEach(0..<strengths.count) {
                            Text(self.strengths[$0]).tag($0)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Select your cheese"))
        }
    }
}
```
运行效果:
![6.4_form_pickers](img/6.4_form_pickers.gif "Form pickers")
表单中的选择器
在 iOS 上，这将显示为一个单独的列表行，您可以点击该行进入一个新屏幕，显示所有可能的选项—— Mild、Medium 和 Mature。您当前的选择旁边将有一个复选标记，当您选择一个新选项时，它将返回上一个屏幕，并显示当前的选项。


如果要禁用此行为，可以使用.PickerStyle(.wheel)修饰符强制选取器采用其常规样式，如下所示：
```swift
Picker(selection: $selectedStrength, label: Text("Text strength")) {
    ForEach(0..<strengths.count) {
        Text(self.strengths[$0]).tag($0)
    }
}
.pickerStyle(WheelPickerStyle())
```
运行效果:
![6.4_form_pickers_wheel](img/6.4_form_pickers_wheel.gif "Picker with wheel style")