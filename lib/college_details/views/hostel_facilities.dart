import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HostelFacilities extends StatelessWidget {
  HostelFacilities({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding:
          const EdgeInsets.only(left: 10.0, right: 10, top: 20, bottom: 10),
      children: [
        const _ImageSlider(),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'GHJK ENGINEERING COLLEGE',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.green),
              child: const Row(
                children: [
                  Text(
                    '4.3 ',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                  Icon(
                    Icons.star,
                    size: 16,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
        const Row(
          children: [
            Icon(
              Icons.location_pin,
              size: 18,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur ',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'This is not an image.This is not an image. '
          'Every Thing in this container is created separately.'
          'This is not an image.This is not an image. '
          'Every Thing in this container is created separately.'
          'This is not an image.This is not an image. '
          'Every Thing in this container is created separately.',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 16, bottom: 10),
          child: Text(
            'Facilities',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
        const Row(
          children: [
            Icon(
              Icons.room_preferences_rounded,
              size: 18,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'College in 400mtrs',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        const Row(
          children: [
            Icon(
              Icons.shower_rounded,
              size: 18,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Bathrooms : 2',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ImageSlider extends StatefulWidget {
  const _ImageSlider({super.key});

  @override
  State<_ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<_ImageSlider> {
  late final CarouselController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Add Dot Indicator
    return SizedBox(
        height: 150,
        child: CarouselSlider(
          options: CarouselOptions(viewportFraction: 0.5),
          carouselController: _controller,
          items: imgList
              .map((item) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Image.network(item, fit: BoxFit.cover, width: 1000),
                  ))
              .toList(),
        ));
  }

  static final List<String> imgList = [
    'https://picsum.photos/200',
    'https://picsum.photos/300',
    'https://picsum.photos/400',
    'https://picsum.photos/500',
    'https://picsum.photos/600',
  ];

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(item, fit: BoxFit.cover, width: 100.0)),
          ))
      .toList();
}
