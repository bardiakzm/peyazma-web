import 'package:flutter/material.dart';
import 'package:peyazma_web/resources/consts.dart';
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
              // Existing banner section
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
                        child: const Text(
                          'اطلاعات بیشتر',
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Existing services section
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
                        _buildServiceCard('مقاومت مصالح', 'service4_6.png', ''),
                        _buildServiceCard(
                            'آزمایش‌های بتن', 'service3_1.webp', ''),
                        _buildServiceCard(
                            'آزمایشگاه محلی', 'service2.jpeg', ''),
                        _buildServiceCard('خدمات ژئوتکنیک', 'service1.jpg', ''),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Add the new sections at the bottom here

              // New Section: "چرا شرکت پی آزما کاوان شالوده؟"
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                color: Colors.green[100],
                child: Column(
                  children: [
                    Text(
                      'چرا شرکت پی آزما کاوان شالوده؟',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.only(left: 120, right: 120),
                      child: Text(
                        companyDescriptionText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, color: Colors.black87, height: 2),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // New Section: "برخی از کارفرمایان ما" (Clients Section)
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                color: Colors.grey[200],
                child: Column(
                  children: [
                    Text(
                      'برخی از کارفرمایان ما',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 150, // Set height for logo grid
                      child: GridView.count(
                        crossAxisCount: 4,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        children: [
                          _buildClientLogo('assets/employers/1.webp'),
                          _buildClientLogo('assets/client2.png'),
                          _buildClientLogo('assets/client3.png'),
                          _buildClientLogo('assets/client4.png'),
                        ],
                      ),
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
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to build client logo
  Widget _buildClientLogo(String logoPath) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          logoPath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
