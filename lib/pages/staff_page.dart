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
                textDirection: TextDirection.rtl,
                spacing: 24.0,
                runSpacing: 24.0,
                alignment: WrapAlignment.center,
                children: [
                  StaffCard(
                    imagePath: 'assets/staff/s1.webp',
                    name: 'عطا اله کاظمی ایمن آبادی',
                    degree: 'دکتری ژئومورفولوژی', // Add degree here
                    title: 'مدیر عامل و رئیس هیئت مدیره',
                    email: 'atakzm@gmail.com',
                  ),
                  StaffCard(
                    imagePath: 'assets/staff/s2.webp',
                    name: 'مظفر پوریوسفی اباتری',
                    degree: 'کارشناسی مهندسی عمران', // Add degree here
                    title: 'عضو هیئت مدیره و مدیر اجرایی',
                    email: 'pouryousefi.mozafar@gmail.com',
                  ),
                  StaffCard(
                    imagePath: 'assets/staff/s3.webp',
                    name: 'سجاد کریمی',
                    degree: 'کارشناسی مهندسی عمران',
                    title: 'کارشناس فنی پروژه ها',
                    email: 'sajjad.karimi.gh@gmail.com',
                  ),
                  StaffCard(
                    imagePath: 'assets/staff/s4.webp',
                    name: 'عاطفه صافی',
                    degree: 'کارشناسی ارشد مهندسی عمران خاک -پی',
                    title: 'مدیر فنی',
                    email: 'safii.1373@gmail.com',
                  ),
                  StaffCard(
                    imagePath: 'assets/staff/s5.webp',
                    name: 'فتانه اکبرزاده',
                    degree: 'کارشناسی شیمی',
                    title: 'کارشناس فنی ازمایشگاه',
                    email: '@gmail.com',
                  ),
                  StaffCard(
                    imagePath: 'assets/staff/s6.webp',
                    name: 'ابوالفضل فرهاد کیایی',
                    degree: 'کارشناسی زمین شناسی',
                    title: 'کارشناس فنی',
                    email: 'abolfazlkiaei615@gmail.com',
                  ),
                  StaffCard(
                    imagePath: 'assets/staff/s7.webp',
                    name: 'اصغر صفرپور',
                    degree: 'کارشناسی ارشد مهندسی عمران',
                    title: 'کارشناس فنی پروژه ها',
                    email: 'safarpour1359@gmail.com',
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
