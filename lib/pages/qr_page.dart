import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:swiper_server/helpers/sup.dart';

class QrPage extends StatelessWidget {
  final String id;

  // ignore: prefer_const_constructors_in_immutables
  QrPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: QrImageView(
            data: id,
            version: QrVersions.auto,
            size: 200,
            backgroundColor: Colors.white,
          ),
        ),
        ElevatedButton(
            onPressed: () => {
                  if (SupabaseManager().initialized)
                    {SupabaseManager().insert('pc_info', 'id', id)}
                  else
                    {
                      SupabaseManager().initialize(),
                      SupabaseManager().insert('pc_info', 'id', id)
                    }
                },
            child: const Text('Registrar', style: TextStyle(fontSize: 24)))
      ],
    );
  }
}
