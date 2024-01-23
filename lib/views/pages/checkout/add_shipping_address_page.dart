import 'package:e_commerce/models/shipping_address_model.dart';
import 'package:e_commerce/utils/helpers/extensions.dart';
import 'package:e_commerce/utils/helpers/spacing.dart';
import 'package:e_commerce/views/widgets/app_text_button.dart';
import 'package:e_commerce/views/widgets/app_text_form_field.dart';
import 'package:e_commerce/views/widgets/main_dailog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../controllers/database_controller.dart';
import '../../../utils/constants/strings.dart';
import '../../../utils/theming/text_styles.dart';

class AddShippingAddressPage extends StatefulWidget {
  AddShippingAddressPage({super.key, this.shippingAddress});

  ShippingAddressModel? shippingAddress;

  @override
  State<AddShippingAddressPage> createState() => _AddShippingAddressPageState();
}

class _AddShippingAddressPageState extends State<AddShippingAddressPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.shippingAddress != null) {
      fullNameController.text = widget.shippingAddress!.fullName;
      addressController.text = widget.shippingAddress!.address;
      cityController.text = widget.shippingAddress!.city;
      stateController.text = widget.shippingAddress!.state;
      zipCodeController.text = widget.shippingAddress!.zipCode;
      countryController.text = widget.shippingAddress!.country;
    }
    print('========================== ${widget.shippingAddress}');
  }

  @override
  void dispose() {
    fullNameController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipCodeController.dispose();
    countryController.dispose();
    super.dispose();
  }

  Future<void> saveAddress(Database database) async {
    try {
      if (formKey.currentState!.validate()) {
        final address = ShippingAddressModel(
            id: widget.shippingAddress != null
                ? widget.shippingAddress!.id
                : documentIdFromLocalData(),
            address: addressController.text.trim(),
            fullName: fullNameController.text.trim(),
            city: cityController.text.trim(),
            country: countryController.text.trim(),
            state: stateController.text.trim(),
            zipCode: zipCodeController.text.trim());
        await database.saveAddress(address);
        if (!mounted) return;
        context.pop();
      }
    } catch (e) {
      MainDialog(
              context: context,
              title: "Error saving address ",
              content: e.toString())
          .showAlertDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.9,
        backgroundColor: Colors.white,
        title: Text(
          widget.shippingAddress != null
              ? "Editing Shipping Address "
              : 'Adding Shipping Address',
          style: TextStyles.font18BlackRegular,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                AppTextFormField(
                  hintText: 'Full name',
                  controller: fullNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter your full name";
                    }
                  },
                ),
                verticalSpace(20),
                AppTextFormField(
                  hintText: 'Address',
                  controller: addressController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter your address";
                    }
                  },
                ),
                verticalSpace(20),
                AppTextFormField(
                  hintText: 'City',
                  controller: cityController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter your city";
                    }
                  },
                ),
                verticalSpace(20),
                AppTextFormField(
                  hintText: 'State/Province/Region',
                  controller: stateController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter your state";
                    }
                  },
                ),
                verticalSpace(20),
                AppTextFormField(
                  hintText: 'Zip Code (Postal Code)',
                  controller: zipCodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter a zip code";
                    }
                  },
                ),
                verticalSpace(20),
                AppTextFormField(
                  hintText: 'Country',
                  controller: countryController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter your country";
                    }
                  },
                ),
                verticalSpace(40),
                AppTextButton(
                    buttonText: widget.shippingAddress != null
                        ? "Update Address "
                        : 'Save Address',
                    textStyle: TextStyles.font14WhiteMedium,
                    onPressed: () {
                      saveAddress(database);
                    })
              ],
            ),
          ),
        ),
      )),
    );
  }
}
