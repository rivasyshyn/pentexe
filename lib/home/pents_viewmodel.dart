import 'package:flutter/material.dart';
import 'package:pentexe/user/user.dart';
import 'package:uuid/uuid.dart';

import 'pent.dart';

class PentsViewModel extends ChangeNotifier {
  List<Pent> pents = List.empty(growable: true);

  getUsers(User user) {}

  getTranding() {}

  getNew() {}

  getAllPents() {
    _clearPents();
    final user = User(const Uuid().v1(), "Test User", "testuser@email.com");
    _add(
        "Pent 0 Anim do velit labore laboris ex enim nostrud officia cupidatat.",
        user);
    _add(
        "Pent 1 Tempor laboris cupidatat sint Lorem incididunt proident reprehenderit culpa ea aliquip consequat.",
        user);
    _add(
        "Pent 2\n\nEa non quis cillum voluptate nulla est cupidatat. Consequat adipisicing ea sint cupidatat occaecat quis elit sit laborum. Anim occaecat laborum culpa laboris qui tempor ut ad cupidatat ut magna. Ex consectetur velit fugiat labore. Elit deserunt dolore qui reprehenderit ullamco eiusmod qui. Proident aliqua sit ut laboris ipsum cupidatat. Sint ea Lorem sit magna deserunt velit adipisicing mollit nostrud exercitation.",
        user);
    _add(
        "Pent 3 Eiusmod culpa irure nostrud eu commodo commodo sunt amet laboris nulla qui ex ea aliqua.",
        user);
    _add(
        "Pent 4 Aliqua non aliquip incididunt duis culpa officia exercitation laboris ad nulla adipisicing in cillum.",
        user);
    _add("Pent 5 Culpa occaecat mollit amet elit.", user);
    _add("Pent 6 Laboris officia commodo velit elit minim ea consequat.", user);
    _add("Pent 7 Qui dolor nulla mollit cillum quis.", user);
    notifyListeners();
  }

  _add(String body, User user) {
    pents.add(Pent.create(body, user));
  }

  _clearPents() {
    pents = List.empty(growable: true);
    notifyListeners();
  }
}
