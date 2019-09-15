---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "1.6_如何调整图像视图的填充模式"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Text and image"]
categories: ["SwfitUI"]
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

![1.6_ba_xian_tai](img/1.6_ba_xian_tai.png)
SwiftUI 的 `Image` 视图能够以不同的方式进行缩放，就像 `UIImageView` 的 **content mode** 一样。

### 1.默认
默认情况下，图像视图会根据其内容自动调整大小，这可能会使它们超出屏幕范围。
```swift
Image("ba_xian_tai")
```
效果预览:
![1.6_the_default_content_mode](img/1.6_the_default_content_mode.png "default content mode")

如果添加 `resizable()` 修饰符，则图像将自动调整大小，以填充所有可用空间: 
```swift
Image("ba_xian_tai")
    .resizable()
```
效果预览:
![1.6_resizable_image](img/1.6_resizable_image.png "resizable image")
然而，这也可能导致图像的原始纵横比失真，因为它将在所有维度上被拉伸任意量，以使其填充空间。

### 2. `.fill` 和 `.fit`
如果要保持其纵横比，应使用 `.fill` 或 `.fit`添加一个`aspectRatio()`修饰符，如下所示:
#### 2.1 fill
```swift
Image("ba_xian_tai")
    .resizable()
    .aspectRatio(contentMode: .fill)
```

效果预览:
![1.6_fill_content_mode](img/1.6_fill_content_mode.png "content mode = .fill")

#### 2.2 fit
```swift
Image("ba_xian_tai")
    .resizable()
    .aspectRatio(contentMode: .fit)
```

效果预览:
![1.6_fit_content_mode](img/1.6_fit_content_mode.png "content mode = .fit")