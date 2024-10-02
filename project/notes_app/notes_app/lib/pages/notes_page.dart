// ignore_for_file: non_constant_identifier_names, unused_local_variable, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:notes_app/models/note_database.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';
import '../models/note_database.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  // Controller text để truy cập những gì người dùng nhập
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Khi mở app, fetch những note đã tồn tại

    readNote();
  }

  // Tạo một note
  void createNote() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: textController,
              ),
              actions: [
                // Tạo nút
                MaterialButton(
                  onPressed: () {
                    // Thêm vào DB
                    context.read<NoteDatabase>().addNote(textController.text);

                    // Làm sạch controller
                    textController.clear();

                    // Thoát dialog
                    Navigator.pop(context);
                  },
                  child: const Text('Create'),
                ),
              ],
            ));
  }

  // Duyệt các note
  void readNote() {
    context.read<NoteDatabase>().fetchNotes();
  }

  // Chỉnh sửa một note
  void updateNote(Note note) {
    // Điền trước note hiện tại
    textController.text = note.text;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Update Note"),
        content: TextField(
          controller: textController,
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              // Chỉnh sửa note trong DB
              context
                  .read<NoteDatabase>()
                  .updateNote(note.id, textController.text);
              // Làm mới controller
              textController.clear();
              // Thoát khỏi Dialog
              Navigator.pop(context);
            },
            child: const Text("Update"),
          ),
        ],
      ),
    );
  }

  // Xoá một note
  void deleteNote(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    // Note có trong DB
    final noteDatabase = context.watch<NoteDatabase>();

    // Các note hiện tại
    List<Note> currentNotes = noteDatabase.currentNotes;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Notes')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: currentNotes.length,
        itemBuilder: (context, index) {
          // Lấy từng note
          final note = currentNotes[index];

          // Trả về giao diện người dùng
          return ListTile(
            title: Text(note.text),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Nút chỉnh sửa
                IconButton(
                  onPressed: () => updateNote(note),
                  icon: const Icon(Icons.edit),
                ),

                // Nút xoá
                IconButton(
                  onPressed: () => deleteNote(note.id),
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
