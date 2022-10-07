import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pentexe/create/create_page.dart';
import 'package:pentexe/home/pents_viewmodel.dart';
import 'package:provider/provider.dart';

import '../components/pent_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final minCardWidth = 350;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PentsViewModel()..getAllPents(),
        builder: (context, chield) => Scaffold(
              appBar: _appBar(),
              floatingActionButton: _addButton(context),
              body: _body(context),
            ));
  }

  AppBar _appBar() {
    return AppBar(
      title: const Center(
        child: Text("Pentexe"),
      ),
      actions: [Center(child: _userActionItem())],
    );
  }

  Widget _userActionItem() {
    return MaterialButton(
      onPressed: () {},
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      shape: const CircleBorder(),
      child: const Text("R I"),
    );
  }

  _addButton(BuildContext context) => FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreatePage(),
              ));
        },
        child: const Icon(Icons.add),
      );

  Widget _body(BuildContext context) {
    var columns = (MediaQuery.of(context).size.width / minCardWidth).floor();
    if (columns == 0) {
      columns = 1;
    }

    return SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        scrollDirection: Axis.vertical,
        child: StaggeredGrid.count(
            crossAxisCount: columns,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              ...context
                  .watch<PentsViewModel>()
                  .pents
                  .map((pent) => PentWidget(pent))
            ]));
  }
}
