import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart'; // Import the package
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/core/cubit/product_cubit/get_product_cubit.dart';
import 'package:pharmacy_app/feature/home/data/model/product_model.dart';
import 'package:pharmacy_app/feature/home/presentation/view/widget/home_header.dart';
import 'package:pharmacy_app/feature/home/presentation/view/widget/medicine_item_sliver_bloc_builder.dart';
import 'package:pharmacy_app/feature/home/presentation/view/widget/medicine_item_sliver_grid.dart';
import 'package:pharmacy_app/feature/home/presentation/view/widget/offer_item_list.dart';
import 'package:pharmacy_app/feature/home/presentation/view/widget/product_search_field.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final TextEditingController _searchController = TextEditingController();
  List<ProductModel> _filteredProducts = [];
  final PageController _pageController = PageController();
  final RefreshController _refreshController = RefreshController();

  // get product
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().getProduct();
  }

  // dispose
  @override
  void dispose() {
    _searchController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  // Refresh logic
  Future<void> _refresh() async {
    await context.read<ProductCubit>().getProduct();
    setState(() {});
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _refresh,
      enablePullDown: true,
      header: ClassicHeader(
        refreshingText: 'تحديث...',
        completeText: 'تم التحديث بالكامل',
        idleText: 'اسحب لأسفل للتحديث',
        releaseText: 'اسحب للتحديث',
        failedIcon: Icon(Icons.error, color: kBlueColor),
        completeIcon: Icon(Icons.done, color: kBlueColor),
        idleIcon: Icon(Icons.arrow_downward, color: kBlueColor),
        releaseIcon: Icon(Icons.refresh, color: kBlueColor),
        refreshingIcon: const CupertinoActivityIndicator(),
      ),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: HomeHeader(
              title: 'الرئيسية',
              isCart: true,
            ),
          ),
          // sized box
          SliverToBoxAdapter(
            child: SizedBox(
              height: screenHeight * 0.02,
            ),
          ),
          // search field
          SliverToBoxAdapter(
            child: ProductSearchField(
              controller: _searchController,
              onProductsFiltered: (products) {
                setState(() {
                  _filteredProducts = products;
                });
              },
            ),
          ),
          // sized box
          SliverToBoxAdapter(
            child: SizedBox(
              height: screenHeight * 0.025,
            ),
          ),
          // offer
          if (_filteredProducts.isEmpty && _searchController.text.isEmpty) ...[
            SliverToBoxAdapter(
              child: OfferItemList(pageController: _pageController),
            ), // sized box
            SliverToBoxAdapter(
              child: SizedBox(
                height: screenHeight * 0.02,
              ),
            ),
            SliverToBoxAdapter(
              child: Align(
                alignment: Alignment.center,
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 2,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: kBlueColor,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
              ),
            ),
          ],
          // sized box
          SliverToBoxAdapter(
            child: SizedBox(height: screenHeight * 0.01),
          ),
          // medicine
          if (_filteredProducts.isNotEmpty) ...[
            MedicineItemSliverGrid(product: _filteredProducts),
          ] else ...[
            MedicineItemSliverBlocBuilder(),
          ],
        ],
      ),
    );
  }
}
