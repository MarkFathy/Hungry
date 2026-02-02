import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/features/home/domain/entity/category.dart';
import 'package:hungry_app/features/home/presentation/widgets/categories_item.dart';

class CategoriesListView extends StatelessWidget {
  final List<CategoryEntity> categories;
  final int selectedCategoryId;
  final ValueChanged<CategoryEntity> onCategorySelected;

  const CategoriesListView({
    super.key,
    required this.categories,
    required this.selectedCategoryId,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        height: 55.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          separatorBuilder: (_, __) => const SizedBox(width: 10),
          itemBuilder: (context, index) {
            final category = categories[index];

            final isAll = category.id == -1;
            final isSelected = selectedCategoryId == category.id;

            return GestureDetector(
              onTap: () => onCategorySelected(category),
              child: CustomCategoriesListViewItem(
                name: category.name,
                isAll: isAll,
                isSelected: isSelected,
              ),
            );
          },
        ),
      ),
    );
  }
}
