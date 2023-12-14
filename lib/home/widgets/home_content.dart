import 'package:flutter/material.dart';
import 'package:ylham_motors_ui/ylham_motors_ui.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: BannerAdsSlider(
            imageUrls: [
              "https://images.unsplash.com/photo-1590845947670-c009801ffa74?q=80&w=1459&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              "https://plus.unsplash.com/premium_photo-1670934158407-d2009128cb02?q=80&w=1460&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              "https://images.unsplash.com/photo-1614850715649-1d0106293bd1?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            ],
          ),
        ),
        ProductGrid(
          productsLength: 10,
        ),
      ],
    );
  }
}
