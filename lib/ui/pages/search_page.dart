import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/domain/hive/hive_boxes.dart';
import 'package:notes/domain/hive/note_data.dart';
import 'package:notes/domain/hive/providers/note_provider.dart';
import 'package:notes/ui/style/app_colors.dart';
import 'package:notes/ui/style/app_text_styles.dart';
import 'package:notes/ui/widgets/app_bar_shadows.dart';
import 'package:notes/ui/widgets/note_item.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _notes = HiveBoxes.notes.values.toList();
  List<NoteData> filterList = <NoteData>[];
  final searchController = TextEditingController();

  void _searchNote() {
    final query = searchController.text;
    if (query.isNotEmpty) {
      filterList = _notes.where((note) {
        return note.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      filterList = _notes;
    }
    setState(() {});
  }

  @override
  void initState() {
    filterList = _notes;
    searchController.addListener(_searchNote);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const AppBarShadows(),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
            ),
            Expanded(
              child: TextField(
                style: const TextStyle(
                  color: Colors.white70,
                ),
                controller: searchController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Поиск...',
                  hintStyle: TextStyle(
                    fontSize: 24,
                    height: 28 / 22,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.close),
            ),
          ],
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: HiveBoxes.notes.listenable(),
        builder: (context, value, _) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: filterList.length,
            itemBuilder: (context, index) => NoteItem(
              title: filterList[index].title,
              date: filterList[index].date,
              note: filterList[index].note,
              index: index,
            ),
          );
        },
      ),
    );
  }
}
