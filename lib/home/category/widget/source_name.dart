import 'package:flutter/material.dart';
import 'package:news/model/SourceResponse.dart';
class SourceName extends StatelessWidget {
  final Source source;
  final bool selected;

  const SourceName({super.key, required this.source, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Text(
      source.name ?? '',
      style: selected
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.labelMedium,
    );
  }
}