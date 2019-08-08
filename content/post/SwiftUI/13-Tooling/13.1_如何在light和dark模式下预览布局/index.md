---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "13.1_如何在light和dark模式下预览布局"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Tooling"]
categories: ["SwiftUI"]
date: 2019-08-07T18:25:14+08:00
lastmod: 2019-08-07T18:25:14+08:00
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
Apple的大多数操作系统都支持亮模式和暗模式用户界面，因此 SwiftUI 内置支持此功能也就不足为奇了。

更好的是，一旦我们设计了界面，Xcode 允许我们通过在预览中设置 `\.colorScheme` 环境值来以任一颜色方案预览布局。

例如，下面显示使用暗模式的预览:
```swift
#if DEBUG
struct ContentView_Previews : PreviewProvider {
   static var previews: some View {
      Group {
         ContentView()
            .environment(\.colorScheme, .dark)
      }
   }
}
#endif
```
如果我们要并排查看明暗模式，请在组中放置多个预览，如下所示:
```swift
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.colorScheme, .light)
            
            ContentView()
                .environment(\.colorScheme, .dark)
        }
    }
}
#endif
```
效果预览:
![13.2_preview_your_layout_in_light_and_dark_mode](img/13.2_preview_your_layout_in_light_and_dark_mode.gif "Preview your layout in light and dark mode")

> 提示: 如果我们的预览已缩放，则应滚动或缩小到其他预览。