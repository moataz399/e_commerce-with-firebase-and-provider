import 'package:e_commerce/controllers/database_controller.dart';
import 'package:e_commerce/utils/helpers/extensions.dart';
import 'package:e_commerce/views/widgets/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../models/shipping_address.dart';
import '../../utils/arguments/add_shipping_address_args.dart';
import '../../utils/routing/routes.dart';
import '../../utils/theming/text_styles.dart';
import '../widgets/check_out/shipping_address_state_item.dart';

class ShippingAddressesPage extends StatelessWidget {
  const ShippingAddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.9,
        backgroundColor: Colors.white,
        title: Text(
          'Shipping Addresses',
          style: TextStyles.font18BlackRegular,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
          child: Column(
            children: [
              StreamBuilder<List<ShippingAddressModel>>(
                  stream: database.getShippingAddresses(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      final shippingAddresses = snapshot.data;
                      if (shippingAddresses != null &&
                          shippingAddresses.isNotEmpty) {
                        return SizedBox(
                          child: ListView.builder(
                              itemCount: shippingAddresses.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (_, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ShippingAddressStateItem(
                                    database: database,
                                    shippingAdress: shippingAddresses[index],
                                  ),
                                );
                              }),
                        );
                      }
                      return const Center(
                        child: Text("there is no data"),
                      );
                    }
                    return const LoadingPage();
                  })
            ],
          ),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(Routes.addShippingAddressPage,
              arguments: AddShippingAddressArgs(database: database));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
