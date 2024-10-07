import 'package:flutter/material.dart';
import 'package:peyazma_web/widgets/option_bar.dart';
import 'package:peyazma_web/resources/consts.dart';
import 'package:peyazma_web/widgets/image_placeholder.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OptionBar(),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue.shade50,
                Colors.blue.shade100,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Column(
                    children: [
                      _buildHeader(context),
                      const SizedBox(height: 60),
                      _buildServiceSection(
                        context: context,
                        title: 'مطالعات ژئوتکنیک',
                        description: researchsText,
                        imagePath: 'service1.jpg',
                        isReversed: true,
                      ),
                      const SizedBox(height: 80),
                      _buildServiceSection(
                        context: context,
                        title: 'کنترل کیفی بتن',
                        description: qualityControlText,
                        imagePath: 'service2_1.webp',
                        isReversed: false,
                      ),
                      const SizedBox(height: 80),
                      _buildGallery(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SelectableText(
            'خدمات ما',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Colors.blue.shade900,
                  fontWeight: FontWeight.w800,
                  fontSize: 40,
                ),
          ),
          const SizedBox(height: 16),
          SelectableText(
            'ارائه خدمات با کیفیت و تخصصی در حوزه ژئوتکنیک و مصالح ساختمانی',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey.shade600,
                  fontSize: 18,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceSection({
    required BuildContext context,
    required String title,
    required String description,
    required String imagePath,
    required bool isReversed,
  }) {
    final content = [
      Expanded(
        child: Container(
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.blue.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
              ),
              const SizedBox(height: 16),
              SelectableText(
                description,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey.shade700,
                      height: 1.7,
                      fontSize: 16,
                    ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(width: 40),
      Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: ImageWidgetPlaceholder(
            fit: BoxFit.fill,
            image: AssetImage(imagePath),
            placeholder: const CircularProgressIndicator(),
          ),
        ),
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 768) {
          return Row(
            children: isReversed ? content.reversed.toList() : content,
          );
        } else {
          return Column(
            children: [
              content[1],
              const SizedBox(height: 24),
              content[0],
            ],
          );
        }
      },
    );
  }

  Widget _buildGallery(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'گالری تصاویر',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
          ),
          const SizedBox(height: 24),
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 4, // Reduce spacing between images
            runSpacing: 4,
            children: List.generate(
              15,
              (index) => Container(
                width: 120, // Square frame size
                height: 120, // Ensure the same height for a square aspect
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: FittedBox(
                  fit: BoxFit.cover, // Ensures the image fills the container
                  child: ImageWidgetPlaceholder(
                    image: AssetImage('assets/lab_images/l${index + 2}.webp'),
                    placeholder: const Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                    fit: BoxFit.cover, // This is essential to crop and fill
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
