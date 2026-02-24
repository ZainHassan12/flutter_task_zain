// In your home_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_task_zain/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBlue,
        elevation: 0,
        toolbarHeight: 120, // Increased height to accommodate the ellipse
        flexibleSpace: Stack(
          children: [
            // Position the ellipse in center of app bar
            Positioned(
              left: 0,
              right: 0,
              top: 20, // Adjust this value to position vertically
              child: Center(
                child: Container(
                  width: 60, // Adjust size as per design
                  height: 60, // Adjust size as per design
                  decoration: BoxDecoration(
                    color: greenAccent,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            // You can add title or other widgets here
            Positioned(
              bottom: 16,
              left: 16,
              child: Text(
                'Home', // Replace with your title
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: white,
        // Your body content here
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
