import 'package:flutter_bloc/flutter_bloc.dart';
import '../../database/db_helper.dart';

abstract class CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<Map<String, dynamic>> allData;
  final bool isVoucherApplied;
  final double voucherCode;
  final double shippingFee;

  CartLoaded({
    this.allData = const [],
    this.isVoucherApplied = false,
    this.voucherCode = 0,
    this.shippingFee = 8.22,
  });

  CartLoaded copyWith({
    List<Map<String, dynamic>>? allData,
    bool? isVoucherApplied,
    double? voucherCode,
    double? shippingFee,
    double? delayAmount,
  }) {
    return CartLoaded(
      allData: allData ?? this.allData,
      isVoucherApplied: isVoucherApplied ?? this.isVoucherApplied,
      voucherCode: voucherCode ?? this.voucherCode,
      shippingFee: shippingFee ?? this.shippingFee,
    );
  }
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartLoaded(allData: [], isVoucherApplied: false, voucherCode: 0));

  void refreshData() async {
    final data = await SQLHealper.getAllData();
    emit((state as CartLoaded).copyWith(allData: data));
  }

  Future<void> updateData(int id, String count) async {
    await SQLHealper.updateData(id, int.parse(count));
    refreshData();
  }

  Future<void> deleteData(int id) async {
    await SQLHealper.deleteData(id);
    refreshData();
  }

  void applyVoucherCode(String code) {
    if (code.trim() == 'CALCODE' && !(state as CartLoaded).isVoucherApplied) {
      emit((state as CartLoaded).copyWith(voucherCode: 10, isVoucherApplied: true));
    } else {
      emit((state as CartLoaded).copyWith(voucherCode: 0, isVoucherApplied: false));
    }
  }

  double subTotal() {
    double total = 0;
    for (int i = 0; i < (state as CartLoaded).allData.length; i++) {
      total += double.parse((state as CartLoaded).allData[i]['price']) * (state as CartLoaded).allData[i]['count'];
    }
    return total;
  }

  double total() {
    double subTotal = this.subTotal();
    if (subTotal == 0) {
      return 0;
    } else {
      return subTotal + (state as CartLoaded).shippingFee - (state as CartLoaded).voucherCode;
    }
  }
}