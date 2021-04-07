import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'kayitekrani.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Firebase'i Çalıştır
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: KayitUygulama(),
  ));
}

class KayitUygulama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return KayitEkrani();
  }
}
