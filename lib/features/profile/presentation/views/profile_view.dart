import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hungry_app/core/routes/router_names.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/core/widgets/custom_circular_indicator.dart';
import 'package:hungry_app/features/auth/presentation/views/widgets/auth_text_form_field_widget.dart';
import 'package:hungry_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:hungry_app/features/profile/presentation/views/widgets/profile_action_button.dart';
import 'package:hungry_app/features/profile/presentation/views/widgets/user_profile_image_container.dart';
import 'package:image_picker/image_picker.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }

          // يظهر فقط عند تحديث البيانات
          if (state is ProfileUpdatedSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Profile Updated Successfully")),
            );
          }

          // Logout success
          if (state is LogoutSuccessState) {
            context.pushReplacement(RouterNames.login);
          }

          if (state is LogoutFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<ProfileCubit>();
          final bool isSaving = state is ProfileSavingState;
          final bool isLogoutLoading = state is LogoutLoadingState;

          if (state is ProfileLoadingState && cubit.profileEntity == null) {
            return const Center(child: CustomCircularProgress());
          }

          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Column(
                children: [
                  SizedBox(height: 60.h),

                  UserProfileImageContainer(
  imageUrl: cubit.profileEntity?.image  , 
  onEditTap: cubit.isEditing
      ? () async {
          final ImagePicker picker = ImagePicker();
          final XFile? picked = await picker.pickImage(source: ImageSource.gallery);
          if (picked != null) {
            cubit.pickImage(File(picked.path)); // تحديث الصورة في Cubit
          }
        }
      : null, // غير قابل للتعديل إذا مش في وضع edit
),
                  SizedBox(height: 15.h),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CustomTextField(
                      labelText: 'Name',
                      controller: cubit.nameController,
                      readOnly: !cubit.isEditing || isSaving,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CustomTextField(
                      labelText: 'Email',
                      controller: cubit.emailController,
                      readOnly: true,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CustomTextField(
                      labelText: 'Your address',
                      controller: cubit.addressController,
                      readOnly: !cubit.isEditing || isSaving,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CustomTextField(
                      labelText: 'Password',
                      controller: cubit.passwordController,
                      readOnly: true,
                    ),
                  ),

                  Divider(
                    indent: 20,
                    endIndent: 20,
                    color: AppColors.greyColor,
                    thickness: 1,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: cubit.isEditing
                              ? (isSaving
                                  ? const Center(child: CustomCircularProgress())
                                  : ProfileActionButton(
                                      text: "Save",
                                      icon: Icons.save,
                                      backgroundColor: AppColors.whiteColor,
                                      textColor: AppColors.primaryColor,
                                      iconColor: AppColors.primaryColor,
                                      onTap: () => cubit.saveProfile(),
                                    ))
                              : ProfileActionButton(
                                  text: "Edit Profile",
                                  icon: Icons.edit,
                                  backgroundColor: AppColors.whiteColor,
                                  textColor: AppColors.primaryColor,
                                  iconColor: AppColors.primaryColor,
                                  onTap: () => cubit.toggleEditing(),
                                ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: cubit.isEditing
                              ? ProfileActionButton(
                                  text: "Cancel",
                                  icon: Icons.close,
                                  backgroundColor: AppColors.primaryColor,
                                  textColor: AppColors.whiteColor,
                                  iconColor: AppColors.whiteColor,
                                  borderColor: AppColors.whiteColor,
                                  onTap: isSaving ? () {} : () => cubit.cancelEditing(),
                                )
                              : (isLogoutLoading
                                  ? const Center(child: CustomCircularProgress())
                                  : ProfileActionButton(
                                      text: "Logout",
                                      icon: Icons.logout,
                                      backgroundColor: AppColors.primaryColor,
                                      textColor: AppColors.whiteColor,
                                      iconColor: AppColors.whiteColor,
                                      borderColor: AppColors.whiteColor,
                                      onTap: () => cubit.logout(),
                                    )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
