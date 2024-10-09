import 'package:flutter/material.dart';
import 'package:peyazma_web/resources/consts.dart';
import 'package:peyazma_web/widgets/option_bar.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:peyazma_web/widgets/image_placeholder.dart';
import 'package:peyazma_web/widgets/features_section.dart';
import 'package:peyazma_web/widgets/statistics_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final String navLabel = '/';

  @override
  Widget build(BuildContext context) {
    final mainImagePlaceholder = ImageWidgetPlaceholderWithImageProvider(
      image: const AssetImage('assets/main/main_image.webp'),
      placeholder: Container(color: Colors.grey[300]),
    );
    final ScrollController _scrollController = ScrollController();
    return Scaffold(
      appBar: const OptionBar(),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              // Banner section
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
                      image: mainImagePlaceholder.imageProvider,
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
                          _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut,
                          );
                          // Navigator.pushNamed(context, '/services');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
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

              // Services section
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
                    SizedBox(
                      height: 400,
                      child: GridView.count(
                        crossAxisCount: 4,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        children: [
                          _buildServiceCard(
                              'مقاومت مصالح', 'assets/main/service4_6.png', ''),
                          _buildServiceCard('آزمایش‌های بتن',
                              'assets/main/service3_1.webp', ''),
                          _buildServiceCard('آزمایشگاه محلی',
                              'assets/main/service2.jpeg', ''),
                          _buildServiceCard(
                              'خدمات ژئوتکنیک', 'assets/main/service1.jpg', ''),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // const SizedBox(height: 40),

              // Why Choose Us section
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                // color: Colors.green[100],
                // color: Colors.lightBlue[50],
                color: Colors.grey[300],
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
                          fontSize: 20,
                          color: Colors.black87,
                          height: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Clients section
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                color: Colors.grey[300],
                // color: Colors.lightBlue[50],
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
                    // const SizedBox(height: 20),
                    SizedBox(
                      height: 400, // Increased from 280
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8), // Slightly increased margin
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  ImageWidgetPlaceholderWithImageProvider(
                                    image: AssetImage(
                                        'assets/employers/${index + 1}.webp'),
                                    placeholder: Container(
                                      color: Colors.grey[50],
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.blue[300],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.blue[300]!.withOpacity(0.5),
                                          Colors.transparent,
                                        ],
                                        stops: const [0.0, 0.7],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        autoplay: true,
                        autoplayDelay: 5000,
                        duration: 800,
                        itemCount: 25,
                        scale: 0.95, // Slightly increased scale
                        viewportFraction: 0.8,
                        pagination: SwiperPagination(
                          margin: const EdgeInsets.only(
                              bottom: 30), // Increased margin
                          builder: DotSwiperPaginationBuilder(
                            color: Colors.grey[300],
                            activeColor: Colors.blue[400],
                            size: 10.0, // Slightly larger dots
                            activeSize: 12.0,
                            space: 5.0,
                          ),
                        ),
                        control: SwiperControl(
                          color: Colors.blue[400],
                          disableColor: Colors.grey[300],
                          padding:
                              const EdgeInsets.all(20), // Increased padding
                          iconPrevious:
                              Icons.arrow_back_ios_rounded, // More modern icons
                          iconNext: Icons.arrow_forward_ios_rounded,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 20),
              const FeaturesSection(),
              // const SizedBox(
              //   height: 10,
              // ),
              const StatisticsSection(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard(String title, String imagePath, String description) {
    final imagePlaceholder = ImageWidgetPlaceholderWithImageProvider(
      image: AssetImage(imagePath),
      placeholder: Container(color: Colors.grey[300]),
    );

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image(
                image: imagePlaceholder.imageProvider,
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
                if (description.isNotEmpty) ...[
                  const SizedBox(height: 5),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
