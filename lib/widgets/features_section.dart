import 'package:flutter/material.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        // color: Colors.lightBlue[50],
        color: Colors.grey[300],
      ),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      // color: Colors.grey[300],

      child: Column(
        children: [
          Text(
            'ویژگی های شرکت',
            style: TextStyle(
              fontSize: 28,
              color: Colors.blue[800],
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'آنچه که ما را از دیگران متفاوت می کند',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return constraints.maxWidth > 800
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _buildFeatureItems(),
                      )
                    : Column(children: _buildFeatureItems());
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildFeatureItems() {
    final features = [
      {
        'icon': Icons.update,
        'title': 'تجهیزات به روز',
        'description':
            'سیاست شرکت پی آزما کاوان شالوده در بخش تحقیق و توسعه خود آن است که همواره از به روزترین تجهیزات به منظور ارائه هرچه بهتر و سریعتر خدمات خود استفاده نمایند.'
      },
      {
        'icon': Icons.speed,
        'title': 'سرعت انجام خدمات',
        'description':
            'با داشتن تجهیزات متنوع و به روز و کادر فنی و اجرایی مناسب، این شرکت توانایی این را دارد که در سریعترین زمان ممکن، نسبت به انجام حفاری ژئوتکنیک و آزمایش‌های کنترل کیفی خدمات ارائه دهد.'
      },
      {
        'icon': Icons.verified,
        'title': 'کیفیت انجام خدمات',
        'description':
            'شرکت پی آزما کاوان شالوده با توجه به دانش فنی اعضای خود و استفاده از آخرین استانداردهای ملی و همچنین بین‌المللی نسبت به ارائه خدمات در زمینه حفاری، ژئوتکنیک و مقاومت مصالح برای ارائه باکیفیت‌ترین خدمات استفاده می‌کند.'
      },
    ];

    return features
        .map((feature) => Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Icon(
                          feature['icon'] as IconData,
                          size: 50,
                          color: Colors.blue[800],
                        ),
                        const SizedBox(height: 15),
                        SelectableText(
                          textDirection: TextDirection.rtl,
                          feature['title'] as String,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        SelectableText(
                          textDirection: TextDirection.rtl,
                          feature['description'] as String,
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ))
        .toList();
  }
}
