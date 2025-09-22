import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ConnectDisconnectScreen extends StatelessWidget {
  final String adminNumber;
  final String deviceNumber;

  const ConnectDisconnectScreen({
    super.key,
    required this.adminNumber,
    required this.deviceNumber,
  });

  /// SMS илгээх функц
  Future<void> sendSms(String number, String message) async {
    final Uri smsUri = Uri(
      scheme: 'sms',
      path: number,
      queryParameters: {'body': message},
    );

    try {
      if (await canLaunchUrl(smsUri)) {
        await launchUrl(smsUri, mode: LaunchMode.externalApplication);
      } else {
        print("Emulator does not support SMS: $smsUri");
      }
    } catch (e) {
      print("Error launching SMS: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Залгах / Салгах"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Админ ба төхөөрөмжийн мэдээлэл card-д
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Төхөөрөмжийн дугаар
                    Text(
                      "Төхөөрөмжийн дугаар",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(
                          Icons.developer_board,
                          size: 28,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          deviceNumber,
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Админ дугаар
                    Text(
                      "Админ дугаар",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(
                          Icons.person,
                          size: 28,
                          color: Colors.orange,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          adminNumber,
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Залгах товч
            ElevatedButton.icon(
              onPressed: () => sendSms(deviceNumber, "#01#0#"),
              icon: const Icon(Icons.power),
              label: const Text("Залгах"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),

            // Салгах товч
            ElevatedButton.icon(
              onPressed: () => sendSms(deviceNumber, "#02#0#"),
              icon: const Icon(Icons.power_off),
              label: const Text("Салгах"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 14),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
