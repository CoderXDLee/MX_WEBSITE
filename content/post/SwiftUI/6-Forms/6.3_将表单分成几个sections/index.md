---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "6.3_将表单分成几个sections"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Forms"]
categories: ["SwiftUI"]
date: 2019-08-02T12:01:16+08:00
lastmod: 2019-08-02T12:01:16+08:00
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
SwiftUI 的表单通常在分成多个部分时效果最好，就像常规的内容列表一样。 如何将它们分组取决于你，但是通常情况下，按照它们的目的进行分组效果最好 - 如果它是一个订单页面你可以将项目放在一个组中，在另一个组中进行定制，并在第三个组中进行交付。
很有帮助的是，表单 sections 与列表 sections 相同，这意味着您可以在两个地方重复使用相同的代码。因此，您可以向 sections 中添加 _header_ 和/或 _footer_ ，或者两者都不使用，只需在 sections 之间获得一些屏幕上的间距。

例如，这将创建一个包含两个 section 的表单，第一个 section 带有 _segmented control_ 和 _toggle_ ，第二个 section 带有保存按钮:
```swift
struct ContentView : View {
    
    @State var enableLogging = false
    @State var selectedColor = 0
    @State var colors = ["Red", "Green", "Blue"]
    
    var body: some View {
        Form {
            Section(footer: Text("Note: Enabling logging may slow down the app")) {
                SegmentedControl(selection: $selectedColor) {
                    ForEach(0..<colors.count) {
                        Text(self.colors[$0]).tag($0)
                    }
                }
                Toggle(isOn: $enableLogging) {
                    Text("Enable logging")
                }
            }
            Section {
                Button(action: {
                    
                }) {
                    Text("Save changes")
                }
            }
        }
        .navigationBarTitle(Text("Settings"))
    }
}
```
运行效果:
![6.3_form_sections](img/6.3_form_sections.gif "Form sections")