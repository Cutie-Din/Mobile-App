// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:notes_app/models/note.dart';
import 'package:path_provider/path_provider.dart';

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

  // Create - Tạo note và lưu vào DB
  Future<void> addNote(String textFromUser) async {
    // Tạo một note mới
    final newNote = Note()..text = textFromUser;

    // Lưu vào DB
    await isar.writeTxn(() => isar.notes.put(newNote));

    // Lướt lại những gì có trong DB
    fetchNotes();
  }

  // Read - Lấy ra các note trong DB
  Future<void> fetchNotes() async {
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedNotes);
    notifyListeners();
  }

  // Update - Chỉnh sửa một note trong DB
  Future<void> updateNote(int id, String newText) async {
    final existingNote = await isar.notes.get(id);
    if (existingNote != null) {
      existingNote.text = newText;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }
    notifyListeners();
  }

  // Delete - Xoá một note trong DB
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
    notifyListeners();
  }
}
