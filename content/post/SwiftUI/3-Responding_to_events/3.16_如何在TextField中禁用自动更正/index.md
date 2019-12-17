---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "3.16_如何在TextField中禁用自动更正"
subtitle: ""
summary: " "
authors: [admin]
tags: ["Responding to events"]
categories: ["SwiftUI"]
date: 2019-11-19T18:01:19+08:00
lastmod: 2019-11-19T18:01:19+08:00
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

默认情况下，SwiftUI 的 `TextField` 会启用自动更正功能，这在大多数情况下都是我们所需要的。 但是，如果要禁用它，可以使用 `disableAutocorrection()` 修饰符来实现，如下所示:
```swift
struct ContentView: View {
    @State private var name = ""
    var body: some View {
        TextField("Enter your name", text: $name)
            .disableAutocorrection(true)
    }
}
```