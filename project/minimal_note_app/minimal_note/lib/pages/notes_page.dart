// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal_note/components/drawer.dart';
import 'package:minimal_note/components/note_tile.dart';
import 'package:minimal_note/models/note_database.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  // Text controller để người dùng có thể truy cập và nhập
  final textController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // Tạo một note
  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Create"),
        content: TextField(
          controller: textController,
        ),
        actions: [
          // Nút tạo
          MaterialButton(
            onPressed: () {
              // Thêm vào DB
              context.read<NoteDatabase>().addNote(textController.text);

              // Làm mới controller
              textController.clear();

              // Thoát khỏi dialog
              Navigator.pop(context);
            },
            child: Text('Create'),
          ),
          MaterialButton(
            onPressed: () {
              // Thoát khỏi dialog
              Navigator.pop(context);

              // Làm mới controller
              textController.clear();
            },
            child: Text("Cancel"),
          ),
        ],
      ),
    );
  }

  // Đọc các note
  void readNotes() {
    context.watch<NoteDatabase>().fetchNotes();
  }

  // Sửa một note
  void updateNote(Note note) {
    // Điền sẵn những gì chuẩn bị sửa
    textController.text = note.text;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Update note"),
        content: TextField(
          controller: textController,
        ),
        actions: [
          MaterialButton(
            // Chỉnh sửa một note trong DB
            onPressed: () {
              context
                  .read<NoteDatabase>()
                  .updateNote(note.id, textController.text);
              // Làm mới controller
              textController.clear();
              // Thoát khỏi dialog
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
    // DB note
    final noteDatabase = context.watch<NoteDatabase>();

    // Các notes hiện tại
    List<Note> currentNotes = noteDatabase.currentNotes;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: const Icon(Icons.add),
      ),
      drawer: const MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              "Notes",
              style: GoogleFonts.dmSerifText(
                fontSize: 48,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          // Danh sách các note
          Expanded(
            child: ListView.builder(
              itemCount: currentNotes.length,
              itemBuilder: (context, index) {
                // Lấy từng note một
                final note = currentNotes[index];

                // Trả về giao diện người dùng
                return NoteTile(
                  text: note.text,
                  onEditPressed: () => updateNote(note),
                  onDeletePressed: () => deleteNote(note.id),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
