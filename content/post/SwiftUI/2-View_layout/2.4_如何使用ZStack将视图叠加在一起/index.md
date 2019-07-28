---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "2.4_如何使用ZStack将视图叠加在一起"
subtitle: ""
summary: " "
authors: [admin]
tags: ["View layout"]
categories: [SwiftUI]
date: 2019-07-25T13:26:52+08:00
lastmod: 2019-07-25T13:26:52+08:00
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

SwiftUI 有一个专用的 _stack_ 类型，用于创建重叠内容，例如，如果我们想在图片上放置一些文本，它就很有用。它被称为 `ZStack`，其工作原理与其他两种 _stack_ 类型相同。

### 1. 在文本下面放置图片
例如: 我们可以在如下文本下面放置一个大图像:
```swift
var body: some View {
    ZStack() {
        Image("example-image")
        Text("Hello SwiftUI")
            .font(.largeTitle)
            .background(Color.black)
            .foregroundColor(.white)
    }
}
```
运行效果:
![zstack_image_text](img/zstack_image_text.png "Set zstack with a image and a text, image is below text")
### 2. 对齐
与其它 _stack_ 类型一样，`ZStack` 也可以设置对齐方式，这样它就不会总是将事物置于自身的中心位置:

```swift
var body: some View {
    ZStack(alignment: .leading) {
        Image("example-image")
            .resizable()
            .aspectRatio(contentMode: .fit)
        Text("Hello SwiftUI")
            .font(.largeTitle)
            .background(Color.black)
            .foregroundColor(.white)
    }
}
```
运行效果:
![zstack_alignment_leading](img/zstack_alignment_leading.png "Set zstack's alignment as .leading")
但是，它没有 _spacing_ 属性，因为它实际上没有意义。