import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF151C23),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('تماس با ما', style: TextStyle(color: Colors.white)),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('درباره ما', style: TextStyle(color: Colors.white)),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('اخبار و اطلاعات',
                  style: TextStyle(color: Colors.white)),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('پروژه‌ها', style: TextStyle(color: Colors.white)),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('خدمات ما', style: TextStyle(color: Colors.white)),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('خانه', style: TextStyle(color: Colors.white)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Icon(
                Icons.engineering,
                color: Colors.white,
                size: 50,
              ),
            ), // Placeholder for the logo
          ],
        ),
      ),
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
              child: Text(
                'مهندسین مشاور پی آزما کاوان شالوده', // Use header from the legacy site
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Section below image (Services or Previous Work)
            Text(
              'خدمات شرکت پی آزما کاوان شالوده', // Title for services
              style: TextStyle(
                fontSize: 28,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Service images in grid
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    children: [
                      Image.asset('assets/service1.jpg'), // Service image 1
                      Text('Service 1'), // Service description
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/service2.jpg'), // Service image 2
                      Text('Service 2'), // Service description
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/service3.jpg'), // Service image 3
                      Text('Service 3'), // Service description
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
