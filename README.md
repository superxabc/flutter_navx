# flutter_navx

一个轻量级、高度可定制的 Flutter 底部导航栏组件。

`bottom_navx` 旨在成为标准 `BottomNavigationBar` + `IndexedStack` 组合的灵活替代品，为页面状态管理和 UI 自定义提供更强的控制力。

## 特性

- **状态保持**: 默认使用 `IndexedStack` 保持页面状态，避免页面重载。
- **高度可定制**: 通过构建器（`tabBuilder`, `pageBuilder`）创建独特的 UI 设计。
- **懒加载**: 可配置页面加载策略，优化内存使用。
- **嵌套导航**: 支持在每个标签页内嵌入独立的 `Navigator`。
- **丰富的视觉效果**: 轻松添加动画、徽标和自定义选中效果。

## 快速上手

### 1. 添加依赖

在你的 `pubspec.yaml` 文件中添加依赖：

```yaml
dependencies:
  flutter_navx:
    git:
      url: https://github.com/superxabc/flutter_navx.git
      ref: main # 或者指定某个 release 版本
```

### 2. 安装

在命令行中运行：

```shell
flutter pub get
```

### 3. 基本用法

这是一个 `BottomNavX` 的基础使用示例：

```dart
import 'package:flutter/material.dart';
import 'package:flutter_navx/flutter_navx.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = BottomNavController();

  final List<Widget> _pages = [
    Center(child: Text('首页')),
    Center(child: Text('发现')),
    Center(child: Text('我的')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BottomNavX 示例')),
      body: BottomNavX(
        controller: _controller,
        items: const [
          BottomNavItem(icon: Icon(Icons.home), title: '首页'),
          BottomNavItem(icon: Icon(Icons.search), title: '发现'),
          BottomNavItem(icon: Icon(Icons.person), title: '我的'),
        ],
        pageBuilder: (index) => _pages[index],
      ),
    );
  }
}
```

## API 参考

### `BottomNavX`

| 参数         | 类型                          | 说明                               |
| ------------ | ----------------------------- | ---------------------------------- |
| `items`      | `List<BottomNavItem>`         | 需要展示的导航项列表。             |
| `controller` | `BottomNavController`         | 用于管理导航状态的控制器。         |
| `pageBuilder`| `Widget Function(int index)?` | 用于创建页面的构建器。             |
| `tabBuilder` | `Widget Function(int, bool)?` | 用于自定义导航项（Tab）的构建器。  |
| `onTap`      | `void Function(int index)?`   | 当导航项被点击时的回调。           |

### `BottomNavItem`

| 参数         | 类型      | 说明                       |
| ------------ | --------- | -------------------------- |
| `icon`       | `Widget`  | 导航项的图标。             |
| `title`      | `String?` | 导航项的标题。             |
| `activeIcon` | `Widget?` | 导航项激活状态下显示的图标。 |
| `badge`      | `Widget?` | 显示在图标上的徽标。       |

## 贡献

欢迎各种形式的贡献！请随时提交 Pull Request。

1.  Fork 本仓库。
2.  创建你的功能分支 (`git checkout -b feature/your-feature`)。
3.  提交你的更改 (`git commit -m 'Add some feature'`)。
4.  将分支推送到你的 Fork 仓库 (`git push origin feature/your-feature`)。
5.  创建一个 Pull Request。