import 'package:flutter/material.dart';
import 'package:yum_health/data/temporary_data.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.resep}) : super(key: key);
  static const routeName = '/detail_page';

  final Resep? resep;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: size.width * (2 / 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage(resep!.imageAsset),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      left: size.width * (1 / 40),
                      top: size.width * (1 / 40),
                      child: CircleAvatar(
                        backgroundColor: Colors.black.withOpacity(0.8),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
