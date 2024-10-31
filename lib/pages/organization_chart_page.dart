import 'package:flutter/material.dart';
import 'package:peyazma_web/widgets/option_bar.dart';

class OrganizationChart extends StatelessWidget {
  const OrganizationChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF3FB),
      appBar: const OptionBar(),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildBox('مدیر عامل', Colors.amber, 200.0),
                  _buildConnectionLine(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildColumn([
                        _buildBox(
                            'مدیر فنی و اجرائی', Colors.deepOrange, 180.0),
                        _buildConnectionLine(),
                        _buildColumn([
                          _buildBox('سرپرست بخش فنی و آزمایشگاهی', Colors.teal,
                              160.0),
                          _buildConnectionLine(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildBox('تکنسین های آزمایشگاه خاک',
                                  Colors.lightBlue, 140.0),
                              _buildBox(
                                  'تکنسین های آزمایشگاه بتن و مقاومت مصالح',
                                  Colors.lightBlue,
                                  140.0),
                              _buildBox('تکنسین نمونه گیری بتن و مقاومت مصالح',
                                  Colors.lightBlue, 140.0),
                            ],
                          ),
                        ]),
                      ]),
                      _buildBox('', Colors.transparent, 40.0), // Spacer
                      _buildColumn([
                        _buildBox('مدیر اداری، مالی و پشتیبانی',
                            Colors.deepOrange, 180.0),
                        _buildConnectionLine(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildBox('مسئول مالی', Colors.green, 140.0),
                            _buildBox('مسئول اداری', Colors.green, 140.0),
                            _buildBox('مسئول خدمات', Colors.green, 140.0),
                          ],
                        ),
                      ]),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBox(String text, Color color, double width) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'Vazir',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildConnectionLine() {
    return Container(
      width: 2,
      height: 30,
      color: Colors.grey.shade700,
      margin: const EdgeInsets.symmetric(vertical: 8),
    );
  }

  Widget _buildColumn(List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
}
