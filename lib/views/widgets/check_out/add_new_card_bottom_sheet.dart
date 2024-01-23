import 'package:e_commerce/utils/theming/text_styles.dart';
import 'package:e_commerce/views/widgets/app_text_button.dart';
import 'package:flutter/material.dart';

class AddNewCardBottomSheet extends StatefulWidget {
  const AddNewCardBottomSheet({super.key});

  @override
  State<AddNewCardBottomSheet> createState() => _AddNewCardBottomSheetState();
}

class _AddNewCardBottomSheetState extends State<AddNewCardBottomSheet> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameOnCardController,
      _expireDateController,
      _cardNumberController,
      _cvvController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _nameOnCardController = TextEditingController();
    _expireDateController = TextEditingController();
    _cardNumberController = TextEditingController();
    _cvvController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.7,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 24.0),
            Text(
              'Add New Card',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: TextFormField(
                controller: _nameOnCardController,
                keyboardType: TextInputType.name,
                validator: (value) => value != null && value.isEmpty
                    ? 'Please enter your name'
                    : null,
                decoration: const InputDecoration(
                  labelText: 'Name on Card',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: TextFormField(
                controller: _cardNumberController,
                validator: (value) => value != null && value.isEmpty
                    ? 'Please enter your card number'
                    : null,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  String newValue = value.replaceAll('-', '');
                  if (newValue.length % 4 == 0 && newValue.length < 16) {
                    _cardNumberController.text += '-';
                  }
                  if (value.length >= 20) {
                    _cardNumberController.text = value.substring(0, 19);
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Card Number',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: TextFormField(
                controller: _expireDateController,
                validator: (value) => value != null && value.isEmpty
                    ? 'Please enter your expire date'
                    : null,
                keyboardType: TextInputType.datetime,
                onChanged: (value) {
                  if (value.length == 2 && !value.contains('/')) {
                    _expireDateController.text += '/';
                  }
                  if (value.length == 6 && value.contains('/')) {
                    _expireDateController.text = value.substring(0, 5);
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Expire Date',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: TextFormField(
                controller: _cvvController,
                validator: (value) => value != null && value.isEmpty
                    ? 'Please enter your CVV'
                    : null,
                onChanged: (value) {
                  if (value.length >= 3) {
                    _cvvController.text = value.substring(0, 3);
                  }
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'CVV',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 36.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: AppTextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
                buttonText: 'Add Card',
                textStyle: TextStyles.font14WhiteMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
