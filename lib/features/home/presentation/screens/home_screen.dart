import 'package:flutter/material.dart';
import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';
import 'package:sooqy/core/widgets/custom_nav_bar.dart';
import 'package:sooqy/features/cart/presentation/widgets/cart_tab.dart';
import 'package:sooqy/features/categories/presentation/widgets/categories_tab.dart';
import 'package:sooqy/features/home/presentation/widgets/home_tab.dart';
import 'package:sooqy/features/profile/presentation/widgets/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int curPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomButtomNavBar(
        onTap: (value) {
          curPage = value;
          setState(() {});
        },
      ),
      body: SafeArea(
        child: LazyIndexedStack(
          index: curPage,
          children:  [
            HomeTab(),
            CategoriesTab(),
            CartTab(),
            ProfileTab(),
          ],
        ),
      ),
    );
  }
}