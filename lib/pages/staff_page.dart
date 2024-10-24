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
                    imagePath: 'staff/s1.webp',
                    name: 'عطا اله کاظمی',
                    title: 'مدیرعامل',
                    email: 'ata.kazemi@example.com',
                  ),
                  StaffCard(
                    imagePath: 'staff/s2.webp',
                    name: 'عطا اله کاظمی',
                    title: 'مدیر فنی',
                    email: 'mohammad.ahmadi@example.com',
                  ),
                  StaffCard(
                    imagePath: 'staff/s2.webp',
                    name: 'عطا اله کاظمی',
                    title: 'مدیر فنی',
                    email: 'mohammad.ahmadi@example.com',
                  ),
                  StaffCard(
                    imagePath: 'staff/s2.webp',
                    name: 'عطا اله کاظمی',
                    title: 'مدیر فنی',
                    email: 'mohammad.ahmadi@example.com',
                  ),
                  StaffCard(
                    imagePath: 'staff/s2.webp',
                    name: 'عطا اله کاظمی',
                    title: 'مدیر فنی',
                    email: 'mohammad.ahmadi@example.com',
                  ),
                  StaffCard(
                    imagePath: 'staff/s2.webp',
                    name: 'عطا اله کاظمی',
                    title: 'مدیر فنی',
                    email: 'mohammad.ahmadi@example.com',
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
