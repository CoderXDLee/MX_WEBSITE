---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "1.5_如何使用图像视图绘制图像"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Text and image"]
categories: ["SwfitUI"]
date: 2019-07-24T15:44:15+08:00
lastmod: 2019-07-24T15:44:15+08:00
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

使用图像视图 `Image` 可以在 SwiftUI 布局中渲染图像（images）。我们可以从 `Bundle`、`System icons`、`UIImage` 等中加载图像，但这三个将是最常见的。

### 1. 从 Bundle 加载
要从 Bundle 中加载图像并将其显示在图像视图中，只需使用以下代码:
```swift
var body: some View {
    Image("example-image")
}
```
运行效果:
![1.5_load_image_from_bundle.png](img/1.5_load_image_from_bundle.png "load image from buldle")

### 2. 从 System icons 加载
要从苹果旧金山符号集(Apple’s San Francisco Symbol set)中加载图标，请使用 `Image(systemName: )` 初始化器，传入图标字符串进行加载，如下所示:
```swift
Image(systemName: "cloud.heavyrain.fill")
```
运行效果:
![1.5_load_image_from_systemicon](img/1.5_load_image_from_systemicon.png "load image from system icons")

### 3. 从 UIImage 加载
最后，可以从现有的 UIImage 创建一个图像视图。因为这需要更多的代码，所以需要显式地使用 return 关键字。
```swift
guard let image = UIImage(named: "example-image") else {
    fatalError("Unable to load image")
}

return Image(uiImage: image)
```
运行效果:
![1.5_load_image_from_uiimage](img/1.5_load_image_from_uiimage.png "load image from uiimage")

### 4. 通过 foregroundColor 给系统图标着色
如果你使用的是 系统图标集，则返回的图像是 `可缩放` 和 `可着色` 的，这意味着你可以使用 `foregroundColor()` 修改器对图像着色。
```swift
Image(systemName: "cloud.heavyrain.fill")
    .foregroundColor(.red)
```
运行效果:
![1.5_foreground_color_image](img/1.5_foreground_color_image.png "set foreground color for system icon")
### 5. 通过给系统图标设置动态文本样式来放大图像
这意味着你可以通过匹配任何 `Dynamic Type` 文本样式，来要求 SwiftUI 放大图像:
```swift
Image(systemName: "cloud.heavyrain.fill")
    .font(.largeTitle)
```
运行效果:
![1.5_font_largetitle_image](img/1.5_font_largetitle_image.png "set font as largeTitle for system icons")