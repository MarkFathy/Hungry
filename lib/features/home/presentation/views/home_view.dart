import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hungry_app/core/routes/router_names.dart';
import 'package:hungry_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:hungry_app/features/home/presentation/cubit/home_states.dart';
import 'package:hungry_app/features/home/presentation/widgets/app_header.dart';
import 'package:hungry_app/features/home/presentation/widgets/card_item.dart';
import 'package:hungry_app/features/home/presentation/widgets/categories_listview.dart';
import 'package:hungry_app/features/home/presentation/widgets/categories_shimmer.dart';
import 'package:hungry_app/features/home/presentation/widgets/product_card_shimmer.dart';
import 'package:hungry_app/features/home/presentation/widgets/search_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Header + Search + Categories
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const AppHeader(),
                  SizedBox(height: 20.h),
                  const CustomSearchBar(),
                  SizedBox(height: 20.h),
                  BlocBuilder<HomeCubit, HomeStates>(
                    buildWhen: (prev, curr) =>
                        curr is CategoryLoadingState ||
                        curr is CategorySuccessState ||
                        curr is CategoryFailureState ||
                        curr is CategorySelectedState,
                    builder: (context, state) {
                      if (state is CategoryLoadingState || state is HomeInitial) {
                        return const CategoriesShimmer();
                      }
                      if (state is CategoryFailureState) {
                        return Center(
                          child: Text(
                            state.message,
                            style: TextStyle(color: Colors.red, fontSize: 16.sp),
                          ),
                        );
                      }
                      if (cubit.categories.isEmpty) {
                        return const CategoriesShimmer();
                      }

                      return CategoriesListView(
                        categories: cubit.categories,
                        selectedCategoryId: cubit.selectedCategoryId,
                        onCategorySelected: (cat) {
                          cubit.selectCategory(cat.id);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),

            // Products
            BlocBuilder<HomeCubit, HomeStates>(
              buildWhen: (prev, curr) =>
                  curr is ProductsLoadingState ||
                  curr is ProductsSuccessState ||
                  curr is ProductsFailureState,
              builder: (context, state) {
                // Loading
                if (state is ProductsLoadingState) {
                  return const SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    sliver: ProductsGridShimmer(),
                  );
                }

                // Error
                if (state is ProductsFailureState) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        state.message,
                        style: TextStyle(color: Colors.red, fontSize: 16.sp),
                      ),
                    ),
                  );
                }

                // Empty result
                if (cubit.filteredProducts.isEmpty) {
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(top: 40.h),
                      child: Center(
                        child: Text(
                          "No products found",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  );
                }

                // Grid
                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final product = cubit.filteredProducts[index];
                        return GestureDetector(
                          onTap: () {
                           context.push(RouterNames.productDetails, extra: product);

                          },
                          child: CardItem(
                            product: product,
                            isFavorite: cubit.favoriteIds.contains(product.id),
                            onFavoriteToggle: () {
                              cubit.toggleFavoriteLocal(product.id);
                            },
                          ),
                        );
                      },
                      childCount: cubit.filteredProducts.length,
                    ),
                  ),
                );
              },
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
          ],
        ),
      ),
    );
  }
}
