---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "6.6_显示或隐藏表单行"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Forms"]
categories: ["SwiftUI"]
date: 2019-08-02T15:27:01+08:00
lastmod: 2019-08-02T15:27:01+08:00
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
SwiftUI 允许我们可以根据需要在表单中添加和删除项目，当我们希望调整基于先前选项可见的选项列表时，特别有用。

例如，这会显示单个 _toggle_ ，提示用户是否要显示更多高级选项。启用该 _toggle_ 后，会出现第二个 _toggle_ ，允许他们启用日志记录:
```swift
struct ContentView : View {
    
    @State var showingAdvancedOptions = false
    @State var enableLogging = false
    
    var body: some View {
        Form {
            Section {
                Toggle(isOn: $showingAdvancedOptions) {
                    Text("Show advanced options")
                }
                
                if showingAdvancedOptions {
                    Toggle(isOn: $enableLogging) {
                        Text("Enable logging")
                    }
                }
            }
        }
    }
}
```
运行效果:
![6.6_form_show_hide](img/6.6_form_show_hide.gif "Form show or hide")
与其他绑定一样，可以要求 SwiftUI 对绑定更改导致的视图更改使用隐式动画，如下所示:
```swift
struct ContentView: View {
    
    @State var showingAdvancedOptions = false
    @State var enableLogging = false
    
    var body: some View {
        Form {
            Section {
                Toggle(isOn: $showingAdvancedOptions.animation()) {
                    Text("Showing Advanced Options")
                }
            }
            
            if showingAdvancedOptions {
                Toggle(isOn: $enableLogging) {
                    Text("Enable Logging")
                }
            }
        }
    }
}
```
运行效果:
![6.6_form_show_hide_animation](img/6.6_form_show_hide_animation.gif "Form show or hide with animation")
