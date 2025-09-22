// drawer_widget.dart
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'saved_devices_screen.dart';
import 'privacy_policy_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 172,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.blueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center, // голлуулж байна
                children: [
                  Image.asset('assets/endlesslogo.png', height: 60),
                  // Text-ийг авч хаясан
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text("Нэвтрэх"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.devices),
            title: const Text("Хадгалсан төхөөрөмжүүд"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const SavedDevicesScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text("Нууцлалын бодлого"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
