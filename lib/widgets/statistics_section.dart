import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('statistics-section'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.3) {
          // Notify all AnimatedStatCards to start their animations
          statisticsAnimationNotifier.value = true;
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        color: Colors.grey[300],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return constraints.maxWidth > 800
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: _buildStatItems(),
                        )
                      : Column(
                          children: _buildStatItems(),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildStatItems() {
    final stats = [
      {
        'number': 29,
        'label': 'تعداد پرسنل',
        'prefix': '',
      },
      {
        'number': 500,
        'label': 'آزمایش‌های بتن',
        'prefix': '+',
      },
      {
        'number': 59,
        'label': 'آزمایشگاه محلی',
        'prefix': '',
      },
      {
        'number': 350,
        'label': 'مطالعات ژئوتکنیک',
        'prefix': '+',
      },
    ];

    return stats
        .map((stat) => Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: AnimatedStatCard(
                  targetNumber: stat['number'] as int,
                  label: stat['label'] as String,
                  prefix: stat['prefix'] as String,
                ),
              ),
            ))
        .toList();
  }
}

// Global ValueNotifier to coordinate animations across all cards
final ValueNotifier<bool> statisticsAnimationNotifier = ValueNotifier(false);

class AnimatedStatCard extends StatefulWidget {
  final int targetNumber;
  final String label;
  final String prefix;

  const AnimatedStatCard({
    super.key,
    required this.targetNumber,
    required this.label,
    required this.prefix,
  });

  @override
  AnimatedStatCardState createState() => AnimatedStatCardState();
}

class AnimatedStatCardState extends State<AnimatedStatCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0,
      end: widget.targetNumber.toDouble(),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ))
      ..addListener(() {
        setState(() {});
      });

    // Listen to the global animation notifier
    statisticsAnimationNotifier.addListener(_startAnimationIfNotified);
  }

  void _startAnimationIfNotified() {
    if (statisticsAnimationNotifier.value && !_isVisible && mounted) {
      setState(() {
        _isVisible = true;
      });
      _controller.forward();
    }
  }

  @override
  void dispose() {
    statisticsAnimationNotifier.removeListener(_startAnimationIfNotified);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: _isVisible ? 1.0 : 0.0,
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    if (widget.prefix.isNotEmpty)
                      TextSpan(
                        text: widget.prefix,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                        ),
                      ),
                    TextSpan(
                      text: _animation.value.toInt().toString(),
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.label,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
