import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'connect_disconnect_screen.dart';
import 'drawer_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _adminController = TextEditingController();
  final TextEditingController _deviceController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  void _login() async {
    final admin = _adminController.text.trim();
    final device = _deviceController.text.trim();

    if (admin.isEmpty || device.isEmpty) {
      setState(
        () => _errorMessage = "Админ болон төхөөрөмжийн дугаарыг оруулна уу!",
      );
      return;
    }

    setState(() {
      _errorMessage = null;
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 1));
    setState(() => _isLoading = false);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('admin_number', admin);
    List<String> devices = prefs.getStringList('saved_devices') ?? [];
    if (!devices.contains(device)) {
      devices.add(device);
      await prefs.setStringList('saved_devices', devices);
    }

    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            ConnectDisconnectScreen(adminNumber: admin, deviceNumber: device),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(title: const Text("Нэвтрэх"), centerTitle: true),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEFEFEF), Color(0xFF1976D2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/HalfSimix.png',
                  height: 150,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _adminController,
                  decoration: InputDecoration(
                    labelText: 'Админ дугаар',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white70,
                  ),
                  maxLength: 8,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _deviceController,
                  decoration: InputDecoration(
                    labelText: 'Төхөөрөмжийн дугаар',
                    prefixIcon: const Icon(Icons.devices),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white70,
                  ),
                  maxLength: 8,
                ),
                const SizedBox(height: 10),
                if (_errorMessage != null)
                  Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Icon(Icons.login),
                    label: const Text(
                      'Нэвтрэх',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: _isLoading ? null : _login,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
