import 'package:flutter/material.dart';
import 'package:peyazma_web/widgets/option_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final String navLabel = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OptionBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner image section
            Container(
              height: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/company_image.jpg'), // Use your image here
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.center,
              child: const Text(
                'مهندسین مشاور پی آزما کاوان شالوده', // Use header from the legacy site
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Section below image (Services or Previous Work)
            const Text(
              'خدمات شرکت پی آزما کاوان شالوده', // Title for services
              style: TextStyle(
                fontSize: 28,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Service images in grid
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    children: [
                      Image.asset('assets/service1.jpg'), // Service image 1
                      const Text('Service 1'), // Service description
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/service2.jpg'), // Service image 2
                      const Text('Service 2'), // Service description
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/service3.jpg'), // Service image 3
                      const Text('Service 3'), // Service description
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
