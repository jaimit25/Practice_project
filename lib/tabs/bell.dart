import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class bell extends StatefulWidget {
  @override
  _bellState createState() => _bellState();
}

class _bellState extends State<bell> {
  DateTime currentDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }

  var _razorpay = Razorpay();

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();

  //   _razorpay.clear(); // Removes all listeners
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Text(currentDate.toString()),
          RaisedButton(
              onPressed: () => _selectDate(context), child: Text('Select date'))
          //Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     RaisedButton(
          //       onPressed: openCheckout,
          //       child: Text('open'),
          //     )
          //   ],
          // ),
        ]),
      ),
    ));

//   openCheckout() async {
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }
// }

// var options = {
//   'key': 'rzp_test_he0FfnMMohuW1H',
//   'amount': 100, //in the smallest currency sub-unit.
//   'name': 'Acme Corp.',
//   'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
//   'description': 'T-shirt',
//   'timeout': 60, // in seconds
//   'prefill': {'contact': '9123456789', 'email': 'gaurav.kumar@example.com'}
// };

// void _handlePaymentSuccess(PaymentSuccessResponse response) {
//   // Do something when payment succeeds
// }

// void _handlePaymentError(PaymentFailureResponse response) {
//   // Do something when payment fails
// }

// void _handleExternalWallet(ExternalWalletResponse response) {
//   // Do something when an external wallet was selected
// }
  }
}
