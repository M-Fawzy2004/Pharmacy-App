import 'package:pharmacy_app/core/utils/assets.dart';

class BottomNavigationBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  BottomNavigationBarEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.name,
  });
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
      BottomNavigationBarEntity(
        activeImage: Assets.imagesHome,
        inActiveImage: Assets.imagesHome,
        name: 'الرئيسية',
      ),
      BottomNavigationBarEntity(
        activeImage: Assets.imagesSearchIcon,
        inActiveImage: Assets.imagesSearchIcon,
        name: 'التصنيفات',
      ),
      BottomNavigationBarEntity(
        activeImage: Assets.imagesOrder,
        inActiveImage: Assets.imagesOrder,
        name: 'الطلبات',
      ),
      BottomNavigationBarEntity(
        activeImage: Assets.imagesIconamoonProfileLight,
        inActiveImage: Assets.imagesIconamoonProfileLight,
        name: 'الحساب',
      ),
    ];
