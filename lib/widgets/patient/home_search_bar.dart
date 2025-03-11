import 'package:flutter/material.dart';

class HomeSearchBar extends StatefulWidget {
  final ValueChanged<String> onSearch;

  const HomeSearchBar({super.key, required this.onSearch});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: TextField(
          onChanged: widget.onSearch,
          decoration: const InputDecoration(
            icon: Icon(Icons.search, color: Colors.grey),
            hintText: "Search...",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
