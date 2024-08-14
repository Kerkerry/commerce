import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/log_helper.dart';
import '../../../orders/presentation/bloc/orders_bloc.dart';
import '../../../orders/presentation/screens/order_scree.dart';
import '../../domain/entities/user.dart';
import '../screens/users_screen.dart';
import 'drawer_item_section.dart';
import 'drawer_profile_section.dart';

class AppDrawerWidget extends StatelessWidget {
  const AppDrawerWidget({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double h = size.height;
    final double w = size.width;
    return Drawer(
      width: w * 0.6,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h * 0.06,
            ),
            DrawerProfileSectionWidget(user: user),
            Divider(
              height: h * 0.05,
              thickness: 1.3,
            ),
            DrawerItemSectionWidget(
                title: "Cart",
                iconData: Icons.trolley,
                onTap: () {
                  logger.e("Cart");
                }),
            BlocConsumer<OrdersBloc, OrdersState>(
              listener: (context, state) {
                if (state is OrdersErrorState) {
                  logger.e(state.message);
                }

                if (state is OrderLoadedState) {
                  logger.e("This is orders list tile navigation");
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OrderScreen(order: state.order)));
                }
              },
              builder: (context, state) {
                return DrawerItemSectionWidget(
                    title: "Orders",
                    iconData: Icons.credit_score_sharp,
                    onTap: () {
                      context.read<OrdersBloc>().add(GetOrderEvent(user.id));
                    });
              },
            ),
            DrawerItemSectionWidget(
                title: "Favorite", iconData: Icons.favorite, onTap: () {}),
            DrawerItemSectionWidget(
                title: "Pending order", iconData: Icons.warning, onTap: () {}),
            DrawerItemSectionWidget(
                title: "Wishlist", iconData: Icons.list, onTap: () {}),
            DrawerItemSectionWidget(
                title: "Setting", iconData: Icons.text_snippet, onTap: () {}),
            DrawerItemSectionWidget(
              title: "All users",
              iconData: Icons.people,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UsersScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
