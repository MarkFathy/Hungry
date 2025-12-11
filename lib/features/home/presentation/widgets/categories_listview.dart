import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/features/home/presentation/widgets/categories_item.dart';
import 'package:hungry_app/features/home/presentation/widgets/dummy.dart';

class CategoriesListView extends StatelessWidget {
  final List<CategoryModel> categories;
  final ValueChanged<String> onCategorySelected;

  const CategoriesListView({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        height: 50.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () => onCategorySelected(category.name),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: CustomCategoriesListViewItem(name: category.name),
              ),
            );
          },
        ),
      ),
    );
  }
}
