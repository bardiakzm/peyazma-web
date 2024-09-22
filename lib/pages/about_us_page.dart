import 'dart:html';
import 'dart:ui_web';
import 'package:peyazma_web/resources/bottom_page_information.dart';
import 'package:flutter/material.dart';
import 'package:peyazma_web/resources/consts.dart';
import 'package:peyazma_web/widgets/option_bar.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  final String navLabel = '/aboutUsPage';

  @override
  void initState() {
    super.initState();

    // Registering the iframeElement once in initState
    platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => IFrameElement()
        ..style.border = 'none'
        ..src =
            'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3239.9554804073694!2d51.25466741525996!3d35.68798868019381!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMzXCsDQxJzE2LjgiTiA1McKwMTUnMjQuNyJF!5e0!3m2!1sen!2sus!4v1632901234567!5m2!1sen!2sus',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OptionBar(),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue.shade50, Colors.blue.shade100],
            ),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SelectableText(
                        'درباره ما',
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  color: Colors.blue.shade800,
                                  fontWeight: FontWeight.bold,
                                ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      _buildAboutSection(context),
                      const SizedBox(height: 32),
                      _buildMapAndContactSection(context),
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

  Widget _buildAboutSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: SelectableText(
        textDirection: TextDirection.rtl,
        aboutUsText,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 18,
              height: 1.5,
              color: Colors.grey[800],
            ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _buildMapAndContactSection(BuildContext context) {
    return Column(
      children: [
        buildMapSection(context),
        const SizedBox(height: 24),
        buildContactDetailsSection(context),
      ],
    );
  }
}
