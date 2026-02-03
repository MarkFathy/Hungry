import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
     color: Colors.grey,  
     thickness: 1,        
     indent: 0,           
     endIndent: 0,        
     height: 20.h,        
    );
  }
}
