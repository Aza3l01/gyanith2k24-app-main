import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class EventDetails extends StatefulWidget {
  Map<String, dynamic> data;
  EventDetails({super.key, required this.data});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  final _razorpay = Razorpay();

  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print(
        'Payment Success : ${response.paymentId}, ${response.orderId}, ${response.signature}');

    // Show success dialog box
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Payment Success'),
          content: Text(
              'Payment has been successfully completed. Payment ID: ${response.paymentId}'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'))
          ],
        );
      },
    );

    _razorpay.clear();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Payment Error : ${response.code} --> ${response.message}');

    // Show failure dialog box
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Payment Failure'),
          content: Text(
              'Payment has failed to complete. Error: ${response.message}'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'))
          ],
        );
      },
    );

    _razorpay.clear();
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External Wallet : ${response.walletName}');

    // Show failure dialog box
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('External Wallet'),
          content: Text('External Wallet: ${response.walletName}'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'))
          ],
        );
      },
    );

    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.71, -0.70),
                end: Alignment(-0.71, 0.7),
                colors: [
                  Color.fromARGB(255, 69, 234, 221),
                  Color.fromARGB(255, 32, 144, 134),
                  Color.fromARGB(255, 69, 234, 221),
                  Color.fromARGB(255, 26, 114, 107),
                ],
              ),
            ),
            height: MediaQuery.of(context).size.height,
          ),
          Column(
            children: [
              Hero(
                tag: "EventPic${widget.data["id"]}",
                child: Container(
                  color: Colors.amberAccent,
                  height: MediaQuery.of(context).size.height / 3.5,
                  width: double.infinity,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Sample Title",
                //widget.data["title"],
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Color.fromARGB(255, 2, 116, 103).withOpacity(0.5),
                ),
                child: Text(
                  "Type",
                  //{widget.data["type"]}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16), // Add padding only to the edges
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.date_range, size: 20, color: Colors.white),
                      Expanded(
                        child: Text(
                          "Sample Date",
                          //{widget.data["date"]}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 1,
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(
                            horizontal:
                                8), // Equal left and right margin for divider
                      ),
                      Icon(Icons.location_on, size: 20, color: Colors.white),
                      Text(
                        "Sample Location",
                        //{widget.data["date"]}",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "About",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Sample Text Sample Text Sample Text Sample Text Sample Text Sample Text Sample Text Sample Text Sample Text Sample Text Sample Text Sample Text",
                      //{widget.data["description"]}",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Registrations",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "• Registrations will be done by the Google Form provided above.\n• The details provided by the participants during registration shall be genuine, otherwise strict action shall be taken.\n• Only after the payment will the regristration be accepted.",
                      //{widget.data["description"]}",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(13),
                  child: ActionSlider.standard(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    child: const Text(
                      'Slide to Register',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        fontFamily: "Fonarto",
                      ),
                    ),
                    action: (controller) async {
                      var options = {
                        'key': 'rzp_test_jAflwbAqyBLxw1',
                        'amount': 100 * 100,
                        'name': "Event Name",
                        'description': "description",
                        'prefill': {
                          'contact': '8309365005',
                          'email': 'vikram.nitpy@gmail.com'
                        },
                      };

                      controller.loading();
                      try {
                        _razorpay.open(options);
                        controller.success();
                      } catch (error) {
                        print('====================> Error : $error');
                        controller.reset();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
