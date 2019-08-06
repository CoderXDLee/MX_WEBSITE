---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "10.14_如何用另一个视图遮罩一个视图"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Transforming views"]
categories: ["SwiftUI"]
date: 2019-08-06T15:16:56+08:00
lastmod: 2019-08-06T15:16:56+08:00
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
SwiftUI 为我们提供了 `mask()` 修改器，用于将一个图像作为另一个视图的蒙版，这意味着我们可以使用文本来作为图像的蒙版，或使用图像作为图像的蒙版，或更多。

例如，下面代码会创建一个 `300x300` 的条纹图像，然后使用文本 "SWIFT!" 对其进行遮罩，以便字母充当图像的剪切区域:
```swift
struct ContentView: View {
    var body: some View {
        Image("stripes")
            .resizable()
            .frame(width: 300, height: 300)
            .mask(
                Text("SWIFT!")
                    .font(Font.system(size: 72, weight: .black, design: .serif))
            )
    }
}
```
效果预览:
![10.14_mask_image_with_text](img/10.14_mask_image_with_text.png "Mask a image view with a text view") 
