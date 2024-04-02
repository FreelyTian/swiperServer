import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseManager {
  late bool initialized = false;

  Future<bool> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Supabase.initialize(
      url: 'URL',
      anonKey: 'KEY',
    );
    if (initialized == false) {
      initialized = true;
      return true;
    } else {
      return true;
    }
  }

  void insert(String table, String column, dynamic value) async {
    final supabase = Supabase.instance.client;
    final maybeOldId =
        await supabase.from(table).select(column).eq(column, value);
    var response = maybeOldId.singleOrNull ?? "[]";
    if (response == '[]') {
      await supabase.from(table).insert({column: value});
    }
  }
}
