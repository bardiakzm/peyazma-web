import 'package:flutter/material.dart';
import 'package:peyazma_web/widgets/option_bar.dart';
import '../resources/bottom_page_information.dart';
import '../widgets/staff_card.dart';

class Staff extends StatelessWidget {
  const Staff({super.key});
  final String navLabel = '/staff';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const OptionBar(),
      body: ListView(children: [
        Container(
          padding: const EdgeInsets.all(24.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 32.0),
                child: SelectableText(
                  textDirection: TextDirection.rtl,
                  'تیم ما',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C3E50),
                  ),
                ),
              ),
              Wrap(
                spacing: 24.0,
                runSpacing: 24.0,
                alignment: WrapAlignment.center,
                children: [
                  StaffCard(
                    imagePath: 'assets/staff/s1.webp',
                    name: 'عطا اله کاظمی ایمن آبادی',
                    title: 'رئیس هیئت مدیره',
                    email: 'atakzm@gmail.com',
                  ),
                  StaffCard(
                    imagePath: 'assets/staff/s2.webp',
                    name: 'مظفر پوریوسفی اباتری',
                    title: 'عضو هییت مدیره',
                    email: '',
                  ),
                  StaffCard(
                    imagePath: 'assets/staff/s3.webp',
                    name: '',
                    title: '',
                    email: '',
                  ),
                  StaffCard(
                    imagePath: 'assets/staff/s4.webp',
                    name: '',
                    title: '',
                    email: '',
                  ),
                  StaffCard(
                    imagePath: 'assets/staff/s5.webp',
                    name: '',
                    title: '',
                    email: '',
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        buildContactDetailsSection(context, Colors.white),
      ]),
    );
  }
}
