import 'package:flutter/material.dart';
import 'package:skygoal_app/search_screen.dart';
import 'package:skygoal_app/utils/utils.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _MyAppBar(),
      body: _getBody(),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _BottomNavigationIcons(
              icon: Icons.home_rounded,
              hintText: 'Search',
              selected: index == 0,
              onTap: () {
                setState(() {
                  index = 0;
                });
              },
            ),
            _BottomNavigationIcons(
              icon: Icons.bookmark_added_rounded,
              hintText: 'saved',
              selected: index == 1,
              onTap: () {
                setState(() {
                  index = 1;
                });
              },
            ),
            _BottomNavigationIcons(
              icon: Icons.music_video_rounded,
              hintText: 'saved',
              selected: index == 2,
              onTap: () {
                setState(() {
                  index = 2;
                });
              },
            ),
            _BottomNavigationIcons(
              icon: Icons.person_rounded,
              hintText: 'account',
              selected: index == 3,
              onTap: () {
                setState(() {
                  index = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _getBody() {
    switch (index) {
      case 0:
        return const SearchScreen();
      case 1:
        return const Center(child: Text('saved1'));
      case 2:
        return const Center(child: Text('saved2'));
      case 3:
        return const Center(child: Text('account'));
    }
    return const Text('default');
  }
}

class _BottomNavigationIcons extends StatelessWidget {
  const _BottomNavigationIcons({
    super.key,
    required this.icon,
    required this.hintText,
    required this.onTap,
    this.selected = false,
  });

  final String hintText;
  final IconData icon;
  final Function() onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white.withOpacity(selected ? 1 : 0.5),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text(
              hintText,
              style: TextStyle(
                color: Colors.white.withOpacity(selected ? 1 : 0.5),
              ),
            ),
          ),
          if (selected)
            Container(
              width: 80,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3),
              ),
            )
        ],
      ),
    );
  }
}

class _MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      height: kToolbarHeight,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Find your own way',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          Icon(
            Icons.notifications_active,
            color: Colors.white,
            size: 20,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, kToolbarHeight);
}
