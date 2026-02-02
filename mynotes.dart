// import 'package:flutter/material.dart';

// class AddNotePage extends StatefulWidget {
//   const AddNotePage({super.key});

//   @override
//   State<AddNotePage> createState() => _AddNotePageState();
// }

// class _AddNotePageState extends State<AddNotePage> {
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _contentController = TextEditingController();
//   // DBHelper instance

//   @override
//   void dispose() {
//     _titleController.dispose();
//     _contentController.dispose();
//     super.dispose();
//   }

//   Future<void> _saveNote() async {
//     String title = _titleController.text.trim();
//     String content = _contentController.text.trim();

//     if (title.isEmpty || content.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please fill both Title and Content')),
//       );
//       return;
//     }

//     // Debug console
//     print('Saved Note -> Title: $title, Content: $content');

//     Navigator.pop(context); // Back to Page3
//   }

//   void _cancel() {
//     Navigator.pop(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Add Note',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: const Color.fromARGB(255, 93, 187, 152),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _titleController,
//               decoration: const InputDecoration(
//                 labelText: 'Title',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _contentController,
//               maxLines: 5,
//               decoration: const InputDecoration(
//                 labelText: 'Content',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const Spacer(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: _saveNote,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromARGB(255, 93, 187, 152),
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 30, vertical: 15),
//                   ),
//                   child: const Text('Save', style: TextStyle(fontSize: 16)),
//                 ),
//                 ElevatedButton(
//                   onPressed: _cancel,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.grey,
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 30, vertical: 15),
//                   ),
//                   child: const Text('Cancel', style: TextStyle(fontSize: 16)),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:kmodel1/kmodel.dart';

// class AddNotePage extends StatefulWidget {
//   final Note? note;

//   const AddNotePage({super.key, this.note});

//   @override
//   State<AddNotePage> createState() => _AddNotePageState();
// }

// class _AddNotePageState extends State<AddNotePage> {
//   late TextEditingController _titleController;
//   late TextEditingController _contentController;

//   @override
//   void initState() {
//     super.initState();
//     _titleController = TextEditingController(text: widget.note?.title ?? '');
//     _contentController =
//         TextEditingController(text: widget.note?.content ?? '');
//   }

//   void _saveNote() {
//     if (_titleController.text.isEmpty || _contentController.text.isEmpty) {
//       return;
//     }

//     Navigator.pop(
//       context,
//       Note(
//         title: _titleController.text.trim(),
//         content: _contentController.text.trim(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.note == null ? 'Add Note' : 'Edit Note'),
//         backgroundColor: const Color.fromARGB(255, 93, 187, 152),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             TextField(
//               controller: _titleController,
//               decoration: const InputDecoration(
//                 labelText: 'Title',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _contentController,
//               maxLines: 5,
//               decoration: const InputDecoration(
//                 labelText: 'Content',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const Spacer(),
//             ElevatedButton(
//               onPressed: _saveNote,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color.fromARGB(255, 93, 187, 152),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//               ),
//               child: const Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class Mynotes extends StatefulWidget {
  final String? title;
  final String? note;

  const Mynotes({super.key, this.title, this.note});

  @override
  State<Mynotes> createState() => _MynotesState();
}

class _MynotesState extends State<Mynotes> {
  late TextEditingController titleController;
  late TextEditingController noteController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.title ?? '');
    noteController = TextEditingController(text: widget.note ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Notes',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.tealAccent.shade700, // updated color
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: noteController,
                decoration: const InputDecoration(
                  labelText: 'Note',
                ),
                maxLines: 4,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 100,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isNotEmpty ||
                        noteController.text.isNotEmpty) {
                      Navigator.pop(context, {
                        'title': titleController.text,
                        'note': noteController.text,
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.tealAccent.shade700, // updated color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }
}
