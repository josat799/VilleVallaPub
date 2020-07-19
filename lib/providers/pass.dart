import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vvp/providers/user.dart';

class Pass {
  final String id;
  List<User> workers = [];
  List<User> chief = [];
  DateTime date;
  List<User> flaggedWorkers = [];
  String title;
  String info;
  DateTime startTime;
  DateTime endTime;

  Pass({
    @required this.id,
    this.workers,
    this.chief,
    this.date,
    this.flaggedWorkers,
    this.title,
    this.info,
    this.startTime,
    this.endTime,
  });
}

class BookablePass extends ChangeNotifier {
  List<Pass> availablePass = [
    Pass(id: DateTime.now().toString(), title: DateTime.now().toString()),
    Pass(id: DateTime.now().toString(), title: DateTime.now().toString()),
    Pass(id: DateTime.now().toString(), title: DateTime.now().toString()),
    Pass(id: DateTime.now().toString(), title: DateTime.now().toString()),
    Pass(id: DateTime.now().toString(), title: DateTime.now().toString()),
    Pass(id: DateTime.now().toString(), title: DateTime.now().toString()),


  ];

  void addPass(Pass pass) {
    availablePass.add(pass);
    notifyListeners();
  }

  List<Pass> get allPass {
    return availablePass;
  }
}
