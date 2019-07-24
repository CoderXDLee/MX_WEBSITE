---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "1.6_如何调整图像视图的填充模式"
subtitle: ""
summary: " "
authors: [admin]
tags: [SwiftUI]
categories: [SwiftUI]
date: 2019-07-24T15:45:07+08:00
lastmod: 2019-07-24T15:45:07+08:00
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

![ba_xian_tai](img/ba_xian_tai.png)
SwiftUI 的 `Image` 能够以不同的方式进行缩放，就像 `UIImageView` 的 _content mode_ 一样。

### 1.默认
默认情况下，图像视图会自动调整其内容的大小，这可能会使它们超出屏幕。
```swift
Image("ba_xian_tai")
```
运行效果:
![the_default_content_mode](img/the_default_content_mode.png "default content mode")

如果添加了 `resizable()` 修饰符，则图像将自动调整大小，以填充所有可用空间: 
```swift
Image("ba_xian_tai")
    .resizable()
```
运行效果:
![resizable_image](img/resizable_image.png "resizable image")
然而，这也可能导致图像的原始纵横比失真，因为它将在所有维度上被拉伸任意数量，以使其填充空间。

### 2. .fill 和 .fit
如果要保持其纵横比，应使用 `.fill` 或 `.fit`添加一个`aspectRatio()`修饰符，如下所示：
```swift
Image("ba_xian_tai")
    .resizable()
    .aspectRatio(contentMode: .fill)
```
运行效果:
![fill_content_mode](img/fill_content_mode.png "content mode = .fill")

注意: 在当前的测试版中，有一个bug，.fit内容模式仍然会导致图像被拉伸。