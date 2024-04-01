import 'dart:math';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class QrPage extends StatelessWidget {
  final String id;

  // ignore: prefer_const_constructors_in_immutables
  QrPage({super.key, required this.id});

 void initialize() async {
   WidgetsFlutterBinding.ensureInitialized();
    await Supabase.initialize(
      url: 'https://pkeydjfhoptfegirxahh.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBrZXlkamZob3B0ZmVnaXJ4YWhoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE5OTM1MzMsImV4cCI6MjAyNzU2OTUzM30.TX9INE0QwxikLE0VCmdQ9-sFnvMfAHrw_H-6Cz8zBBk',
    );
 }

 void insert() async {
  final supabase = Supabase.instance.client;
  await supabase.from('pc_info').insert({'id': id});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Leia código QR abaixo para se conectar:', style: TextStyle(fontSize: 24)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:8.0),
              child: QrImageView(
                data: id,
                version: QrVersions.auto,
                size: 200,
                backgroundColor: Colors.white,
              ),
            ),
            ElevatedButton(onPressed: () => {
              initialize(),
              insert()
            }, child: const Text('Registrar'))
          ],
        ),
      ),
    );
  }
}