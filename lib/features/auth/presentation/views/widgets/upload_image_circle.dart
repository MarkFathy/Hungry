import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/utils/app_colors.dart';

class UploadImageCircle extends StatelessWidget {
  final File? imageFile;
  final VoidCallback onPressed;
  final VoidCallback? onDelete;

  const UploadImageCircle({
    super.key,
    this.imageFile,
    required this.onPressed,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: 75.r,
          backgroundColor: AppColors.whiteColor,
          backgroundImage: imageFile != null ? FileImage(imageFile!) : null,
        ),
        if (imageFile == null)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.upload_file_outlined,
                  size: 35,
                  color: AppColors.primaryColor,
                ),
              ),
              Text(
                'Upload',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        if (imageFile != null && onDelete != null)
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: onDelete,
              child: CircleAvatar(
                radius: 18.r,
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.close,
                  size: 20.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
