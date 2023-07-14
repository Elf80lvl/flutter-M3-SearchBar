import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // int _selectedMenu = 0;

  var allItems = List.generate(50, (index) => 'item $index');
  var items = [];
  var searchHistory = [];
  final TextEditingController _searchController = TextEditingController();

  _search(String query) {
    if (query.isEmpty) {
      setState(() {
        items = allItems;
      });
    } else {
      items = allItems
          .where(
              (element) => element.toLowerCase().contains(query.toLowerCase()))
          .toList();
      setState(() {});
    }
  }

  _queryListener() {
    _search(_searchController.text);
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_queryListener);
  }

  @override
  void dispose() {
    _searchController.removeListener(_queryListener);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 85,
        title: SearchBar(
          controller: _searchController,
          hintText: 'Search',
          leading: const Icon(Icons.search),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 16)),
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(
            Theme.of(context).primaryColor.withOpacity(0.05),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
            child: ListView.builder(
                itemCount: items.isEmpty ? allItems.length : items.length,
                itemBuilder: (context, index) {
                  final item = items.isEmpty ? allItems[index] : items[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(item),
                        ],
                      ),
                    ),
                  );
                })),
      ),
    );
  }
}
