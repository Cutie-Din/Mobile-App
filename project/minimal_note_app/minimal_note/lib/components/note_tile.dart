import 'package:flutter/material.dart';
import 'package:minimal_note/pages/settings_page.dart';
import 'package:popover/popover.dart';

import 'note_settings.dart';

class NoteTile extends StatelessWidget {
  final String text;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;
  const NoteTile({
    super.key,
    required this.text,
    required this.onEditPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(
        bottom: 10,
        left: 25,
        right: 25,
      ),
      child: ListTile(
        title: Text(text),
        trailing: Builder(
          builder: (context) => IconButton(
            onPressed: () => showPopover(
              width: 100,
              height: 100,
              context: context,
              backgroundColor: Theme.of(context).colorScheme.background,
              bodyBuilder: (context) => NoteSettings(
                onEditTap: onEditPressed,
                onDeleteTap: onDeletePressed,
              ),
            ),
            icon: Icon(Icons.more_vert),
          ),
        ),
      ),
    );
  }
}
