import 'package:flutter/material.dart';
import 'package:pentexe/create/edit_viewmodel.dart';
import 'package:pentexe/login/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class CreatePage extends StatelessWidget {
  CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      floatingActionButton: _submitButton(context),
      body: _body(context),
    );
  }

  final _appBar = AppBar(
    title: const Center(
      child: Text("New Pentexe"),
    ),
  );

  _submitButton(BuildContext context) => FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.check),
      );

  Widget _body(BuildContext context) {
    final user = context.watch<AuthViewModel>().user!;
    return ChangeNotifierProvider(
      create: (context) => EditViewModel(user),
      builder: (context, child) {
        final editViewModel = context.watch<EditViewModel>();
        return const Center(
          child: Text("Empty Page"),
        );
      },
    );
  }
}
