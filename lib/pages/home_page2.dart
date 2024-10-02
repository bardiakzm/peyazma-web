import 'package:flutter/material.dart';
import 'package:peyazma_web/resources/consts.dart';
import 'package:peyazma_web/widgets/option_bar.dart';
import 'package:card_swiper/card_swiper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final String navLabel = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OptionBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroBanner(context),
            _buildServicesSection(context),
            _buildWhyChooseUsSection(context),
            _buildClientsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroBanner(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width > 768 ? 130 : 20,
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
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
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'مهندسین مشاور پی آزما کاوان شالوده',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      const Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(5.0, 5.0),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  'ارائه خدمات مهندسی با کیفیت برتر',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white70,
                    shadows: [
                      const Shadow(
                        blurRadius: 8.0,
                        color: Colors.black,
                        offset: Offset(4.0, 4.0),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    // Add action for the button
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'اطلاعات بیشتر',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      color: Colors.grey[100],
      child: Column(
        children: [
          Text(
            'خدمات شرکت پی آزما کاوان شالوده',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.blue[800],
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount =
                  _getServiceGridCrossAxisCount(constraints.maxWidth);
              return GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 30,
                crossAxisSpacing: 30,
                childAspectRatio: 0.8,
                children: [
                  _buildServiceCard(context, 'مقاومت مصالح', 'service4_6.png',
                      'خدمات آزمایشگاهی مقاومت مصالح'),
                  _buildServiceCard(context, 'آزمایش‌های بتن',
                      'service3_1.webp', 'انجام آزمایش‌های کنترل کیفیت بتن'),
                  _buildServiceCard(context, 'آزمایشگاه محلی', 'service2.jpeg',
                      'خدمات آزمایشگاهی در محل پروژه'),
                  _buildServiceCard(context, 'خدمات ژئوتکنیک', 'service1.jpg',
                      'مطالعات و آزمایش‌های ژئوتکنیک'),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildWhyChooseUsSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      color: Colors.green[50],
      child: Column(
        children: [
          Text(
            'چرا شرکت پی آزما کاوان شالوده؟',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.blue[800],
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 30),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                  companyDescriptionText,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        height: 1.8,
                        color: Colors.grey[800],
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClientsSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      color: Colors.grey[100],
      child: Column(
        children: [
          Text(
            'برخی از کارفرمایان ما',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.blue[800],
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            height: 300,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset(
                      'assets/employers/${index + 1}.webp',
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
              autoplay: true,
              autoplayDelay: 3000,
              itemCount: 25,
              pagination: const SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                  activeColor: Colors.blue,
                  color: Colors.grey,
                ),
              ),
              control: const SwiperControl(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, String title, String imagePath,
      String description) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  int _getServiceGridCrossAxisCount(double width) {
    if (width > 1200) return 4;
    if (width > 900) return 3;
    if (width > 600) return 2;
    return 1;
  }
}
