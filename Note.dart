// import 'package:flutter/material.dart';
// import 'addnote.dart';

// class Page3 extends StatelessWidget {
//   const Page3({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'CheckMate',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: const Color.fromARGB(255, 93, 187, 152),
//       ),
//       body: const Center(
//         child: Text(
//           'Welcome to CheckMate!',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const AddNotePage()),
//           );
//         },
//         backgroundColor: const Color.fromARGB(255, 93, 187, 152),
//         child: const Icon(Icons.add, size: 30),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:kmodel1/kmodel.dart';
// import 'addnote.dart';

// class Page3 extends StatefulWidget {
//   const Page3({super.key});

//   @override
//   State<Page3> createState() => _Page3State();
// }

// class _Page3State extends State<Page3> {
//   List<Note> notes = [];

//   void _deleteNote(int index) {
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text('Delete Note'),
//         content: const Text('Are you sure you want to delete this note?'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               setState(() {
//                 notes.removeAt(index);
//               });
//               Navigator.pop(context);
//             },
//             child: const Text('Delete', style: TextStyle(color: Colors.red)),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _editNote(int index) async {
//     final updatedNote = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (_) => AddNotePage(note: notes[index]),
//       ),
//     );

//     if (updatedNote != null && updatedNote is Note) {
//       setState(() {
//         notes[index] = updatedNote;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('CheckMate',
//             style: TextStyle(fontWeight: FontWeight.bold)),
//         backgroundColor: const Color.fromARGB(255, 93, 187, 152),
//       ),
//       body: notes.isEmpty
//           ? const Center(child: Text('No Notes Yet ✍️'))
//           : ListView.builder(
//               padding: const EdgeInsets.all(10),
//               itemCount: notes.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   elevation: 4,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   margin: const EdgeInsets.symmetric(vertical: 8),
//                   child: ListTile(
//                     title: Text(
//                       notes[index].title,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                     subtitle: Text(
//                       notes[index].content,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     trailing: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                           icon: const Icon(Icons.edit, color: Colors.blue),
//                           onPressed: () => _editNote(index),
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.delete, color: Colors.red),
//                           onPressed: () => _deleteNote(index),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: const Color.fromARGB(255, 93, 187, 152),
//         child: const Icon(Icons.add),
//         onPressed: () async {
//           final newNote = await Navigator.push(
//             context,
//             MaterialPageRoute(builder: (_) => const AddNotePage()),
//           );

//           if (newNote != null && newNote is Note) {
//             setState(() {
//               notes.add(newNote);
//             });
//           }
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kmodel1/mynotes.dart';

class Note extends StatefulWidget {
  const Note({super.key});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  List<Map<String, String>> notes = [];

  void addNote(String title, String note) {
    String formattedDate =
        DateFormat('dd MMM yyyy, hh:mm a').format(DateTime.now());

    setState(() {
      notes.add({
        'title': title,
        'note': note,
        'date': formattedDate,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'checkmate',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.tealAccent.shade700,
      ),
      body: notes.isEmpty
          ? Center(
              child: const Text(
                'No notes yet',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    title: Text(
                      notes[index]['title'] ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notes[index]['note'] ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          notes[index]['date'] ?? '',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.teal),
                          onPressed: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Mynotes(
                                  title: notes[index]['title'],
                                  note: notes[index]['note'],
                                ),
                              ),
                            );

                            if (result != null) {
                              setState(() {
                                notes[index] = {
                                  'title': result['title'],
                                  'note': result['note'],
                                  'date': notes[index]['date']!,
                                };
                              });
                            }
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Delete Note'),
                                content: const Text(
                                    'Are you sure to delete this note?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        notes.removeAt(index);
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Delete',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            );
                            print('deleted');
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Mynotes()),
          );

          if (result != null) {
            addNote(result['title'], result['note']);
            print('added');
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.tealAccent.shade700,
          fixedSize: const Size(56, 56),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: EdgeInsets.zero,
        ),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
