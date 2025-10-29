import 'package:flutter/material.dart';
import 'package:news/home/category/widget/source_name.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/utils/App_colors.dart';
import '../news/news_widget.dart';

class SourceTabWidget extends StatefulWidget {
  final List<Source> sourcesList;

  const SourceTabWidget({super.key, required this.sourcesList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
            tabAlignment: TabAlignment.start,
            dividerColor: AppColors.transparent,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            indicatorColor: Theme.of(context).indicatorColor,
            isScrollable: true,
            tabs: widget.sourcesList.map((source) {
              return SourceName(
                source: source,
                selected: selectedIndex == widget.sourcesList.indexOf(source),
              );
            }).toList(),
          ),

          Expanded(
            child: NewsWidget(source: widget.sourcesList[selectedIndex]),
          ),
        ],
      ),
    );
  }
}
