import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AboutCollege extends StatelessWidget {
  const AboutCollege({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> userList = [
      'assets/user1.png',
      'assets/user2.png',
      'assets/user3.png',
      'assets/user4.png',
    ];
    return ListView(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 50),
      shrinkWrap: true,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 16, bottom: 10),
          child: Text(
            'Description:',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
        const Text(
          'This is not an image.This is not an image. '
          'Every Thing in this container is created separately.'
          'This is not an image.This is not an image. '
          'Every Thing in this container is created separately.',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),

        const Padding(
          padding: EdgeInsets.only(top: 20.0, bottom: 10),
          child: Text(
            'Location:',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
        // SizedBox(height: 10,),
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          child: Image.asset(
            'assets/location.png',
            fit: BoxFit.fitWidth,
            width: double.maxFinite,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20.0, bottom: 10),
          child: Text(
            'Student Reviews',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
        SizedBox(
          height: 70,
          child: ListView.separated(
            itemCount: userList.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(right: 50),
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 10,
              );
            },
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
                child: Image.asset(
                  userList[index],
                  fit: BoxFit.fill,
                  width: 80,
                  height: 60,
                ),
              );
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          height: 160,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 12,
                color: Color.fromRGBO(0, 0, 0, 0.16),
              )
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Arun Sai',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
                const Text(
                  'This is not an image.This is not an image. '
                  'Every Thing in this container is created separately.'
                  'This is not an image.This is not an image. '
                  'Every Thing in this container is created separately.',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                ),
                RatingBarIndicator(
                  rating: 4.5,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 30.0,
                  direction: Axis.horizontal,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
