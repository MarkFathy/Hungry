import 'package:flutter/material.dart';
import 'package:hungry_app/features/auth/presentation/views/widgets/auth_text_form_field_widget.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
           padding: const EdgeInsets.only(left:10,right: 10),
           child: CustomTextField(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
           ),
         );
  }
}