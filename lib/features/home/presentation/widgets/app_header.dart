import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/core/utils/app_strings.dart';
import 'package:hungry_app/core/utils/text_style.dart';
import 'package:hungry_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:hungry_app/features/home/presentation/cubit/home_states.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        return Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            top: 55.h,
            right: 20.w,
            bottom: 15.h,
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.appName,
                    style: AppStyles.permanentStyleText(
                      fontSize: 30,
                    ).copyWith(color: AppColors.primaryColor),
                  ),
                  SizedBox(height: 5.h), 
                  Text(
                    cubit.currentUser != null
                        ? "Hello, ${cubit.currentUser!.name}"
                        : "Hello, Guest",
                    style: AppStyles.normalTextBlack(
                      fontSize: 16,
                    ).copyWith(color: AppColors.darkGreyColor),
                  ),
                ],
              ),
              Spacer(),
              ClipOval(
                child: cubit.currentUser?.image != null &&
                        cubit.currentUser!.image!.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: cubit.currentUser!.image!,
                        width: 56.r,
                        height: 56.r,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          width: 56.r,
                          height: 56.r,
                          color: Colors.grey.shade300,
                          child: Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          width: 56.r,
                          height: 56.r,
                          color: Colors.grey.shade300,
                          child: Icon(
                            Icons.person,
                            color: Colors.grey.shade600,
                            size: 28.r,
                          ),
                        ),
                      )
                    : Container(
                        width: 56.r,
                        height: 56.r,
                        color: Colors.grey.shade300,
                        child: Icon(
                          Icons.person,
                          color: Colors.grey.shade600,
                          size: 28.r,
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
