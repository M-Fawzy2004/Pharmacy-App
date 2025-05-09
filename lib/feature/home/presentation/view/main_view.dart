import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/feature/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:pharmacy_app/feature/home/presentation/view/widget/custom_button_navigation_bar.dart';
import 'package:pharmacy_app/feature/home/presentation/view/widget/main_view_bloc_consumer.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routeName = '/main';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (index) {
          currentViewIndex = index;
          setState(() {});
        },
      ),
      body: BlocProvider(
        create: (context) => CartCubit(),
        child: MainViewBlocConsumer(
          currentViewIndex: currentViewIndex,
        ),
      ),
    );
  }
}

