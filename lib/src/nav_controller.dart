
import 'package:flutter/foundation.dart';

/// A controller for [BottomNavX] to manage the state of the navigation bar.
///
/// This controller allows you to programmatically control the selected index
/// and listen to index changes.
class BottomNavController extends ChangeNotifier {
  /// Creates a controller for a [BottomNavX].
  ///
  /// The [initialIndex] must not be null and must be greater than or equal to 0.
  BottomNavController({int initialIndex = 0}) : _index = initialIndex {
    assert(initialIndex >= 0, 'initialIndex cannot be negative');
  }

  int _index;

  /// The currently selected index.
  int get index => _index;

  /// Changes the currently selected index.
  ///
  /// This will notify all the listeners of this [BottomNavController].
  set index(int value) {
    if (_index != value) {
      _index = value;
      notifyListeners();
    }
  }
}
