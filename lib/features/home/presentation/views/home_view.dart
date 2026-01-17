import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hungry_app/core/routes/router_names.dart';
import 'package:hungry_app/features/home/presentation/widgets/app_header.dart';
import 'package:hungry_app/features/home/presentation/widgets/card_item.dart';
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    AppHeader(),
                    SizedBox(height: 20.h),
                    CustomSearchBar(),
                    SizedBox(height: 20.h),
                    CategoriesListView(
                      categories: categories,
                      onCategorySelected: (value) {},
                    ),
                  ],
                ),
              ),

              //GridView
              SliverPadding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 6,

                    (context, index) => GestureDetector(
                      onTap: () {
                        context.push(RouterNames.productDetails);
                      },
                      child: CardItem(),
                    ),
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
