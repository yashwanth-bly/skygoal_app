import 'package:flutter/material.dart';
import 'package:skygoal_app/core_ui/core_ui.dart';
import 'package:skygoal_app/sort_modal.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SearchTopBar(),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () => _showBottomSheet(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Image.asset('assets/img1.png'),
          ),
        ),
        GestureDetector(
          onTap: () => _showBottomSheet(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Image.asset('assets/img2.png'),
          ),
        ),
        GestureDetector(
          onTap: () => _showBottomSheet(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Image.asset('assets/img3.png'),
          ),
        ),
      ],
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return const SortModal();
    },
  );
}
