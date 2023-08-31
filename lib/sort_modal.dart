import 'package:flutter/material.dart';
import 'package:skygoal_app/college_list_page.dart';
import 'package:skygoal_app/utils/app_colors.dart';

class SortModal extends StatefulWidget {
  const SortModal({super.key});

  @override
  State<SortModal> createState() => _SortModalState();
}

class _SortModalState extends State<SortModal> {
  int index = -1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Sort by',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          _SortTile(
            title: 'Bachelor of Technology',
            logo: Icons.school_rounded,
            selected: index == 0,
            onTap: () => _sortSelected(0),
          ),
          _SortTile(
            title: 'Bachelor of Architecture',
            logo: Icons.architecture_rounded,
            selected: index == 1,
            onTap: () => _sortSelected(1),
          ),
          _SortTile(
            title: 'Pharmacy',
            logo: Icons.local_pharmacy_rounded,
            selected: index == 2,
            onTap: () => _sortSelected(2),
          ),
          _SortTile(
            title: 'Law',
            logo: Icons.balance_rounded,
            selected: index == 3,
            onTap: () => _sortSelected(3),
          ),
          _SortTile(
            title: 'Management',
            logo: Icons.manage_accounts_rounded,
            selected: index == 4,
            onTap: () => _sortSelected(4),
          )
        ],
      ),
    );
  }

  _sortSelected(int i) async {
    setState(() {
      index = i;
    });
    Navigator.pop;
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CollegeListPage()),
      );
    });
  }
}

class _SortTile extends StatelessWidget {
  const _SortTile({
    required this.title,
    required this.logo,
    this.selected = false,
    required this.onTap,
  });
  final String title;
  final IconData logo;
  final bool selected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(
              logo,
              size: 18,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            const Spacer(),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 4,
                  color: AppColors.primary,
                ),
              ),
              child: selected
                  ? Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
                      ),
                    )
                  : null,
            )
          ],
        ),
      ),
    );
  }
}
