import 'package:flutter/material.dart';
import 'package:ideal/src/constants.dart';
import 'package:ideal/src/screens/offer/widgets/price_range_input_group.dart';
import 'package:ideal/src/screens/widgets/filled_text_input.dart';
import 'package:ideal/src/screens/widgets/loan_duration_picker.dart';
import 'package:ideal/src/screens/widgets/rectangular_button.dart';

class OfferScreen extends StatefulWidget {
  static const OFFER_SCREEN_ROUTE = '/offer_screen';

  const OfferScreen({Key? key}) : super(key: key);

  @override
  _OfferScreenState createState() => _OfferScreenState();

  static void goToOfferScreen(BuildContext context) {
    Navigator.of(context).pushNamed(OFFER_SCREEN_ROUTE);
  }
}

class _OfferScreenState extends State<OfferScreen> {
  final TextEditingController _fromAmountController = TextEditingController();
  final TextEditingController _toAmountController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String duration = "Month";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Publish Load Offer"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(
            kDefaultPadding * .5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Create Loan Offer",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: kDefaultPadding * .2,
                  top: kDefaultPadding,
                ),
                child: TextInputLabel(
                  label: "Price Range ( UGX )",
                ),
              ),
              PriceRangeTextInputGroup(
                fromAmountController: _fromAmountController,
                toAmountController: _toAmountController,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: kDefaultPadding),
                    child: TextInputLabel(
                      label: "Price Range ( % )",
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      border: InputBorder.none,
                      fillColor: Colors.black12,
                    ),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextInputLabel(label: "Duration"),
              LoanDurationPicker(
                durationController: _durationController,
                selectedValue: duration,
                onValueChanged: (String? value) {
                  setState(() {
                    duration = value ?? duration;
                  });
                },
                options: ["Day", "Week", "Month", "Year"],
              ),
              TextInputLabel(label: "Description"),
              Expanded(
                child: FilledTextInput(
                  onChange: (String value) {},
                  hint: "Description",
                  keyboard: TextInputType.multiline,
                  maxLine: 8,
                  controller: _descriptionController,
                ),
              ),
              RectangularButton(
                onTap: () {},
                label: "Create Offer",
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextInputLabel extends StatelessWidget {
  final String label;

  const TextInputLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: 15,
            color: Colors.black45,
          ),
    );
  }
}
