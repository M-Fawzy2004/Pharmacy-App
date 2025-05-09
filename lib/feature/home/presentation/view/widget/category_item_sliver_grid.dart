import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/assets.dart';
import 'package:pharmacy_app/feature/home/presentation/view/widget/category_item.dart';

class CategoryItemSliverGrid extends StatelessWidget {
  const CategoryItemSliverGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisExtent: 120,
      ),
      itemCount: categoryName.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CategoryItem(
            name: categoryName[index],
            image: images[index],
          ),
        );
      },
    );
  }
}

List<String> categoryName = [
  'البرد والإنفلونزا',
  'تسكين الألم',
  'الفيتامينات والمكملات الغذائية',
  'صحة الجهاز الهضمي',
  'العناية بالبشرة',
  'المضادات الحيوية',
  'الحساسية',
  'صحة العظام والمفاصل',
  'صحة القلب والأوعية الدموية',
  'العناية الشخصية',
];

List<String> images = [
  Assets.imagesCategory1,
  Assets.imagesCategory2,
  Assets.imagesCategory3,
  Assets.imagesCategory4,
  Assets.imagesCategory5,
  Assets.imagesCategory6,
  Assets.imagesCategory7,
  Assets.imagesCategory8,
  Assets.imagesCategory9,
  Assets.imagesCategory10,
];
