
# flutter_navx

A lightweight and highly customizable bottom navigation bar component for Flutter.

`bottom_navx` is designed to be a flexible replacement for the standard `BottomNavigationBar` + `IndexedStack` combination, offering enhanced control over page state and UI customization.

## Features

- **State Preservation**: Keeps page state alive using `IndexedStack` by default.
- **Highly Customizable**: Use builders (`tabBuilder`, `pageBuilder`) to create unique UI designs.
- **Lazy Loading**: Configure page loading strategies to optimize memory usage.
- **Nested Navigation**: Supports embedding independent `Navigator` instances within each tab.
- **Rich Visuals**: Easily add animations, badges, and custom-selected effects.

## Getting Started

### 1. Add Dependency

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_navx: ^1.0.0 # Replace with the latest version
```

### 2. Install

You can install packages from the command line:

```shell
flutter pub get
```

### 3. Basic Usage

Here is a simple example of how to use `BottomNavX`:

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
    Center(child: Text('Home')),
    Center(child: Text('Search')),
    Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BottomNavX Example')),
      body: BottomNavX(
        controller: _controller,
        items: const [
          BottomNavItem(icon: Icon(Icons.home), title: 'Home'),
          BottomNavItem(icon: Icon(Icons.search), title: 'Search'),
          BottomNavItem(icon: Icon(Icons.person), title: 'Profile'),
        ],
        pageBuilder: (index) => _pages[index],
      ),
    );
  }
}
```

## API Reference

### `BottomNavX`

| Parameter      | Type                          | Description                                |
| -------------- | ----------------------------- | ------------------------------------------ |
| `items`        | `List<BottomNavItem>`         | The navigation items to display.           |
| `controller`   | `BottomNavController`         | Controller to manage the navigation state. |
| `pageBuilder`  | `Widget Function(int index)?` | A builder for creating the pages.          |
| `tabBuilder`   | `Widget Function(int, bool)?` | A builder for customizing tab items.       |
| `onTap`        | `void Function(int index)?`   | Callback when a tab is tapped.             |

### `BottomNavItem`

| Parameter    | Type      | Description                      |
| ------------ | --------- | -------------------------------- |
| `icon`       | `Widget`  | The icon for the item.           |
| `title`      | `String?` | The title label for the item.    |
| `activeIcon` | `Widget?` | Icon to display when active.     |
| `badge`      | `Widget?` | A badge to display on the icon.  |

## Contribution

Contributions are welcome! Please feel free to submit a Pull Request.

1.  Fork the repository.
2.  Create your feature branch (`git checkout -b feature/your-feature`).
3.  Commit your changes (`git commit -m 'Add some feature'`).
4.  Push to the branch (`git push origin feature/your-feature`).
5.  Open a Pull Request.
