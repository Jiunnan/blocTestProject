import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vtuberlist/resources/app_color.dart';

class NavBar extends StatelessWidget {

  final int pageIndex;
  final Function(int) onTap;

  NavBar({super.key, required this.pageIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 0,
      ),
      child: BottomAppBar(
        elevation: 0.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: Container(
            decoration: BoxDecoration(
              color: APPColor.color0xFF4CAF50,
            ),
            height: 60,
            child: Row(
              children: [
                _bottomNavigationItem(
                    Icons.home,
                    pageIndex == 0,
                    onTap: () => onTap(0)
                ),
                _bottomNavigationItem(
                    Icons.person,
                    pageIndex == 1,
                    onTap: () => onTap(1)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomNavigationItem(IconData icon, bool selected, {Function()? onTap}) {
    return Expanded(child:
        InkWell(
          onTap: onTap,
          child: Icon(
            icon,
            color: selected ? APPColor.color0xFF448AFF : APPColor.color0x4DFFFFFF,
            size: 40,
          ),
        )
    );
  }
}