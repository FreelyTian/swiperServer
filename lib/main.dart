import 'dart:math';

import 'package:flutter/material.dart';
import 'package:swiper_server/configs/app_settings.dart';
import 'package:swiper_server/pages/qr_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late String id;
  String msg = 'Leia o código abaixo para se conectar!';

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    AppSettings stts = AppSettings();
    if (await stts.isEmpty()) {
      await stts.setlocalS(Random().nextInt(999999).toString());
      id = await stts.readData();
    } else {
      id = await stts.readData();
      setState(() {
        msg = 'Seu código de conexão é: $id';
      });
    }
    setState(() {}); // Para reconstruir o widget com o novo valor de id
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
            body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                msg,
                style: const TextStyle(fontSize: 24),
              ),
              QrPage(id: id),
            ],
          ),
        )));
  }
}
