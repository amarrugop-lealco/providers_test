import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:providers_test/test_search_input/search_notifier.dart';

/// Documentation here
class SearchInput extends ConsumerStatefulWidget {
  const SearchInput({super.key});

  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends ConsumerState<SearchInput> {
  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(searchProvider.notifier);

    return TextField(
      onChanged: (text) => notifier.updateSearchText(text),
      decoration: const InputDecoration(
        hintText: 'Search...',
      ),
    );
  }
}
