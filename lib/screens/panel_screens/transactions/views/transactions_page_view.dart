import 'package:fluent_ui/fluent_ui.dart' as fi;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  FocusNode transactionTypeFN = FocusNode();
  FocusNode senderAddrFN = FocusNode();
  FocusNode recFN = FocusNode();
  FocusNode memoFN = FocusNode();
  FocusNode amntFN = FocusNode();

  TextEditingController recEC = TextEditingController();
  TextEditingController memoEC = TextEditingController();
  TextEditingController amntEC = TextEditingController();
  var transactionType = '';
  String senderAddr = '';
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
        // physics: BouncingScrollPhysics(),
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
                      SizedBox(
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
                                  hint: "Select Transaction Type"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.spMin),
                      SizedBox(
                        width: 600.spMin,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.spMin),
                      SizedBox(
                        width: 600.spMin,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              child: formInput('Recipient Address', recFN,
                                  recEC, false, isDarkModelEnabled, false),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.spMin),
                      SizedBox(
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
                      SizedBox(height: 15.spMin),
                      SizedBox(
                        width: 600.spMin,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              child: formInput('Amount', amntFN, amntEC, true,
                                  isDarkModelEnabled, false),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.spMin),
                      SizedBox(
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
}
