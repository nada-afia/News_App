import 'package:flutter/material.dart';
import 'package:news/home/category_fragment/category_fragment.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Home"))),
      body: CategoryFragment(),
    );
  }
}