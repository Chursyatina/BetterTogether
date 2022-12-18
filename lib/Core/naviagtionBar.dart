import 'package:bettertogether/Core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bettertogether/Core/naviagtionBar.dart';

class HomePageNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;

  const HomePageNavigation(
      {Key? key, required this.currentIndex, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const items = ['assets/icons/day.svg', 'assets/icons/calendar.svg', 'assets/icons/profile.svg'];

    return Theme(
        data: getTheme().copyWith(splashFactory: NoSplash.splashFactory),
        child: NavigationBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          onDestinationSelected: onTap,
          height: 55,
          elevation: 0,
          selectedIndex: currentIndex,
          destinations: items
              .map((e) => NavigationDestination(
            label: '',
            icon: SvgPicture.asset(
              e,
              color: Colors.black
            ),
          ))
              .toList(),
        ));
  }
}
