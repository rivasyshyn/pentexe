import 'package:flutter/material.dart';

import '../home/pent.dart';
import '../user/user.dart';

class EditViewModel extends ChangeNotifier {
  Pent? pent;
  String? error;

  EditViewModel(User user) {
    pent = Pent.create("", user);
  }

  validate() {
    error = "empty error";
    notifyListeners();
  }
}
