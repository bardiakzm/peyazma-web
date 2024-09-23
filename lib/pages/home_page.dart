import 'package:flutter/material.dart';
import 'package:peyazma_web/widgets/option_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final String navLabel = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OptionBar(), // Using the custom OptionBar widget
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Banner image section with improved background
              Padding(
                padding: const EdgeInsets.only(left: 130, right: 130),
                child: Container(
                  height: 440,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 15,
                        spreadRadius: 5,
                        offset: const Offset(0, 10),
                      ),
                    ],
                    image: DecorationImage(
                      image: const AssetImage('main_image.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.4),
                        BlendMode.darken,
                      ),
                    ),
                    gradient: const LinearGradient(
                      colors: [Colors.black26, Colors.black54],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'مهندسین مشاور پی آزما کاوان شالوده',
                        style: TextStyle(
                          fontSize: 36,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black,
                              offset: Offset(5.0, 5.0),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Add action for the button
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                        ),
                        child: const Text('اطلاعات بیشتر'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Services section with refined layout
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                color: Colors.grey[300],
                child: Column(
                  children: [
                    Text(
                      'خدمات شرکت پی آزما کاوان شالوده',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    GridView.count(
                      crossAxisCount: 4,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      children: [
                        _buildServiceCard(
                            'خدمت ۱', 'service4_6.png', 'توضیحات خدمت ۱'),
                        _buildServiceCard(
                            'خدمت ۲', 'service3.png', 'توضیحات خدمت ۲'),
                        _buildServiceCard(
                            'خدمت ۳', 'service2.jpeg', 'توضیحات خدمت ۳'),
                        _buildServiceCard(
                            'خدمت ۴', 'service1.jpg', 'توضیحات خدمت ۴'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build service card
  Widget _buildServiceCard(String title, String imagePath, String description) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      shadowColor: Colors.black.withOpacity(0.3),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
