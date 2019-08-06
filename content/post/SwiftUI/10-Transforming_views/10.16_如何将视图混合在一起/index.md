---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "10.16_如何将视图混合在一起"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Transforming views"]
categories: ["SwiftUI"]
date: 2019-08-06T15:49:19+08:00
lastmod: 2019-08-06T15:49:19+08:00
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
将一个视图放在另一个视图上时，可以使用 `blendMode()` 修改器控制它们重叠的方式。 这包含多种可以将颜色混合在一起的方法，例如使用它们的差异或使用颜色刻录 - 如果您之前使用过 Core Graphics 或类似 Photoshop，这些方法会很熟悉。

为了证明这一点，我们可以创建一个内部有两个图像的 `ZStack` ，其中第二个具有 `.multiply` 混合模式，以便使其后面的颜色变暗:
```swift
struct ContentView: View {
    var body: some View {
        ZStack {
            Image("stripes")
            Image("example-image")
                .blendMode(.multiply)
        }
    }
}
```
效果预览:
![10.16_blend](img/10.16_blend.png "Blend two image view with multiply mode")