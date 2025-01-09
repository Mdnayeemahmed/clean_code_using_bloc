import 'package:bloc_clean_coding/config/routes/routes_name.dart';
import 'package:bloc_clean_coding/services/storage/local_storage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> logout(BuildContext context) async {
    LocalStorage localStorage=LocalStorage();
    // Clear user data and login status
    await localStorage.clearAll();

    // Navigate to Login Screen (replace 'LoginScreen' with your login screen widget)
    Navigator.pushNamed(context, RoutesName.loginScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              // Show confirmation dialog before logging out
              final shouldLogout = await showDialog<bool>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Logout"),
                    content: const Text("Are you sure you want to logout?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text("Logout"),
                      ),
                    ],
                  );
                },
              );

              if (shouldLogout == true) {
                await logout(context);
              }
            },
          ),
        ],
      ),
      body: const Center(
        child: Text("Welcome to Home Screen"),
      ),
    );
  }
}