import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../animations/fade_in.dart';
import '../../../cubit/cart/cart_cubit.dart';

class CartBottomBar extends StatelessWidget {
  final double h;
  final double w;
  final TextEditingController voucherController;
  final double subTotal;
  final double shippingFee;
  final double total;

  const CartBottomBar({
    Key? key,
    required this.h,
    required this.w,
    required this.voucherController,
    required this.subTotal,
    required this.shippingFee,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInAnimation(
      delay: 2,
      child: Container(
        height: h * .23,
        width: w,
        decoration: BoxDecoration(
          color: Colors.deepPurple.withOpacity(.1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: w * .6,
                    height: h * .035,
                    child: TextFormField(
                      controller: voucherController,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        hintText: 'Voucher code',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      try {
                        context
                            .read<CartCubit>()
                            .applyVoucherCode(voucherController.text.trim());
                      } catch (e) {
                        if (kDebugMode) {
                          print(e);
                        }
                      }
                    },
                    child: Container(
                      height: h * .035,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple.withOpacity(.1),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Text(
                                "Apply code",
                                style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Iconsax.tick_circle,
                                color: Colors.deepPurple,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Subtotal",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.deepPurple,
                    ),
                  ),
                  Text(
                    "\$ ${subTotal.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Shipping",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.deepPurple,
                    ),
                  ),
                  Text(
                    "\$ ${shippingFee.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.deepPurple,
                    ),
                  ),
                  Text(
                    "\$ ${total.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: h * .05,
                      width: w * .4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple.withOpacity(.1),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Checkout",
                                style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 16,
                                ),
                              ),
                              Icon(
                                Iconsax.arrow_right_2,
                                color: Colors.deepPurple,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
