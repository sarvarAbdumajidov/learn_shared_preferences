import 'package:flutter/material.dart';
import 'package:learn_shared_preferences/model/user_model.dart';
import 'package:learn_shared_preferences/service/log_service.dart';
import 'package:learn_shared_preferences/service/prefs_service.dart';
import 'package:learn_shared_preferences/service/secure_service.dart';
import 'package:logger/logger.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // var user = User('7', 'sarvar@gmail.com', '1904');
    // PrefService.storeUser(user);
    // PrefService.loadUser().then((v) => {LogService.i(v! .toJson().toString())});
    SecureService.storeApiKey('AIzaSyDaGmWKa4JsXZ-HjGw7ISLn_3namBGewQe');
    SecureService.loadApiKey().then((value) => LogService.w(value!));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
