import 'package:flutter/material.dart';

class DialogEx extends StatelessWidget {
  const DialogEx({super.key});

  @override
  Widget build(BuildContext context) {
    void showAlertDialog() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          scrollable: true,
          icon: const Icon(Icons.notifications),
          title: const Text('Note'),
          content: const SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                ),
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Accept'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Deny'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Query'),
            ),
          ],
        ),
      );
    }

    void showSimpleDialog() {
      showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          shadowColor: Colors.red,
          surfaceTintColor: Colors.amber,
          title: const Text('Simple Dialog'),
          children: [
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context),
              child: const Text('Option 1'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context),
              child: const Text('Option 2'),
            ),
          ],
        ),
      );
    }

    void showBottomSheetDialog() {
      showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          padding: const EdgeInsets.all(16.0),
          height: 200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Bottom Sheet Dialog',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () {
              showBottomSheetDialog();
            },
            child: const Text('dialop'))
      ],
    ));
  }
}
