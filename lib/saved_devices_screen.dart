import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'connect_disconnect_screen.dart';
import 'drawer_widget.dart';

class SavedDevicesScreen extends StatefulWidget {
  const SavedDevicesScreen({super.key});

  @override
  State<SavedDevicesScreen> createState() => _SavedDevicesScreenState();
}

class _SavedDevicesScreenState extends State<SavedDevicesScreen> {
  List<String> _devices = [];
  String _admin = "";

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _devices = prefs.getStringList('saved_devices') ?? [];
      _admin = prefs.getString('admin_number') ?? "Unknown";
    });
  }

  Future<void> _removeDevice(String device) async {
    final prefs = await SharedPreferences.getInstance();
    _devices.remove(device);
    await prefs.setStringList('saved_devices', _devices);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text("Хадгалсан төхөөрөмжүүд"),
        centerTitle: true,
      ),
      body: _devices.isEmpty
          ? const Center(
              child: Text(
                "Хадгалсан төхөөрөмж алга байна.",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: _devices.length,
              itemBuilder: (context, index) {
                final device = _devices[index];
                return ListTile(
                  title: Text(device),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _removeDevice(device),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ConnectDisconnectScreen(
                          adminNumber: _admin,
                          deviceNumber: device,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
