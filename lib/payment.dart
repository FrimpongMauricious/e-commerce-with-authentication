import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_paystack_plus/flutter_paystack_plus.dart';
//import 'dart:html' as html;


class PaystackPaymentScreen extends StatefulWidget {
  const PaystackPaymentScreen({super.key});
  @override
  PaystackPaymentScreenState createState() => PaystackPaymentScreenState();
}

class PaystackPaymentScreenState extends State<PaystackPaymentScreen> {
  final emailController = TextEditingController();
  final amountController = TextEditingController();

  // Generate a unique reference for the transaction
  String generateRef() {
    final randomCode = Random().nextInt(3234234);
    return 'ref-$randomCode';
  }

  @override
  void initState() {
    super.initState();
    // Listen to changes in the amount input field
    amountController.addListener(() {
      setState(() {

      }
      
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 237, 237),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Project Title
              Center(
                child: Text(
                  'Paystack Payment', // Replace with your project title
                  style: TextStyle(
                    color: Colors.black,
                        fontWeight: FontWeight.bold
                  )
                        
                      
                ),
              ),
              const SizedBox(height: 48),
              // Email input field
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    
                  ),
                ),
                
              ),
              const SizedBox(height: 24),
              // Amount input field
              TextField(
                controller: amountController,
                decoration: const InputDecoration(
                  hintText: 'Amount(¢)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const Spacer(),
              // Payment button
              TextButton(
                onPressed: () async {
                  // Generate reference and amount
                  final ref = generateRef();
                  final amount = int.parse(amountController.text);

                  // Ensure both email and amount are provided
                  if (emailController.text.isEmpty || amountController.text.isEmpty) {
                    debugPrint("Please enter valid details");
                    return;
                  }

                  try {
                    // Open Paystack payment popup
                    await FlutterPaystackPlus.openPaystackPopup(
                      publicKey: 'pk_test_5b221a2631353c9e70998d6b74247d17e0a6201d', // Replace with your Paystack public key
                      context: context,
                      secretKey: 'sk_test_a14e53399a40eaaef424f07576953f94b761999a', // Replace with your Paystack secret key
                      currency: 'GHS', // Currency to use (change to your desired currency)
                      customerEmail: emailController.text,
                      amount: (amount * 1).toString(), // Paystack requires amount in kobo
                      reference: ref,
                      callBackUrl: 'your_callback_url_here', // Replace with your callback URL from Paystack Dashboard
                      onClosed: () {
                        debugPrint('Payment dialog closed');
                      },
                      onSuccess: () {
                        debugPrint('Payment successful');
                        // Handle success (e.g., navigate to another screen)
                      },
                    );
                  } catch (e) {
                    debugPrint(e.toString());
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green[400]),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Pay ${amountController.text.isEmpty ? '' : '¢${amountController.text}'} with Paystack',
                    style: TextStyle(
                      
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                    )
                        
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
