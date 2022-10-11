import 'package:flutter/material.dart';

import '../../models/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String home = 'Home Page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.pink.shade50,
          ),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'Its\'s turn X',
                style: TextStyle(
                  color: MyTheme.red,
                  fontSize: 65,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                flex: 2,
                child: GridView.count(
                  crossAxisCount: 3,
                  children: List.generate(
                    9,
                    (index) => Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 5,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 5,
                              ),
                              // color: MyTheme.red,
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 35),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
