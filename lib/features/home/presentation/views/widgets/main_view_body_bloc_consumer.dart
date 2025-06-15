import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/home/presentation/cubits/favorite_cubit/favorite_cubit.dart';

import 'package:fruit_hub/features/home/presentation/views/widgets/main_view_body.dart';
import 'package:fruit_hub/main.dart';

class MainViewBodyBlocConsumer extends StatefulWidget {
  const MainViewBodyBlocConsumer({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  State<MainViewBodyBlocConsumer> createState() =>
      _MainViewBodyBlocConsumerState();
}

class _MainViewBodyBlocConsumerState extends State<MainViewBodyBlocConsumer>
    with RouteAware {
   void didChangeDependencies() {
    super.didChangeDependencies();
   final route = ModalRoute.of(context);
if (route is PageRoute) {
  routeObserver.subscribe(this, route);
}

  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  // 👇 ده بيتنفذ لما ترجع من صفحة تانية زي Favorites
  @override
  void didPopNext() {
    context.read<FavoritesCubit>().loadFavorites();
    super.didPopNext();
  }
 

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('تم إضافة المنتج إلى السلة'),
            ),
          );
        }
        if (state is CartItemRemoved) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text('تم إزالة المنتج من السلة'),
            ),
          );
        }
      },
      child: MainViewBody(currentViewIndex: widget.currentViewIndex),
    );
  }
}
