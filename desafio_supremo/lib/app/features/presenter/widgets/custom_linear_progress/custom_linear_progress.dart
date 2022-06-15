import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/ui/ui.dart';

class CustomLinearProgress extends StatelessWidget {
  const CustomLinearProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: const Center(
        child: LinearProgressIndicator(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
