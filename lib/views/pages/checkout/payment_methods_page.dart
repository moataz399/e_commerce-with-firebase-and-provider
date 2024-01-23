import 'package:e_commerce/views/widgets/app_text_button.dart';
import 'package:flutter/material.dart';

import '../../../utils/theming/text_styles.dart';
import '../../widgets/check_out/add_new_card_bottom_sheet.dart';

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Methods'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 24.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your payment cards',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16.0),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.credit_card),
                                SizedBox(width: 8.0),
                                Text('**** **** **** 1234'),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16.0),
              AppTextButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (_) {
                        return const AddNewCardBottomSheet();
                      });
                },
                buttonText: 'Add New Card',
                textStyle: TextStyles.font14WhiteMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
