import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pactus/provider/slides_provider.dart';
import 'package:pactus/provider/theme_provider.dart';
import 'package:pactus/screens/welcome_screen.dart';
import 'package:pactus/slides/finish.dart';
import 'package:pactus/slides/initialize_mode.dart';
import 'package:pactus/slides/initializing.dart';
import 'package:pactus/slides/master_password.dart';
import 'package:pactus/slides/number_validators.dart';
import 'package:pactus/slides/wallet_seed.dart';
import 'package:pactus/slides/wallet_seed_confirm.dart';
import 'package:pactus/slides/wallet_seed_restore.dart';
import 'package:pactus/support/app_sizes.dart';
import 'package:pactus/support/extensions.dart';

import '../provider/button_control_provider.dart';
import '../screen_wrapper/wrapper_screen.dart';

enum TransitionDirection { forward, backward }

class InitialScreen extends ConsumerStatefulWidget {
  const InitialScreen({super.key});

  static const String route = '/init';

  @override
  ConsumerState<InitialScreen> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<InitialScreen> {
  final List<String> listEntries = <String>[
    'Initialize mode',
    'Wallet seed',
    'Confirm seed',
    'Master password',
    'Validator Config',
    'Initialization',
    'Finish',
  ];
  final List<String> listRestore = <String>[
    'Initialize mode',
    'Restoration seed',
    'Master password',
    'Validator Config',
    'Initialization',
    'Finish',
  ];

  final pageController = PageController();
  bool restore = false;

  List<Widget> slides = [
    const InitializeModeSlide(
      key: ValueKey<String>('Initialize mode'),
    ),
    const WalletSeedSlide(
      key: ValueKey<String>('Wallet seed'),
    ),
    const WalletSeedConfirmSlide(
      key: ValueKey<String>('Confirm seed'),
    ),
    const MasterPasswordSlide(
      key: ValueKey<String>('Master password'),
    ),
    const NumberValidatorsSlide(
      key: ValueKey<String>('Validator Config'),
    ),
    const InitializingSlide(
      key: ValueKey<String>('Initialization'),
    ),
    const FinishSlide(
      key: ValueKey<String>('Finish'),
    ),
  ];

  List<Widget> slidesRestore = [
    const InitializeModeSlide(
      key: ValueKey<String>('Initialize mode'),
    ),
    const WalletSeedRestoreSlide(
      key: ValueKey<String>('Restoration seed'),
    ),
    const MasterPasswordSlide(
      key: ValueKey<String>('Master password'),
    ),
    const NumberValidatorsSlide(
      key: ValueKey<String>('Validator Config'),
    ),
    const InitializingSlide(
      key: ValueKey<String>('Initialization'),
    ),
    const FinishSlide(
      key: ValueKey<String>('Finish'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    context.afterBuild(() {
      ref.watch(radioButtonProvider.notifier).addListener((state) {
        setState(() {
          if (state == 1) {
            restore = true;
          } else {
            restore = false;
          }
        });
      });
      ref.watch(nextSlideProvider.notifier).addListener((state) {
        if (state == 1) {
          nextSlide();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final theme = ref.watch(appThemeProvider);
    final slideIndex = ref.watch(slideProvider);
    final buttonControl = ref.watch(nextButtonDisableProvider);
    final radioValue = ref.watch(radioButtonProvider);
    return WrapperPage(
      title: 'Pactus',
      content: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                //list
                Padding(
                  padding: EdgeInsets.only(top: 35.0.w),
                  child: SizedBox(
                    width: 240.w,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount:
                          restore ? listRestore.length : listEntries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 40.h,
                          width: 240.w,
                          padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 20.w,
                            vertical: 12.0.h,
                          ),
                          decoration: BoxDecoration(
                            color: index <= slideIndex
                                ? theme.isLightTheme(context)
                                    ? Colors.white
                                    : const Color(0xFF323232)
                                : Colors.transparent,
                          ),
                          child: ListEntry(
                            title: restore
                                ? listRestore[index]
                                : listEntries[index],
                            selected: index <= slideIndex,
                            bold: index == slideIndex,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  height: height,
                  width: 1,
                  color: theme.separator,
                ),
                // Content
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 30.0.w,
                            vertical: 30.0.h,
                          ),
                          child: PageView.builder(
                            physics:const NeverScrollableScrollPhysics(),
                            controller: pageController,
                            itemCount:
                                restore ? slidesRestore.length : slides.length,
                            onPageChanged: (int index) {
                              ref.read(slideProvider.notifier).state = index;
                            },
                            itemBuilder: (context, index) {
                              return restore
                                  ? slidesRestore[index]
                                  : slides[index];
                            },
                          ),
                        ),
                      ),
                      Visibility(
                        visible: restore ? slideIndex != 5 : slideIndex != 6,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            width: double.infinity,
                            height: 80.h,
                            decoration: BoxDecoration(
                              color: theme.buttonBar,
                              border: Border(
                                top: BorderSide(
                                  color: theme.separator.withOpacity(0.08),
                                ),
                              ),
                            ),
                            padding: const EdgeInsetsDirectional.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                slideIndex == 0
                                    ? const SizedBox()
                                    : SizedBox(
                                        width: 96.w,
                                        child: Button(
                                          onPressed: () {
                                            if (slideIndex == 0) {
                                              context.go(WelcomeScreen.route);
                                            } else {
                                              setState(() {
                                                ref
                                                    .read(
                                                      nextButtonDisableProvider
                                                          .notifier,
                                                    )
                                                    .state = false;
                                              });
                                              goBack(ref, pageController);
                                            }
                                          },
                                          child: const Text('Back'),
                                        ),
                                      ),
                                //skip button
                                Row(
                                  children: [
                                    if (slideIndex == 3 && radioValue == 0)
                                      Button(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              ButtonState.resolveWith((states) {
                                            if (buttonControl) {
                                              return Colors.grey
                                                  .withOpacity(0.2);
                                            }
                                            if (states.contains(
                                              ButtonStates.hovering,
                                            )) {
                                              return Colors.grey
                                                  .withOpacity(0.05);
                                            }
                                            return Colors.transparent;
                                          }),
                                          foregroundColor:
                                              ButtonState.all<Color>(
                                            Colors.blue,
                                          ),
                                          shape: ButtonState.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                8,
                                              ),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          ref
                                              .read(
                                                nextButtonDisableProvider
                                                    .notifier,
                                              )
                                              .state = false;
                                          goForward(ref, pageController);
                                        },
                                        child: const Text('Skip'),
                                      ),
                                    gapW16,
                                    SizedBox(
                                      width: 96.w,
                                      child: Button(
                                        onPressed: buttonControl
                                            ? null
                                            : () {
                                                goForward(ref, pageController);
                                              },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              ButtonState.resolveWith((states) {
                                            if (buttonControl) {
                                              return Colors.grey
                                                  .withOpacity(0.1);
                                            }
                                            if (states.contains(
                                              ButtonStates.hovering,
                                            )) {
                                              return Colors.blue.lightest;
                                            }
                                            return Colors.blue;
                                          }),
                                          foregroundColor:
                                              ButtonState.all<Color>(
                                            buttonControl
                                                ? Colors.black.withOpacity(0.1)
                                                : Colors.white,
                                          ),
                                        ),
                                        child: const Text('Next'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Your buttons or gestures to change the slide index
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void goBack(WidgetRef ref, PageController pageController, {int? page}) {
    final currentIndex = ref.read(slideProvider.notifier).state;
    if (currentIndex > 0) {
      final newIndex = page ?? currentIndex - 1;
      pageController.animateToPage(
        newIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
      );
      ref.read(slideProvider.notifier).state = newIndex;
    }
  }

  void goForward(WidgetRef ref, PageController pageController, {int? page}) {
    final currentIndex = ref.read(slideProvider.notifier).state;
    final newIndex = page ?? currentIndex + 1;
    if (newIndex < slides.length) {
      pageController.animateToPage(
        newIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastEaseInToSlowEaseOut,
      );
      ref.read(slideProvider.notifier).state = newIndex;
    }
  }

  void nextSlide() {
    goForward(ref, pageController);
  }
}

class ListEntry extends StatelessWidget {
  const ListEntry({
    super.key,
    required this.title,
    this.selected = false,
    this.bold = false,
  });

  final String title;
  final bool selected;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Opacity(
          opacity: selected ? 1.0 : 0.2,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: bold ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
