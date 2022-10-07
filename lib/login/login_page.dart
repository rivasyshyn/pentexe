import 'package:flutter/material.dart';
import 'package:pentexe/home/home_page.dart';
import 'package:pentexe/login/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.watch<AuthViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Pentexe"),
        ),
      ),
      body: _body(context, authViewModel),
    );
  }

  Widget _body(BuildContext context, AuthViewModel authViewModel) {
    if (authViewModel.isLogged == null) {
      // progress view
      return const Center(
        child: RefreshProgressIndicator(
          value: null,
        ),
      );
    }
    if (authViewModel.isLogged == true) {
      // logged view
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Logged as ${authViewModel.user?.displayName}"),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => _onContinuePressed(context),
                child: const Text("Continue")),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
                onPressed: () => _onLogoutPressed(authViewModel),
                child: const Text("Logout")),
          ],
        ),
      );
    } else {
      // login view
      return Center(
        child: ElevatedButton(
          onPressed: () => authViewModel.logInWithGoogle(),
          child: const Text("Login with Google"),
        ),
      );
    }
  }

  _onContinuePressed(BuildContext context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
  }

  _onLogoutPressed(AuthViewModel authViewModel) {
    authViewModel.logout();
  }
}
