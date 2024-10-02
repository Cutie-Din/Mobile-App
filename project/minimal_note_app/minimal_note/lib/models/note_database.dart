import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:minimal_note/models/note.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class NoteDatabase extends ChangeNotifier {
  static late Isar isar;
  // Khởi tạo DB
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [NoteSchema],
      directory: dir.path,
    );
  }

  // Danh sách các note
  final List<Note> currentNotes = [];

  // Create
  Future<void> addNote(String text) async {
    final newNote = Note()..text = text;

    await isar.writeTxn(() => isar.notes.put(newNote));

    fetchNotes();
  }

  // Read
  Future<void> fetchNotes() async {
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedNotes);
    notifyListeners();
  }

  // Update
  Future<void> updateNote(int id, String newText) async {
    final existingNote = await isar.notes.get(id);
    if (existingNote != null) {
      existingNote.text = newText;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }
  }

  // Delete
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}
