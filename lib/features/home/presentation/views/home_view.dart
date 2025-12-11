import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/features/home/presentation/widgets/app_header.dart';
import 'package:hungry_app/features/home/presentation/widgets/categories_listview.dart';
import 'package:hungry_app/features/home/presentation/widgets/dummy.dart';
import 'package:hungry_app/features/home/presentation/widgets/search_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categories = [
      CategoryModel(name: "All"),
      CategoryModel(name: "Pizza"),
      CategoryModel(name: "Burgers"),
      CategoryModel(name: "Drinks"),
      CategoryModel(name: "Desserts"),
      CategoryModel(name: "Sandwiches"),
    ];
    return GestureDetector(
      onTap: () =>FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            AppHeader(),
            CustomSearchBar(),
            SizedBox(height: 20.h),
            CategoriesListView(
              categories: categories,
              onCategorySelected: (String value) {},
            ),

            SizedBox(height: 40),
            Card(
              color: AppColors.whiteColor,
              shadowColor: AppColors.darkGreyColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/test.png',
                  width: 150.w,
                  height: 200.h,
                  ),
                  Text('Cheeseburger '),
                  Text('Wendy''s Burger '),
                  

                ],
              ),

            )
          ],
        ),
      ),
    );
  }
}
