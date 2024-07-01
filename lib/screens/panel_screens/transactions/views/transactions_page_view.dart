import 'package:fluent_ui/fluent_ui.dart' as fi;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pactus/screens/panel_screens/transactions/widgets/dropdown_field.dart';
import 'package:pactus/screens/panel_screens/transactions/widgets/text_input_field.dart';

class PerformTransaction extends StatefulWidget {
  const PerformTransaction({super.key});

  @override
  State<PerformTransaction> createState() => _PerformTransactionState();
}

class _PerformTransactionState extends State<PerformTransaction> {
  // focusing nodes for the fields.
  FocusNode transactionTypeFN = FocusNode();
  FocusNode senderAddrFN = FocusNode();
  FocusNode recFN = FocusNode();
  FocusNode memoFN = FocusNode();
  FocusNode amntFN = FocusNode();
  // editing controllers for the editable text fields.
  TextEditingController recEC = TextEditingController();
  TextEditingController memoEC = TextEditingController();
  TextEditingController amntEC = TextEditingController();
  TextEditingController validatorPublicKey = TextEditingController();
  TextEditingController stakeAmnt = TextEditingController();

  var transactionType = '';
  String senderAddr = '';
  String validatorAddress = '';

  List<Map<String, String>> transactiontypes = [
    {'name': 'Transfer', 'value': 'transfer'},
    {'name': 'Withdraw', 'value': 'withdraw'},
    {'name': 'Bond', 'value': 'bond'},
    {'name': 'Unbond', 'value': 'unbond'},
  ];
  @override
  Widget build(BuildContext context) {
    bool isDarkModelEnabled = fi.FluentTheme.of(context).brightness.isDark;
    return Expanded(
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.spMin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 15.spMin),
                        width: 600.spMin,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Transaction Type',
                              style: GoogleFonts.lexend(fontSize: 13.spMin),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 450.spMin,
                              child: TransactionDropDownField(
                                value: transactionType,
                                items: transactiontypes,
                                fn: transactionTypeFN,
                                isDark: isDarkModelEnabled,
                                hint: "Select Transaction Type",
                                setter: setTransaction,
                              ),
                            ),
                          ],
                        ),
                      ),
                      transactionType.contains('transfer') ||transactionType.contains('bond')
                          ? Container(
                              margin: EdgeInsets.only(bottom: 15.spMin),
                              width: 600.spMin,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Sender',
                                    style: GoogleFonts.lexend(),
                                  ),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    width: 450.spMin,
                                    child: TransactionDropDownField(
                                      value: senderAddr,
                                      items: transactiontypes,
                                      fn: senderAddrFN,
                                      isDark: isDarkModelEnabled,
                                      hint: 'Select Your Address',
                                      setter: setSenderAddr,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      transactionType == 'transfer' ||
                              transactionType == 'withdraw'
                          ? Container(
                              margin: EdgeInsets.only(bottom: 15.spMin),
                              width: 600.spMin,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Recipient',
                                    style: GoogleFonts.lexend(),
                                  ),
                                  const Text('*',
                                      style: TextStyle(color: Colors.red)),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    width: 450.spMin,
                                    child: formInput(
                                        'Recipient Address',
                                        recFN,
                                        recEC,
                                        false,
                                        isDarkModelEnabled,
                                        false),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      Container(
                        margin: EdgeInsets.only(bottom: 15.spMin),
                        width: 600.spMin,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Memo',
                              style: GoogleFonts.lexend(),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 450.spMin,
                              child: formInput('Memo message', memoFN, memoEC,
                                  false, isDarkModelEnabled, true),
                            ),
                          ],
                        ),
                      ),
                      transactionType == 'transfer' || transactionType == 'bond'
                          ? Container(
                              margin: EdgeInsets.only(bottom: 15.spMin),
                              width: 600.spMin,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Amount',
                                    style: GoogleFonts.lexend(),
                                  ),
                                  const Text(
                                    '*',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    width: 450.spMin,
                                    child: formInput('Amount', amntFN, amntEC,
                                        true, isDarkModelEnabled, false),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      // ! Amount Showing Container
                      Container(
                        margin: EdgeInsets.only(bottom: 15.spMin),
                        width: 600.spMin,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            SizedBox(width: 5.spMin),
                            SizedBox(
                              width: 450.spMin,
                              child: Text(
                                ' Available : 150 PAC',
                                style: GoogleFonts.lexend(
                                  color: fi.FluentTheme.of(context)
                                          .brightness
                                          .isDark
                                      ? Colors.grey.shade200
                                      : Colors.grey.shade800,
                                  fontSize: 12.spMin,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setTransaction(String val) {
    setState(() {
      transactionType = val;
    });
  }

   void setSenderAddr(String val) {
    setState(() {
      senderAddr = val;
    });
  }
}
