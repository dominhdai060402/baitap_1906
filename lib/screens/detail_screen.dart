import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String title;
  final String context;

  DetailScreen({required this.title, required this.context});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contextController;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.title);
    _contextController = TextEditingController(text: widget.context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE8CEE4),
        title: _isEditing
            ? TextField(
          controller: _titleController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Title',
            hintStyle: TextStyle(color: Colors.white54),
          ),
        )
            : Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.check : Icons.edit),
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _isEditing
                ? TextField(
              controller: _contextController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              minLines: 3,
              decoration: InputDecoration(
                hintText: 'Context',
                border: OutlineInputBorder(),
              ),
            )
                : Expanded(
              child: SingleChildScrollView(
                child: Text(widget.context),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _isEditing
          ? FloatingActionButton(
        onPressed: () {
          // Save logic here
          Navigator.of(context).pop({
            'title': _titleController.text,
            'context': _contextController.text,
          });
        },
        child: Icon(Icons.check),
      )
          : null,
    );
  }
}