import 'package:flutter/material.dart';
import 'package:flutter_samples/bottomsheet/btmsheet_one.dart';
import 'package:flutter_samples/sample_page.dart';

import 'dialog/dialog_ex.dart';
import 'dropdown/dropdown_ex.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DropdownExamples(),
    );
  }
}
