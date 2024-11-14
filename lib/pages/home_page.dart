import 'package:flutter/material.dart';
import 'package:peyazma_web/resources/consts.dart';
import 'package:peyazma_web/widgets/option_bar.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:peyazma_web/widgets/image_placeholder.dart';
import 'package:peyazma_web/widgets/features_section.dart';
import 'package:peyazma_web/widgets/statistics_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  final String navLabel = '/';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    statisticsAnimationNotifier.value = false;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final mainImagePlaceholder = ImageWidgetPlaceholderWithImageProvider(
      image: const AssetImage('assets/main/main_image.webp'),
      placeholder: Container(color: Colors.grey[300]),
    );
    SwiperPlugin buildPagination() {
      if (screenWidth < 600) {
        return FractionPaginationBuilder(
          color: Colors.grey[300],
          activeColor: Colors.blue[400],
          fontSize: screenWidth < 600 ? 8.0 : 10.0,
          activeFontSize: screenWidth < 600 ? 10.0 : 12.0,
        );
      }
      return DotSwiperPaginationBuilder(
        color: Colors.grey[300],
        activeColor: Colors.blue[400],
        size: screenWidth < 600 ? 8.0 : 10.0,
        activeSize: screenWidth < 600 ? 10.0 : 12.0,
        space: 5.0,
      );
    }

    final ScrollController scrollController = ScrollController();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: const OptionBar(),
      body: ListView(
        controller: scrollController,
        children: [
          Column(
            children: [
              // Banner section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.084),
                child: Container(
                  height: screenWidth < 600 ? 300 : 440,
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
                      Text(
                        'مهندسین مشاور پی آزما کاوان شالوده',
                        style: TextStyle(
                          fontSize: screenWidth < 600 ? 24 : 36,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: const [
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
                          scrollController.animateTo(
                            scrollController.position.maxScrollExtent,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth < 600 ? 20 : 30,
                            vertical: screenWidth < 600 ? 10 : 15,
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
                padding: EdgeInsets.symmetric(
                  vertical: screenWidth * 0.026,
                  horizontal: screenWidth * 0.013,
                ),
                color: Colors.grey[300],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'خدمات شرکت پی آزما کاوان شالوده',
                      style: TextStyle(
                        fontSize: screenWidth < 600 ? 24 : 28,
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: screenWidth < 600
                          ? 1600
                          : screenWidth < 900
                              ? 1000
                              : 300,
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        alignment: WrapAlignment.center,
                        children: [
                          _buildResponsiveCard(screenWidth, 'مقاومت مصالح',
                              'assets/main/service4_6.png', ''),
                          _buildResponsiveCard(screenWidth, 'آزمایش‌های بتن',
                              'assets/main/service3_1.webp', ''),
                          _buildResponsiveCard(screenWidth, 'آزمایشگاه محلی',
                              'assets/main/service2.jpeg', ''),
                          _buildResponsiveCard(screenWidth, 'خدمات ژئوتکنیک',
                              'assets/main/service1.jpg', ''),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 50,
              // ),
              // Why Choose Us section
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: screenWidth * 0.026,
                  horizontal: screenWidth * 0.013,
                ),
                color: Colors.grey[300],
                child: Column(
                  children: [
                    SelectableText(
                      'چرا شرکت پی آزما کاوان شالوده؟',
                      style: TextStyle(
                        fontSize: screenWidth < 600 ? 24 : 28,
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth < 600
                            ? 20
                            : screenWidth < 900
                                ? 60
                                : 120,
                      ),
                      child: SelectableText(
                        companyDescriptionText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenWidth < 600 ? 16 : 20,
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
                width: double.infinity,
                color: Colors.grey[300],
                padding: EdgeInsets.symmetric(
                  vertical: screenWidth < 600 ? 20 : 40,
                  horizontal: screenWidth < 600 ? 10 : 20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth < 600 ? 10 : 20,
                      ),
                      child: SelectableText(
                        'برخی از کارفرمایان ما',
                        style: TextStyle(
                          fontSize: screenWidth < 600 ? 24 : 28,
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: screenWidth < 600 ? 300 : 400,
                      ),
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
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
                                        'assets/employers/${index + 1}.webp',
                                      ),
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
                            ),
                          );
                        },
                        autoplay: true,
                        autoplayDelay: 5000,
                        duration: 800,
                        itemCount: 25,
                        scale: 0.95,
                        viewportFraction: screenWidth < 600 ? 0.9 : 0.8,
                        pagination: SwiperPagination(
                          margin: const EdgeInsets.only(bottom: 30),
                          builder: buildPagination(),
                        ),
                        control: SwiperControl(
                          color: Colors.blue[400],
                          disableColor: Colors.grey[300],
                          padding: EdgeInsets.all(screenWidth < 600 ? 10 : 20),
                          iconPrevious: Icons.arrow_back_ios_rounded,
                          iconNext: Icons.arrow_forward_ios_rounded,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const FeaturesSection(),
              const StatisticsSection(),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildResponsiveCard(
    double screenWidth,
    String title,
    String imagePath,
    String description,
  ) {
    final imagePlaceholder = ImageWidgetPlaceholderWithImageProvider(
      image: AssetImage(imagePath),
      placeholder: Container(color: Colors.grey[300]),
    );

    double cardWidth = screenWidth < 600
        ? screenWidth * 0.8
        : screenWidth < 900
            ? screenWidth * 0.8
            : screenWidth * 0.23;
    double cardHeight = cardWidth * 0.95;
    return SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              child: SizedBox(
                height: cardHeight * 0.85,
                child: Image(
                  image: imagePlaceholder.imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: screenWidth < 600 ? 16 : 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (description.isNotEmpty) ...[
                    // const SizedBox(height: 5),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenWidth < 600 ? 12 : 14,
                      ),
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // )
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
