import 'package:flutter/material.dart';
import 'package:wallpaper_shivam/views/screens/search.dart';

class SearchBarPage extends StatelessWidget {
  SearchBarPage({super.key});
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.black12,
        border: Border.all(color: Colors.black38),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search Wallpaper",
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SearchScreen(query: _searchController.text)));
              },
              child: Icon(Icons.search)),
        ],
      ),
    );
  }
}
