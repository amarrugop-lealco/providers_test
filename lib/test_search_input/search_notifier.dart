import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchNotifier extends StateNotifier<String> {
  SearchNotifier() : super('');

  Timer? _debounce;

  void updateSearchText(String text) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 600), () {
      state = text;
      // Here you can call your search function.
      _performSearch(text);
    });
  }

  void _performSearch(String text) {
    // Implement your search logic here
    print('Searching with: $text');
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}

/// You can remove the provider's state using the autoDispose property or with
/// the invalidate method if you want more control. The latter is more recommended
/// for performing operations on general controllers or those that
/// can be used in multiple parts, like this one.
///
/// Provider scope of notifier
final searchProvider = StateNotifierProvider<SearchNotifier, String>((ref) {
  return SearchNotifier();
});
