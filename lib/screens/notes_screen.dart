import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:baitap_1906_01/main.dart';
import 'package:baitap_1906_01/app.dart';
import 'package:baitap_1906_01/screens/detail_screen.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contextController = TextEditingController();

  List<Map<String, dynamic>> _items = [];
  final _shoppingBox = Hive.box('shopping_box');

  @override
  void initState() {
    super.initState();
    _refreshItems();
  }

  void _refreshItems() {
    final data = _shoppingBox.keys.map((key) {
      final item = _shoppingBox.get(key);
      return {"key": key, "title": item["title"], "context": item["context"]};
    }).toList();

    setState(() {
      _items = data.reversed.toList();
    });
  }

  Future<void> _newAddItem(Map<String, dynamic> newItem) async {
    await _shoppingBox.add(newItem);
    _refreshItems();
  }

  Future<void> _updateItem(int itemKey, Map<String, dynamic> newItem) async {
    await _shoppingBox.put(itemKey, newItem);
    _refreshItems();
  }

  void _showBottomSheet(BuildContext ctx, int? itemKey) {
    bool isUpdating = itemKey != null;

    if (isUpdating) {
      final existingItem = _items.firstWhere((item) => item["key"] == itemKey);
      _titleController.text = existingItem["title"];
      _contextController.text = existingItem["context"];
    } else {
      _titleController.clear();
      _contextController.clear();
    }

    showModalBottomSheet(
      context: ctx,
      elevation: 5,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: 'Title',
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: _contextController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                minLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Context',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  if (_titleController.text.trim().isEmpty ||
                      _contextController.text.trim().isEmpty) {
                    // Hiển thị thông báo
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Dữ liệu không được để trống'),
                      ),
                    );
                    return;
                  }

                  if (isUpdating) {
                    await _updateItem(itemKey!, {
                      'title': _titleController.text.trim(),
                      'context': _contextController.text.trim(),
                    });
                  } else {
                    await _newAddItem({
                      'title': _titleController.text.trim(),
                      'context': _contextController.text.trim(),
                    });
                  }

                  _titleController.clear();
                  _contextController.clear();

                  Navigator.of(context).pop();
                },
                child: Text(isUpdating ? 'Update' : 'New'),
              ),
              const SizedBox(height: 15.0),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD7BCE8),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20.0, top: 70.0),
              alignment: Alignment.topLeft,
              child: Text(
                'Hi, Minh Đại',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20.0, top: 0.0),
                    child: Text(
                      'Good Morning',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.ac_unit_sharp),
                    color: Colors.black,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Color(0xFFFDE2FF),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.black,
                    onPressed: () {},
                  ),
                  Expanded(
                    child: Container(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Tìm kiếm',
                          filled: true,
                          fillColor: Color(0xFFFDE2FF),
                          hintStyle: TextStyle(
                            color: Color(0xFF575757),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 14.0, horizontal: 10.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Text(
                    'All Notes',
                    style: TextStyle(
                      color: Color(0xFF575757),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_drop_down),
                    color: Colors.black,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(0),
                itemCount: _items.length,
                itemBuilder: (_, index) {
                  final currentItem = _items[index];
                  return Card(
                    color: Color(0xFFFDE2FF),
                    margin: EdgeInsets.all(10.0),
                    elevation: 3,
                    child: ListTile(
                      title: Text(
                        currentItem['title'],
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        currentItem['context'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.delete),
                            iconSize: 20,
                            onPressed: () {
                              _shoppingBox.delete(currentItem['key']);
                              _refreshItems();
                            },
                            tooltip: 'Xóa',
                          ),
                          IconButton(
                            icon: Icon(Icons.edit),
                            iconSize: 20,
                            onPressed: () =>
                                _showBottomSheet(context, currentItem['key']),
                            tooltip: 'Sửa',
                          ),
                        ],
                      ),
                      onTap: () async {
                        // nhan du lieu
                        var result = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              title: currentItem['title'],
                              context: currentItem['context'],
                            ),
                          ),
                        );
                        print(result);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: FloatingActionButton(
          onPressed: () {
            _showBottomSheet(context, null);
          },
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
