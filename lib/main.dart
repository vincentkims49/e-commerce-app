import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'src/cubit/bottom_bar/bottom_bar.dart';
import 'src/cubit/cart/cart_cubit.dart';
import 'src/cubit/category/category_cubit.dart';
import 'src/cubit/product/products/products_cubit.dart';
import 'src/cubit/product/sorted_products/sorted_products_cubit.dart';
import 'src/screens/page_root.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryCubit()..fetchCategories(),
        ),
        BlocProvider(
          create: (context) => ProductsCubit()..fetchProducts(),
        ),
        BlocProvider(
          create: (context) => SortedProductsCubit()..fetchSortedProducts(),
        ),
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit()..refreshData(),
        ),
      ],
      child: MaterialApp(
        title: 'Funiture Store',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
        home: const PageRoot(),
      ),
    );
  }
}
