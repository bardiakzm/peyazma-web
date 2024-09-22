import 'package:flutter/material.dart';
import 'package:peyazma_web/widgets/option_bar.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});
  final String navLabel = '/contactUs';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const OptionBar(),
        body: Container(
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 500, right: 500),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 40, right: 40, top: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: Text(
                                'تماس با ما',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(1.0),
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                  'برای ارتباط با ما از درگاه های زیر اقدام نمایید:')
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
