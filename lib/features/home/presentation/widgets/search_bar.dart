import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/auth/presentation/views/widgets/auth_text_form_field_widget.dart';
import 'package:hungry_app/features/home/presentation/cubit/home_cubit.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomTextField(
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search),
        controller: cubit.searchController,
        onChanged: (value) {
          cubit.onSearchChanged(value);
        },
      ),
    );
  }
}
