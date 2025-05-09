import 'package:flutter/material.dart';
import 'package:pharmacy_app/feature/home/data/model/bottom_naviagtion.dart';
import 'package:pharmacy_app/feature/home/presentation/view/widget/active_item.dart';
import 'package:pharmacy_app/feature/home/presentation/view/widget/in_active_item.dart';

class NaivgationBarItem extends StatelessWidget {
  const NaivgationBarItem({
    super.key,
    required this.isSelected,
    required this.bottomNavigationBarEntity,
  });

  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            image: bottomNavigationBarEntity.activeImage,
            text: bottomNavigationBarEntity.name,
          )
        : InActiveItem(
            image: bottomNavigationBarEntity.inActiveImage,
          );
  }
}
