import 'package:e_commerce/models/delivery_method.dart';
import 'package:flutter/material.dart';

class DeliveryMethodItem extends StatelessWidget {
  final DeliveryMethodModel deliveryMethodModel;

  const DeliveryMethodItem({
    Key? key,
    required this.deliveryMethodModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.network(
            deliveryMethodModel.imgUrl,
            fit: BoxFit.cover,
            height: 40,
          ),
          const SizedBox(height: 6.0),
          Text(
            '${deliveryMethodModel.days} days',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ]),
      ),
    );
  }
}
