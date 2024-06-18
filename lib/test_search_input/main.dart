import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:providers_test/test_search_input/result_list.dart';
import 'package:providers_test/test_search_input/search_input.dart';
import 'package:providers_test/test_search_input/search_notifier.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchText = ref.watch(searchProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:  Text('Search'),
        ),
        body: Column(
          children: [
            const SearchInput(),
            // Here you can display search results using searchText
            Expanded(
              child: searchText.isEmpty
                  ?  const Center(child: Text('Enter text to search'))
                  : ResultsList(searchText: searchText),
            ),
          ],
        ),
      ),
    );
  }
}