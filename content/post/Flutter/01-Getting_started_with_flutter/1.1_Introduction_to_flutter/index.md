---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "1.1_Flutter 简介"
subtitle: ""
summary: ""
authors: [admin]
tags: ["Getting started with flutter"]
categories: ["Flutter"]
date: 2019-09-17T10:20:30+08:00
lastmod: 2019-09-17T10:20:30+08:00
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
# 1 - 前言
自从十年前 iOS 和 Android 平台出现爆发式增长以来，跨平台开发(cross-platform development)一直是移动开发界的一个目标。同时为 iOS 和 Android 编写一个应用程序的能力可以为您的公司和团队节省大量的时间和精力。

多年来，已经发布了各种用于跨平台开发的工具，包括:

* 基于 Web 的工具: 如 Adobe 的 `PhoneGap`
* 强大的框架: 如 Microsoft 的 `Xamarin`
* 较新的工具: 如 Facebook 的 `React Native`

每个工具集都有优缺点，它们在移动行业中都取得了不同程度的成功。

当然，进入跨平台开发领域的最新框架是来自 Google 的 `Flutter`。Flutter 在两个平台上都具有:

* 快速的开发周期
* 快速的 UI 渲染
* 独特的 UI 设计
* 原生应用程序性能

# 2 - 介绍
Flutter 应用程序是使用 `Dart` 编程语言编写的，也是源自 Google，现在是 ECMA 标准。Dart 与其他现代语言（如 `Kotlin` 和 `Swift`）具有许多相同的特性，可以被编译成`Javascript` 代码。

作为一个跨平台框架，Flutter 与 React Native 最为相似，因为 Flutter 允许一种 **响应式** 和 **声明式** 的编程风格。 然而，与 React Native 不同，Flutter 不需要使用 `Javascript bridge`，这样就可以改善应用程序启动时间和整体性能。 Dart 通过使用 `Ahead-Of-Time` 或 `AOT` 编译来实现此目的。

Dart 的另一个独特之处是它也可以使用 `Just-In-Time` 或 `JIT` 编译。 使用 Flutter进行 JIT 编译通过允许 **热重载(hot reload)** 功能在开发期间刷新 UI， 而无需全新的构建，从而改进了开发工作流程。
