import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widgets/custom_progress_hud.dart';
import 'package:fruit_hub/features/checkout/manager/add_order_cubit/add_order_cubit.dart';

class AddOrderCubitBlocbuilder extends StatelessWidget {
  const AddOrderCubitBlocbuilder({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is AddOrderSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تمت إضافة الطلب بنجاح'),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
          isLoading: state is AddOrderLoading ? true : false,
          child: child,
        );
      },
    );
  }
}
