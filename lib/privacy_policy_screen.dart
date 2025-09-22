import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Нууцлалын бодлого")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Simix App-ийн Нууцлалын бодлого",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Үргэлжилж эхэлсэн өдөр: 2025-09-09",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 16),

            Text(
              "1. Цуглуулдаг мэдээлэл",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              "• Төхөөрөмжийн дугаар & Админ дугаар: Та эдгээр дугаарыг оруулснаар төхөөрөмжөө удирдах боломжтой болно.",
            ),
            Text(
              "• SMS харилцан үйлдэл: Апп таны төхөөрөмж рүү команд илгээнэ (#01#0# залгах, #02#0# салгах).",
            ),
            Text(
              "• Нэвтрэх түүх: Апп төхөөрөмж, админ дугаарыг таны төхөөрөмжид хадгалж, дахин оруулах шаардлагагүй болгоно.",
            ),
            SizedBox(height: 16),

            Text(
              "2. Мэдээллийг хэрхэн ашиглах вэ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text("• Төхөөрөмжүүдээ холбох, удирдах."),
            Text("• Апп-д таны төхөөрөмж болон админ дугаарыг харуулах."),
            Text("• Апп-ын ажиллагааг сайжруулах."),
            SizedBox(height: 16),

            Text(
              "3. Мэдээлэл хадгалах",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              "• Бүх төхөөрөмж/админ дугаар, нэвтрэх түүх нь таны төхөөрөмж дээр хадгалагдана.",
            ),
            Text("• Гадны байгууллагад мэдээлэл хуваалцахгүй."),
            SizedBox(height: 16),

            Text(
              "4. Зөвшөөрөл (Permissions)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              "• SMS зөвшөөрөл: Төхөөрөмж рүү команд илгээхэд шаардлагатай.",
            ),
            Text(
              "• Интернет зөвшөөрөл: Апп шинэчлэх, нэмэлт функцийг ашиглахад шаардлагатай.",
            ),
            SizedBox(height: 16),

            Text(
              "5. Гадны үйлчилгээ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              "• Бид хувийн мэдээлэл цуглуулах гадны үйлчилгээ ашигладаггүй.",
            ),
            SizedBox(height: 16),

            Text(
              "6. Хүүхдийн нууцлал",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text("• Simix апп 13-аас доош насны хүүхдэд зориулагдаагүй."),
            Text("• Бид хүүхдээс санаатайгаар хувийн мэдээлэл цуглуулдаггүй."),
            SizedBox(height: 16),

            Text(
              "7. Нууцлалын бодлого өөрчлөгдөх",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              "• Энэхүү бодлого үе үе шинэчлэгдэх боломжтой. Шинэчилсэн бодлого апп-д болон энд харагдана.",
            ),
            SizedBox(height: 16),

            Text(
              "8. Холбогдох",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              "• Нууцлалын бодлого, асуулттай холбоотой бол: sumiyabayr@iek.mn хаягаар холбогдоно уу.",
            ),
          ],
        ),
      ),
    );
  }
}
