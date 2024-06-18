import 'package:flutter/material.dart';

class ResultsList extends StatelessWidget {
  final String searchText;

  const ResultsList({super.key, required this.searchText});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(title: Text('Result for "$searchText"')),
        // Más Results...
      ],
    );
  }
}