import 'package:fluent_ui/fluent_ui.dart' as fi;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pactus/screens/panel_screens/transactions/views/transactions_page_view.dart';

class TransactionScreen extends ConsumerStatefulWidget {
  const TransactionScreen({super.key});

  @override
  ConsumerState<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends ConsumerState<TransactionScreen> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    final isDarkModelEnabled = fi.FluentTheme.of(context).brightness.isDark;
    Widget stepsBuilder(int stepIndex, StepState stepState) {
      if (stepIndex == 0) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: isDarkModelEnabled
                  ? Colors.grey.shade200
                  : Colors.grey.shade800,
            ),
          ),
          padding: const EdgeInsets.all(10),
          child: Icon(Iconsax.note, size: 26.spMin),
        );
      }
      if (stepIndex == 1) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: isDarkModelEnabled
                  ? Colors.grey.shade200
                  : Colors.grey.shade800,
            ),
          ),
          padding: const EdgeInsets.all(10),
          child: Icon(Iconsax.note, size: 26.spMin),
        );
      } else {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: isDarkModelEnabled
                  ? Colors.grey.shade200
                  : Colors.grey.shade800,
            ),
          ),
          padding: const EdgeInsets.all(10),
          child: Icon(Iconsax.note, size: 26.spMin),
        );
      }
    }

    final TextStyle headerTextStyle = GoogleFonts.lexend(
      fontSize: 13.spMin,
      fontWeight: FontWeight.w600,
    );
    return Scaffold(
      backgroundColor:
          isDarkModelEnabled ? const Color(0xFF0F1012) : Colors.white,
      body: Padding(
        padding: EdgeInsets.all(30.spMin),
        child: Container(
          width: double.infinity,
          child: Center(
            child: Container(
              width: double.infinity,
              constraints:
                  BoxConstraints(minWidth: 620.spMin, maxWidth: 700.spMin),
              child: Material(
                color: isDarkModelEnabled
                    ? Colors.white.withOpacity(0.05)
                    : Colors.black.withOpacity(0.04),
                elevation: 0,
                borderRadius: BorderRadius.circular(10.spMin),
                clipBehavior: Clip.hardEdge,
                shadowColor: isDarkModelEnabled
                    ? Colors.white.withOpacity(0.05)
                    : Colors.black.withOpacity(0.04),
                type: MaterialType.card,
                child: Stepper(
                  type: StepperType.horizontal,
                  elevation: 0,
                  controlsBuilder: (context, details) {
                    return Flexible(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          !(currentStep == 0)
                              ? MaterialButton(
                                  elevation: 0,
                                  color: isDarkModelEnabled
                                      ? Colors.white.withOpacity(0.06)
                                      : Colors.grey.shade100,
                                  padding:
                                      EdgeInsets.symmetric(vertical: 5.spMin),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: isDarkModelEnabled
                                          ? Colors.grey.shade800
                                          : Colors.grey.shade500,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(5.spMin),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (!(currentStep <= 0)) {
                                        currentStep -= 1;
                                      }
                                    });
                                  },
                                  child: Text(
                                    'Back',
                                    style: headerTextStyle,
                                  ),
                                )
                              : Container(),
                          MaterialButton(
                            elevation: 0,
                            color: isDarkModelEnabled
                                ? Colors.white.withOpacity(0.06)
                                : Colors.grey.shade100,
                            padding: EdgeInsets.symmetric(vertical: 5.spMin),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: isDarkModelEnabled
                                    ? Colors.grey.shade800
                                    : Colors.grey.shade500,
                              ),
                              borderRadius: BorderRadius.circular(5.spMin),
                            ),
                            onPressed: () {
                              setState(() {
                                if (currentStep < 2) {
                                  currentStep += 1;
                                }
                              });
                            },
                            child: Text(
                              'Next',
                              style: headerTextStyle,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  currentStep: currentStep,
                  connectorThickness: 2,
                  connectorColor: const MaterialStatePropertyAll(
                    Color(0xFF19A2FE),
                  ),
                  // stepIconBuilder: stepsBuilder,
                  physics: const BouncingScrollPhysics(),
                  steps: [
                    Step(
                      label: Text(
                        'Transaction',
                        style: GoogleFonts.lexend(
                          fontSize: 12.spMin,
                          color: currentStep == 0
                              ? const Color(0xFF19A2FE)
                              // .withOpacity(0.9)
                              : Colors.grey.shade400,
                        ),
                      ),
                      title: const Text(''),
                      isActive: currentStep == 0,
                      content: const PerformTransaction(),
                    ),
                    Step(
                      label: Text(
                        'Confirm',
                        style: GoogleFonts.lexend(
                          fontSize: 12.spMin,
                          color: currentStep == 1
                              ? const Color(0xFF19A2FE)
                              // .withOpacity(0.9)
                              : Colors.grey.shade400,
                        ),
                      ),
                      title: const Text(''),
                      isActive: currentStep == 1,
                      content: Container(),
                    ),
                    Step(
                      label: Text(
                        'Result',
                        style: GoogleFonts.lexend(
                          fontSize: 12.spMin,
                          color: currentStep == 2
                              ? const Color(0xFF19A2FE)
                              // .withOpacity(0.9)
                              : Colors.grey.shade400,
                        ),
                      ),
                      title: const Text(''),
                      isActive: currentStep == 2,
                      content: const CircularProgressIndicator(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
