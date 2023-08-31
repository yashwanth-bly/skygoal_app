import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skygoal_app/college_details/bloc/bloc.dart';
import 'package:skygoal_app/college_details/views/about_college.dart';
import 'package:skygoal_app/college_details/views/events_page.dart';
import 'package:skygoal_app/college_details/views/hostel_facilities.dart';
import 'package:skygoal_app/college_details/views/q_and_a_page.dart';
import 'package:skygoal_app/utils/app_colors.dart';

class CollegeDetailsPage extends StatelessWidget {
  const CollegeDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TabSelectionCubit>(
      create: (context) => TabSelectionCubit(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: AppColors.primary,
          // actions: [
          //   Container(
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(40),
          //         color: Colors.blue),
          //     child: const Padding(
          //       padding: EdgeInsets.all(3),
          //       child: Icon(
          //         Icons.bookmark_border_rounded,
          //         size: 24,
          //       ),
          //     ),
          //   )
          // ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                snap: false,
                pinned: true,
                elevation: 0,
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.primary,
                expandedHeight: kToolbarHeight,
                collapsedHeight: kToolbarHeight,
                actions: const [
                  SizedBox(),
                ],
                centerTitle: true,
                title: const Text(
                  'GHJK Engineering college',
                  style: TextStyle(color: Colors.white),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.none,
                  background: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          margin: const EdgeInsets.only(left: 16),
                          padding: const EdgeInsets.all(3),
                          child: const Icon(
                            Icons.arrow_back,
                            size: 24,
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        margin: const EdgeInsets.only(right: 16),
                        padding: const EdgeInsets.all(3),
                        child: const Icon(
                          Icons.bookmark_border_rounded,
                          size: 24,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverAppBar(
                floating: true,
                snap: true,
                elevation: 0,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                expandedHeight: kToolbarHeight + 200,
                collapsedHeight: kToolbarHeight,
                actions: const [
                  SizedBox(),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: _FloatingHeader(),
                ),
              ),
              SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                actions: const [
                  SizedBox(),
                ],
                expandedHeight: 46,
                collapsedHeight: 46,
                toolbarHeight: 46,
                flexibleSpace: _TabBar(),
              )
            ];
          },
          body: Column(
            children: [
              Expanded(
                child: BlocBuilder<TabSelectionCubit, TabSelectionState>(
                  builder: (context, state) {
                    if (state.selectedTab == CollegeTab.about) {
                      return const AboutCollege();
                    }
                    if (state.selectedTab == CollegeTab.hostel) {
                      return HostelFacilities();
                    }
                    if (state.selectedTab == CollegeTab.qa) {
                      return const QandAPage();
                    }
                    if (state.selectedTab == CollegeTab.events) {
                      return const EventsPage();
                    }
                    return const SizedBox();
                  },
                ),
              ),
              Container(
                width: double.maxFinite,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // <-- Radius
                    ),
                    backgroundColor: AppColors.primary,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Apply',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _FloatingHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/college.png',
          fit: BoxFit.fitWidth,
          width: double.maxFinite,
          height: 150,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
          child: Row(
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
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.green),
                child: const Column(
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
              ),
            ],
          ),
        ),
        const Flexible(
          child: Padding(
            padding: EdgeInsets.only(left: 8.0, right: 6),
            child: Text(
              'This is not an image.This is not an image. '
              'Every Thing in this container is created separately.'
              'This is not an image.This is not an image. '
              'Every Thing in this container is created separately.',
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w600,
                color: AppColors.greyColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      background: BlocBuilder<TabSelectionCubit, TabSelectionState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _TabTile(
                hintText: 'About College',
                onTap: () => _onTabSelected(
                  context: context,
                  tab: CollegeTab.about,
                ),
                selected: state.selectedTab == CollegeTab.about,
              ),
              _TabTile(
                hintText: 'Hostel facility',
                onTap: () => _onTabSelected(
                  context: context,
                  tab: CollegeTab.hostel,
                ),
                selected: state.selectedTab == CollegeTab.hostel,
              ),
              _TabTile(
                hintText: 'Q & A',
                onTap: () => _onTabSelected(
                  context: context,
                  tab: CollegeTab.qa,
                ),
                selected: state.selectedTab == CollegeTab.qa,
              ),
              _TabTile(
                hintText: 'Events',
                onTap: () => _onTabSelected(
                  context: context,
                  tab: CollegeTab.events,
                ),
                selected: state.selectedTab == CollegeTab.events,
              ),
            ],
          );
        },
      ),
    );
  }

  void _onTabSelected({
    required BuildContext context,
    required CollegeTab tab,
  }) {
    context.read<TabSelectionCubit>().update(tab);
  }
}

class _TabTile extends StatelessWidget {
  const _TabTile({
    required this.hintText,
    required this.onTap,
    this.selected = false,
  });

  final String hintText;
  final Function() onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              hintText,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(selected ? 1 : 0.8),
              ),
            ),
          ),
          if (selected)
            Container(
              width: 80,
              height: 6,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(3),
              ),
            )
        ],
      ),
    );
  }
}
