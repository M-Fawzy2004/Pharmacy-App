import 'package:pharmacy_app/feature/home/data/model/product_model.dart';

ProductModel getDummyProduct() {
  return ProductModel(
    name: 'اسم المنتج',
    categoryName: 'اسم القسم',
    details: 'تفاصيل المنتج',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdrAp_GM259rL-v-qCOue3bE_9ApmH4N0MQg&s',
    price: 100,
    amountItem: 10,
  );
}

List<ProductModel> getDummyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}
