# 1.62.0+64
### [Refactor]
- Move LoadNodeValidatorAddresses component to the start of the dashboard home screen [#193](https://github.com/pactus-project/pactus-gui/pull/198)
- Change color of the close button in the Windows toolbar [#193](https://github.com/pactus-project/pactus-gui/pull/198)

# 1.61.0+63
### [Fix]
- Update dashboard item color according figma specs [#193](https://github.com/pactus-project/pactus-gui/pull/197)

# 1.60.0+62
### [Feature]
- Adjustment background color of seed input component [#195](https://github.com/pactus-project/pactus-gui/pull/196)

# 1.59.0+61
### [Fix]
- Fix lock node in debugging mode and force close app [#187](https://github.com/pactus-project/pactus-gui/pull/188)
    - Detect running `pactus-daemon` process
    - Remove lock file
- Fix lock file and stop running node in debug mode and force close app [#187](https://github.com/pactus-project/pactus-gui/pull/188)
- Resolved extra error message at unlock password screen [#187](https://github.com/pactus-project/pactus-gui/pull/188)

### [Update]
- Change pactus package name from gui to pactus_gui [#187](https://github.com/pactus-project/pactus-gui/pull/188)
- Fix some hardcoded texts [#187](https://github.com/pactus-project/pactus-gui/pull/188)
    - Master password feature
    - Generate seeds feature

### [Refactor]
- Close pactus-daemon process when user clicks close button [#187](https://github.com/pactus-project/pactus-gui/pull/188)

### [Update]
- Fix lock node in debugging mode and force close app  [#187](https://github.com/pactus-project/pactus-gui/pull/188)
    - detect running `pactus-daemon` process
    - remove lock file

# 1.58.0+60
### [Feature]
- Implement password validation for master password. [#190](https://github.com/pactus-project/pactus-gui/pull/194)
  - Add password validation using RxDart.
### [Refactor]
- Refactor custom input widget to support password validation [#190](https://github.com/pactus-project/pactus-gui/pull/194)

# 1.57.1+59
### [CI]
- Update linux amd github action. [#183](https://github.com/pactus-project/pactus-gui/pull/184)

# 1.57.0+58
### [Refactor]
- Add "Coming Soon" label to sections in dashboard. [#185](https://github.com/pactus-project/pactus-gui/pull/186)
  - `Node logs` section
  - `Transactions` section
  - `Wallet` section
- Fix location of combo-box in generation seed screen. [#185](https://github.com/pactus-project/pactus-gui/pull/186)

### [Fix]
- Fix scrolling bug in about screen [#185](https://github.com/pactus-project/pactus-gui/pull/186)

# 1.56.0+57

### [Refactor]
- Split dashboard code into smaller files for better maintainability [156](https://github.com/pactus-project/pactus-gui/pull/183)
- Refactor and improve dashboard UI [156](https://github.com/pactus-project/pactus-gui/pull/183)
- Refactor About Item To Showing Text Correctly And Responsive For Smaller Screen [156](https://github.com/pactus-project/pactus-gui/pull/183)

### [Fix]
- Fix analyze error [156](https://github.com/pactus-project/pactus-gui/pull/183)
- Update contents in the about screen [156](https://github.com/pactus-project/pactus-gui/pull/183)

### [Feat]
- implementation all about text [156](https://github.com/pactus-project/pactus-gui/pull/183)
- Add package info for show app version [156](https://github.com/pactus-project/pactus-gui/pull/183)
- Update application icons for windows and macos [156](https://github.com/pactus-project/pactus-gui/pull/183)

# 1.53.0+56
### [Fix]
- Fixed navigation issues between dashboard panes [#178](https://github.com/pactus-project/pactus-gui/pull/182)
- Resolved rendering issues in the FAQ section of the dashboard [#178](https://github.com/pactus-project/pactus-gui/pull/182)
- Eliminated unnecessary padding in the welcome screen for smoother scrolling [#178](https://github.com/pactus-project/pactus-gui/pull/182)
- Adjusted button sizing in the unlock password interface [#178](https://github.com/pactus-project/pactus-gui/pull/182)
- Corrected seed selection logic for 24/12 seed password generation [#178](https://github.com/pactus-project/pactus-gui/pull/182)
- Updated color scheme for CopyToClipboardButton [#178](https://github.com/pactus-project/pactus-gui/pull/182)
- Deactivated remote node functionality in initializeMode [#178](https://github.com/pactus-project/pactus-gui/pull/182)
- Applied updates to localization files [#178](https://github.com/pactus-project/pactus-gui/pull/182)
- Modified color settings in ValidatorConfig feature [#178](https://github.com/pactus-project/pactus-gui/pull/182)
- Enhanced UI and color consistency in ScreenHeaderWidget [#178](https://github.com/pactus-project/pactus-gui/pull/182)
- Fixed node initialization command for Windows compatibility [#178](https://github.com/pactus-project/pactus-gui/pull/182)
- Updated various localization texts #181

### [Update]
- Repositioned seed combo-box in the restoration seed interface [#178](https://github.com/pactus-project/pactus-gui/pull/182)


# 1.52.0+55
### [Fix] 
- Fixed correctly switching between pane items in dashboard [#179](https://github.com/pactus-project/pactus-gui/pull/180)
- Fixed FAQ screen usage in dashboard feature  [#179](https://github.com/pactus-project/pactus-gui/pull/180)
- Removed extra space in welcome screen UI for better scrolling [#179](https://github.com/pactus-project/pactus-gui/pull/180)
- Fixed button width in unlock password feature [#179](https://github.com/pactus-project/pactus-gui/pull/180)
- Fixed 24/12 seed selection for password generation in contents [#179](https://github.com/pactus-project/pactus-gui/pull/180)
- Fixed colors of CopyToClipboardButton [#179](https://github.com/pactus-project/pactus-gui/pull/180)
- Disabled remote node feature in initializeMode [#179](https://github.com/pactus-project/pactus-gui/pull/180)
- Made changes in localization files [#179](https://github.com/pactus-project/pactus-gui/pull/180)
- Fixed color changes in ValidatorConfig feature  [#179](https://github.com/pactus-project/pactus-gui/pull/180)
- Fixed UI and color changes in ScreenHeaderWidget  [#179](https://github.com/pactus-project/pactus-gui/pull/180)
- Fixed init node command in windows OS [#179](https://github.com/pactus-project/pactus-gui/pull/180)

### [Update]
- Changed location of seed combo-box in restoration seed screen [#179](https://github.com/pactus-project/pactus-gui/pull/180)

# 1.51.0+54
### [Feat]
- Add infrastructure to receive node wallet/validator addresses [#158](https://github.com/pactus-project/pactus-gui/pull/177)
- Add API infrastructure to receive details for any node wallet/validator address [#158](https://github.com/pactus-project/pactus-gui/pull/177)
- Implementation UI for addresses_card on dashboard home screen [#158](https://github.com/pactus-project/pactus-gui/pull/177)
- Show address card data on the dashboard home screen [#158](https://github.com/pactus-project/pactus-gui/pull/177)

### [Fix]
- Fix transparent color of window background in Windows OS [#158](https://github.com/pactus-project/pactus-gui/pull/177)
- Fix widget tree for usage ScaffoldPage in splash screen [#158](https://github.com/pactus-project/pactus-gui/pull/177)
- Validate password of node by start node and review validation [#158](https://github.com/pactus-project/pactus-gui/pull/177)
- Load data from GRPC port in node configuration [#158](https://github.com/pactus-project/pactus-gui/pull/177)

### [Refactor]
- Split dashboard code into smaller files for better maintainability [#158](https://github.com/pactus-project/pactus-gui/pull/177)
- Refactor and improve dashboard UI [#158](https://github.com/pactus-project/pactus-gui/pull/177)

# 1.50.0+53
### [Feat]
- Implemented settings section for dashboard and settings screens [#154](https://github.com/pactus-project/pactus-gui/pull/175)
- Updated app constants to define static text for settings section [#154](https://github.com/pactus-project/pactus-gui/pull/175)
- Fix switch language when autoSelect english [#154](https://github.com/pactus-project/pactus-gui/pull/175)

### [Refactor]
- Refactored settings text style for improved consistency [#154](https://github.com/pactus-project/pactus-gui/pull/175)
- Refactored dashboard screen: [#154](https://github.com/pactus-project/pactus-gui/pull/175)
- Removed selector color and language from welcome screen [#154](https://github.com/pactus-project/pactus-gui/pull/175)
- Added Bloc provider for dropdown functionality on dashboard screen [#154](https://github.com/pactus-project/pactus-gui/pull/175)
- Refactored language widget to use dropdown instead of button [#154](https://github.com/pactus-project/pactus-gui/pull/175)
- Refactored app color accent [#154](https://github.com/pactus-project/pactus-gui/pull/175)
- Changed shape to rectangle [#154](https://github.com/pactus-project/pactus-gui/pull/175)
- Added check icon display when a color is selected [#154](https://github.com/pactus-project/pactus-gui/pull/175)


# 1.49.0+52
### [Feature]
- Implemented translation for FAQ text on dashboard and FAQ screens [#155](https://github.com/pactus-project/pactus-gui/pull/176)

### [Update]
- Implemented FAQ section:
  - Added FAQ section to handle all FAQ content [#155](https://github.com/pactus-project/pactus-gui/pull/176)
  - Implemented FAQ item to manage title and subtitle [#155](https://github.com/pactus-project/pactus-gui/pull/176)

### [Refactor]
- Refactored FAQ item text style for improved consistency [#155](https://github.com/pactus-project/pactus-gui/pull/176)

# 1.48.0+51
### [Fix]
- Resolved Windows OS transparent window background issue [#171](https://github.com/pactus-project/pactus-gui/pull/174)
- Fixed splash screen widget tree for proper `ScaffoldPage` usage [#171](https://github.com/pactus-project/pactus-gui/pull/174)
- Improved password validation for node startup with stdout message review [#171](https://github.com/pactus-project/pactus-gui/pull/174)
- Fixed dashboard data loading from GRPC port in node configuration [#171](https://github.com/pactus-project/pactus-gui/pull/174)

### [Update]
- Removed logger package and updated related code [#171](https://github.com/pactus-project/pactus-gui/pull/174)

# 1.47.0+50

### [Feature]
- Persist selected theme using `AppThemeCubit` and `localStorage` [#31](https://github.com/pactus-project/pactus-gui/pull/169)
- Persist selected language using `LanguageBloc` and `localStorage` [#31](https://github.com/pactus-project/pactus-gui/pull/169)

### [Update]
- Added error handling in language state management [#31](https://github.com/pactus-project/pactus-gui/pull/169)

### [Test]
- Verified storage operations and data consistency in `LanguageBloc` [#31](https://github.com/pactus-project/pactus-gui/pull/169)
- Verified storage operations and data consistency in `AppThemeCubit` [#31](https://github.com/pactus-project/pactus-gui/pull/169)

# 1.46.0+49
### [Refactor]
- Improved scroll performance and UI consistency [#167](https://github.com/pactus-project/pactus-gui/pull/168)
    - Added `scrollBehavior` to `FluentApp.router` for better scrolling speed in desktop apps
    - Adjusted padding in fetch component to match Figma specifications
    ٖ
### [Fix]
- Fix Item Scroll Problem On Generation Seed And Master Password [#167](https://github.com/pactus-project/pactus-gui/pull/168)

# 1.45.0+48
- [Refactor] : Replaced all `FilledButton` instances with `AdaptivePrimaryButton` from `widgetBook`. [#128](https://github.com/pactus-project/pactus-gui/pull/166)
    - Updated `CopyToClipboardButton` class.
    - Updated `FinishScreen`.
    - Updated `InitializeModeScreen`.
    - Updated `NavigationFooterSection`.
    - Updated `ValidatorConfigScreen`.
    - Updated `WelcomeScreen`.

- [Refactor] : Replaced all `OutlinedButton` & `TextButton` instances with `AdaptiveSecondaryButton` & `AdaptiveTextButton` from `widgetBook`. [#128](https://github.com/pactus-project/pactus-gui/pull/166)
    - Removed unused `AdaptiveFilledButton` overall class.
    - Removed unused `AdaptiveTextButton` overall class.
    - Removed unused `CustomFilledButton` overall class.
    - Removed unused `CustomOutlinedButton` overall class.
    - Updated `ConfirmationSeedWordsGridSection`.
    - Updated `context_extensions` file.
    - Updated `CopyToClipboardButton`.
    - Updated `FinishScreen`.
    - Updated `InitializeModeScreen`.
    - Updated `NavigationFooterSection`.
    - Updated `SeedWordsGridSection`.
    - Updated `ValidatorConfigScreen`.
    - Updated `WelcomeScreen`.

# 1.44.0+47
### [Feature]
- Added `dev_mode` feature for `settings` Pactus GUI `network` for developers.
- Added `set as default` button to preparing `start node` in devMode.

### [Update]
- Added `keyboard shortcut` (Ctrl+D) to enable `dev mode` (in debugging) directly from the `splash screen` and `unlock password screen` . 
- Called daemon commands for initial node and `start node` in devMode.
- Fixed UI `devMode` screen and used bloc to manage states.
- Improved form states after `creating node` in devMode.
- Changed `localNodePort` in core constants.

### [Refactor]
- Changed some properties of `CliConstants` class.
- Fixed redirect `created node` to `unblock password` screen.

# 1.43.0+46
### [Feature]
- Implemented navigation pane for dashboard screen. [#130](https://github.com/pactus-project/pactus-gui/pull/157)

### [Update]
- Refactor ui and set-up `BlockchainInfoSection` in dashboard section. [#130](https://github.com/pactus-project/pactus-gui/pull/157)

# 1.42.1+45

### [CI]
- Enhanced CI/CD Pipeline [#132](https://github.com/pactus-project/pactus-gui/pull/137)
    - Integrated Slack WebHook for automated release notifications.
    - Integrated Discord WebHook for automated release notifications.
    - Automated release process triggered by new Git tags starting with `v`.

# 1.42.0+44
### [Feature]
- Implemented custom window header for the dashboard screen. [#49](https://github.com/pactus-project/pactus-gui/pull/139)

### [Update]
- Added hover color for the `IconButton` to improve interactivity. [#49](https://github.com/pactus-project/pactus-gui/pull/139)
- Updated icon size in the `IconActionButton` widget for better visual consistency. [#49](https://github.com/pactus-project/pactus-gui/pull/139)

# 1.41.0+43
### [Feature]
- Implemented base layout for the app bar. [#42](https://github.com/pactus-project/pactus-gui/pull/135)

### [Update]
- Applied the app bar to all screens except the dashboard. [#42](https://github.com/pactus-project/pactus-gui/pull/135)
- Refactored the condition in the `WelcomeScreen` for improved logic. [#42](https://github.com/pactus-project/pactus-gui/pull/135)
- Updated the test for the switch theme to align with the latest logic. [#42](https://github.com/pactus-project/pactus-gui/pull/135)
- Updated `accent` and `onAccent` color logic in the `ThemeSwitcher` widget.  [#42](https://github.com/pactus-project/pactus-gui/pull/135)
- Removed extra paddings from `CustomAppBar` and `FluentAppBarButton` widgets for a cleaner UI. [#42](https://github.com/pactus-project/pactus-gui/pull/135)

### [Refactor]
- Updated tint color for the switch button to improve visual consistency.  [#42](https://github.com/pactus-project/pactus-gui/pull/135)
- Enabled accent color selection visibility in developer mode for easier theme testing.  [#42](https://github.com/pactus-project/pactus-gui/pull/135)

# 1.40.0+42
### [Feature]
- Added blockchain info infrastructure to support data retrieval and management. [#118](https://github.com/pactus-project/pactus-gui/pull/133)
- Implemented node startup and data display functionality in the dashboard screen. [#118](https://github.com/pactus-project/pactus-gui/pull/133)
- Introduced `ShimmerCardItem` widget for enhanced UI loading states. [#118](https://github.com/pactus-project/pactus-gui/pull/133)

### [Update]
- Added 1, 2, and 3 seconds duration options to the `DelayTime` enum for improved timing control. [#118](https://github.com/pactus-project/pactus-gui/pull/133)
- Updated model, entity, and mapper files in the `blockchainGetInfo` feature to support UI integration. [#118](https://github.com/pactus-project/pactus-gui/pull/133)
- Enhanced UI in the `blockchainGetInfo` feature to display data received from the API. [#118](https://github.com/pactus-project/pactus-gui/pull/133)

### [Chore]
- Integrated the `shimmer` package for smooth loading animations. [#118](https://github.com/pactus-project/pactus-gui/pull/133)

# 1.39.0+41
### [Refactor]
- Optimize navigation of dashboard route and welcome [#122](https://github.com/pactus-project/pactus-gui/pull/129)

# 1.38.0+40
### [Feature]
- Optimize and align accent color with Widgetbook repository [#121](https://github.com/pactus-project/pactus-gui/pull/125)
  - Updated color management to ensure uniform styling across all components.
  - Defined `accentColorLight` / `accentColorDark` for improved theme adaptation.
  - Introduced `onAccentColorLight` / `onAccentColorDark` for consistent foreground colors.
  - Applied changes to all relevant UI components.
  - Ensured compatibility with theme handling and tested UI consistency.
- Added `CliConstants` for centralized daemon file key management.

### [Update]
- Removed BlocBuilder widgets and directly used `accentColor` from context for improved performance and cleaner code.[#121](https://github.com/pactus-project/pactus-gui/pull/125)
- Improved loading speed of accent color from local storage.

### [Test]
- Added tests for different states of saving/loading data from local storage.[#121](https://github.com/pactus-project/pactus-gui/pull/125)
 
# 1.37.0+39
### [Fix]
- Resolve initialization bug in remote node connection step [#116](https://github.com/pactus-project/pactus-gui/pull/119)

# 1.36.0+38
### [Feature]
- Implemented accent color feature in the GUI app [#117](https://github.com/pactus-project/pactus-gui/pull/120)
  - Added `AccentColorPicker` for selecting accent colors [#117](https://github.com/pactus-project/pactus-gui/pull/120)
  - Created `AppAccentColorCubit` for managing the accent color state [#117](https://github.com/pactus-project/pactus-gui/pull/120)
  - Provided `AppAccentColorCubit` in the main file for global access [#117](https://github.com/pactus-project/pactus-gui/pull/120)
  - Updated `ThemeSwitcher` to support accent color changes [#117](https://github.com/pactus-project/pactus-gui/pull/120)
  - Updated `WelcomeScreen` to reflect accent color logic [#117](https://github.com/pactus-project/pactus-gui/pull/120)

### [Refactor]
- Updated `InitializeModeScreen` to integrate accent color logic [#117](https://github.com/pactus-project/pactus-gui/pull/120)
  - Modified `CustomRadioButton` and `CustomInputWidget` to support accent colors [#117](https://github.com/pactus-project/pactus-gui/pull/120)
- Refactored multiple screens to handle accent color logic: [#117](https://github.com/pactus-project/pactus-gui/pull/120)
  - Updated `CopyToClipboardButton` [#117](https://github.com/pactus-project/pactus-gui/pull/120)
  - Updated `FinishScreen` [#117](https://github.com/pactus-project/pactus-gui/pull/120)
  - Updated `InitializingScreen` [#117](https://github.com/pactus-project/pactus-gui/pull/120)
  - Updated `NavigationFooterSection` [#117](https://github.com/pactus-project/pactus-gui/pull/120)
  - Updated `ValidatorConfigScreen` [#117](https://github.com/pactus-project/pactus-gui/pull/120)

# 1.35.0+37
### [Fix]
- Fixed crash when tapping the "Next" button in `MasterPassword` and added back action [#107](https://github.com/pactus-project/pactus-gui/pull/108)

### [Update]
- Adjusted item height in `ConfirmationSeed` screen [#107](https://github.com/pactus-project/pactus-gui/pull/108)

# 1.34.0+36
### [Fix]
- Refactor some cli commands settings in `splash` and `unlockPassword` features [#114](https://github.com/pactus-project/pactus-gui/pull/115)
  - change on using pactus-wallet `password` commands
  - change on using pactus-wallet `info` commands
  - save `node directory path` in local storage

# 1.33.0+35
- [feat]: Implement Master Password screen
  - Added `MasterPasswordScreen` with new UI and functionality.
  - Renamed "Master Password page" to "Master Password screen".
  - Updated `CustomInputWidget` with new features.
  - Created `MasterPasswordActionButtonWidget`, `MasterPasswordBackButtonWidget`, and `MasterPasswordFooter`.
  - Introduced `MasterPasswordSection` for better UI structure.
  - Added `AdaptiveFilledButton` and updated its usage in the codebase.
  - Updated `AdaptiveTextButton`.
  - Added `buttonBorderColor` to `AppColors`.
  - Added new variables to translation files for better localization support.

- [refactor]: Update `UnlockPasswordScreen` & fix related issues
  - Removed old password screen.
  - Renamed `UnlockPasswordScreen`.
  - Refactored password text field.
  - Updated `basicRoutes` and fixed navigation to `UnlockPasswordScreen`.

- [refactor]: Update `ConfirmationSeedScreen`
  - Renamed `SeedScreenTitleSection` to `ScreenHeaderWidget` and updated references.
  - Added `areAllWordsConfirmed` method in `ConfirmationSeedState`.
  - Made `onNextPressed` nullable where necessary.
  - Added `ConfirmationSeedScreen` and `ConfirmationSeedWordsGridSection`.
  - Removed old `ConfirmationSeedPage`.
  - Updated `ConfirmationSeedCubit`.
  - Added new variables to translation files.

- [refactor]: Fix `GenerationSeedScreen` issues
  - Added `CustomDropdownWidget` to handle selection between 12 or 24 seed words.
  - Fixed UI-related issues in this screen.

- [refactor]: Improve navigation in `CreateLocalNodePane`
  - Added `StepValidationCubit` to validate user steps in panels.
  - Updated `NavigationPaneCubit` with a new `canGoBack` method.
  - Improved panel logic on `onChanged` events.
  - Added `stepValidation` checks on each screen in the local node creation flow.
  - Removed unused `InitializingNavigationPane`.

- [refactor]: Improve navigation in `RestoringNodePane`
  - Added `areAllWordsEntered` logic in `SeedTextCubit` to ensure all seed words are entered.
  - Updated `RestorationSeedScreen`.

- [refactor]: Improve navigation in `ValidatorConfigScreen`
  - Added `StepValidationCubit` to prevent navigation if the directory is not set.

- [refactor]: Various improvements & optimizations
  - Removed `canGoBack` method from `NavigationPaneCubit`.
  - Added `maxIndex` constant to `AppConstants`.
  - Renamed "Dashboard page" to "Dashboard screen".
  - Updated logic in all three panels.
  - Reformatted code for consistency.
  - Fixed `ChipTextBox` sizes.
  - Added `dashboardScreenRoute` to each panel route in `registrationRoutes`.

- [fix]: Add `NavigationFooterSection` to `MasterPasswordScreen`
  - Improved navigation flow in the Master Password screen.
  - Removed unused widgets to optimize performance.

# 1.32.0+34
- [Fix]: Change first route to UnblockPasswordScreen if wallet has a password. [#109](https://github.com/pactus-project/pactus-gui/pull/113)
  - Ensured that when the wallet has a password, the app correctly navigates to the `UnblockPasswordScreen` on launch.
  - Improved security by enforcing password authentication before accessing the app.

- [Fix]: Check correct password using pactus-wallet. [#109](https://github.com/pactus-project/pactus-gui/pull/113)
  - Implemented proper password validation using `pactus-wallet` to enhance security.
  - Resolved potential issues with incorrect password checks in the splash screen flow.

# 1.31.0+33
- [Fix]: Handle disable mode for back button in `NavigationFooterSection` [#97](https://github.com/pactus-project/pactus-gui/pull/112)
  - Ensured that the back button is properly disabled when necessary.

- [Fix]: Improve seed restoration handling on `Next` button [#97](https://github.com/pactus-project/pactus-gui/pull/112)
  - Display an alert when the seed fields are filled incorrectly before proceeding.

- [Fix]: Validate password match in `Master Password` screen [#97](https://github.com/pactus-project/pactus-gui/pull/112)
  - Show an alert when passwords do not match on the `Next` button.

- [Fix]: Prevent back navigation in `InitializingScreen` [#97](https://github.com/pactus-project/pactus-gui/pull/112)
  - Restricted the back button in the `InitializingScreen` to ensure a smooth initialization process.

- [Fix]: Review and update validations for `Restoration Seed` screen [#97](https://github.com/pactus-project/pactus-gui/pull/112)
  - Improved seed verification logic on the `Next` button.
  - Fixed back button behavior to correctly return to the previous screen.

- [Fix]: Handle seed data in `InitializingScreen` for `pactus-daemon init` command [#97](https://github.com/pactus-project/pactus-gui/pull/112)
  - Ensured proper handling of seed data when initializing a new node.

# 1.30.0+32
- [feat]: Implement Master Password screen [#100](https://github.com/pactus-project/pactus-gui/pull/103)
  - Added `MasterPasswordScreen` with new UI and functionality.
  - Renamed "Master Password page" to "Master Password screen".
  - Updated `CustomInputWidget` with new features.
  - Created `MasterPasswordActionButtonWidget`, `MasterPasswordBackButtonWidget`, and `MasterPasswordFooter`.
  - Introduced `MasterPasswordSection` for better UI structure.
  - Added `AdaptiveFilledButton` and updated its usage in the codebase.
  - Updated `AdaptiveTextButton`.
  - Added `buttonBorderColor` to `AppColors`.
  - Added new variables to translation files for better localization support.

- [fix]: Add `NavigationFooterSection` to `MasterPasswordScreen` [#100](https://github.com/pactus-project/pactus-gui/pull/103)
  - Improved navigation flow in the Master Password screen.
  - Removed unused widgets to optimize performance.

# 1.29.0+31
- [Feature]: implement UI for remote connect server page [#101](https://github.com/pactus-project/pactus-gui/pull/102)

# 1.28.0+30
- [Refactor]: Update bottom navigation and create base layout. [#96](https://github.com/pactus-project/pactus-gui/pull/98)
  - Improved bottom navigation structure.
  - Introduced a base layout for consistent page structure.

- [Update]: Add the standard page layout and re-order keys in locale files. [#96](https://github.com/pactus-project/pactus-gui/pull/98)
  - Implemented a standardized page layout.
  - Reorganized localization keys for better maintainability.

- [Update]: Add skip button & dim background. [#96](https://github.com/pactus-project/pactus-gui/pull/98)
  - Introduced a "Skip" button for optional steps.
  - Added a dim background effect for better UI clarity.

- [Update]: Update password handling and allow skipping the master password step. [#96](https://github.com/pactus-project/pactus-gui/pull/98)
  - Enhanced password handling in the master password step.
  - Provided an option for users to skip this step during initialization.

- [Fix]: Resolve merge conflicts and improve password handling for `pactus-daemon`. [#96](https://github.com/pactus-project/pactus-gui/pull/98)
  - Resolved conflicts in the latest integration.
  - Ensured `pactus-daemon` correctly handles interactive password input.
  - Implemented a method to bypass CLI interaction when necessary.

# 1.27.0+29
- [fix]: Correct navigation pane in restore node flow [#92](https://github.com/pactus-project/pactus-gui/pull/99)
  - Fixed issues with the navigation pane during the restore node process.

- [fix]: Add/correct some variables in translation files [#92](https://github.com/pactus-project/pactus-gui/pull/99)
  - Updated translation files by adding and correcting variables for better localization support.

- [Feature]: Implement widgets of Restoration Seed screen [#92](https://github.com/pactus-project/pactus-gui/pull/99)
  - Added a general class `SeedScreenTitleSection` for both restoration and generation seed screens.
  - Renamed "restoration seed page" to "restoration seed screen".
  - Created `RestorationSeedWordsGridSection` to generate `ChipTextBox` for users to enter seed words.
  - Updated the `RestorationSeedScreen` with new features.
  - Introduced `SeedTextCubit` to store the seed words entered by users.
  - Enhanced the `GenerationSeedScreen`.


# 1.26.0+28
- [Fix]: Fix BlocProviders for drop-down widgets. [#94](https://github.com/pactus-project/pactus-gui/pull/95)
  - Resolved issues with BlocProviders in drop-down widgets to improve functionality.

- [Update]: Fix some features related to the initializing screen. [#94](https://github.com/pactus-project/pactus-gui/pull/95)
  - Fixed validator drop-down widget behavior.
  - Improved functionality in `InitializingScreen`.
  - Enhanced `DaemonCubit` integration and set commands.
  - Optimized drop-down widget functionality using Fluent UI’s `ComboBox`.
  - Streamlined state management by introducing a general object to support all drop-down widgets.

- [Feat]: Implement initializing page. [#94](https://github.com/pactus-project/pactus-gui/pull/95)

- [Update]: Update README.md file for Pactus GUI.  [#94](https://github.com/pactus-project/pactus-gui/pull/95)

- [Update]: Add `AppThemeData` to fix build issue.  [#94](https://github.com/pactus-project/pactus-gui/pull/95)


# 1.25.0+27
- [Fix]: Resolve style conflicts in codebase. [#88](https://github.com/pactus-project/pactus-gui/pull/93)
  - Re-arranged code styles and imports to ensure consistency.
  - Cleaned up redundant styles and improved readability.

- [Fix]: Fix BlocProvider in `ConfirmationSeedPage`. [#88](https://github.com/pactus-project/pactus-gui/pull/93)
  - Corrected issues with `BlocProvider` for better state management.

- [Fix]: Fix BlocProvider in `ValidatorConfigScreen`. [#88](https://github.com/pactus-project/pactus-gui/pull/93)
  - Resolved issues related to `BlocProvider` in the `ValidatorConfigScreen` for proper dependency injection.

- [Fix]: Fix UI and remove unnecessary functionality in `FinishPage`. [#88](https://github.com/pactus-project/pactus-gui/pull/93)
  - Fixed scrolling issues.
  - Removed custom styles for buttons to improve consistency.
  - Addressed security concerns by removing password saving functionality.
  - Added disabled style to the `Go to dashboard` button and set it as disabled.

- [Fix]: Provide `DaemonCubit` at the `MaterialApp` level and remove redundant providers. [#88](https://github.com/pactus-project/pactus-gui/pull/93)
  - Ensured proper initialization of `DaemonCubit` at the top-level to avoid redundancy.

- [Update]: Update generated `assets.gen.dart` file. [#88](https://github.com/pactus-project/pactus-gui/pull/93)
  - Regenerated assets file after resolving conflicts and updates.

- [Update]: Add asset file and update locale key. [#88](https://github.com/pactus-project/pactus-gui/pull/93)
  - Added new asset files and updated locale keys for multi-language support.

# 1.24.0+26
- [Feat]: Implement required widgets for `ValidatorConfigScreen`. [#81](https://github.com/pactus-project/pactus-gui/pull/81)
    - Added `ValidatorQtySelectorSection` and `ValidatorQtyCubit` for managing validator selection.
    - Created `ValidatorConfigTitleSection` and `ValidatorConfigScreen` UI.
    - Implemented `showFluentAlert` method for displaying system alerts.
    - Added `NavigationFooterSection` for better navigation flow.
    - Provided `ExpandableStateCubit` in `main.dart` for managing expand/collapse state.
    - Implemented `isNotEmptyDirectory` method to validate directory selection.
    - Updated `InitializingNavigationPane` with new integration.
    - Created `ExpandableStateCubit` and `CustomOutlinedButton`.
    - Updated `CustomExpandableWidget` and `AuthMethodComponent` for consistency.

- [Update]: Enable multi-language support using `l10n` package. [#81](https://github.com/pactus-project/pactus-gui/pull/81)
    - Updated text strings for localization.
    - Made the number of validators configurable using constant variables.
    - Remove `CustomInputRow` as unused widget.

- [Fix]: Update color palettes used in the project. [#81](https://github.com/pactus-project/pactus-gui/pull/81)
    - Removed `SurfacePallet` and `OnSurfacePallet`.
    - Replaced with `DarkPallet` and `LightPallet` for better theme consistency.
    - Fix memory leak by forget dispose `TextEditingController` in `validatorConfig` feature.
    - Fix memory leak by forget dispose `TextEditingController` in `masterPassword` feature.

# 1.23.0+25
 
- [Fix]: Fixed copy to clipboard functionality in `GenerationSeedScreen`. [#PR](https://github.com/pactus-project/pactus-gui/pull/)
  - Resolved the issue where data was not being copied to the clipboard properly.
  - Ensured the feature works as expected for both 12-word and 24-word seed phrases.

# 1.22.0+24

- [Fix]: Handle missing Node during application launch in `SplashScreen`. [#89](https://github.com/pactus-project/pactus-gui/pull/90)
  - Added handling for `DaemonError` state when using `DaemonCubit` to run `./pactus-wallet info`.
  - Ensured proper error handling for missing Node during app startup.

- [Update]: Fix dependencies for `pactus_gui_widgetbook` in `SplashScreen`. [#89](https://github.com/pactus-project/pactus-gui/pull/90)
  - Updated `pactus_gui_widgetbook` dependency to align with the main branch.

- [Fix]: Correct `restorationSeed` value in `GenerationSeedScreen`. [#89](https://github.com/pactus-project/pactus-gui/pull/90)
  - Fixed the value of `restorationSeed` in `generation_seed_screen.dart` to ensure proper functionality.

# 1.21.0+23

- [Feat]: Implement `InitializingNavigationPane` for handling Pactus initializing panel. [#76](https://github.com/pactus-project/pactus-gui/pull/79)  
  - Added `InitializingNavigationPane` and integrated `panItem` for each tab based on Figma design.  
  - Implemented `NavigationPaneCubit` for managing selected tab index.  
  - Created `dashboard_navigation_pane.dart` for future dashboard navigation panel integration.  
  - Updated `registrationRoutes` and provided `NavigationPaneCubit` in `main.dart`.  
  - Added new variables in `.arb` files and generated translation files.  
  - Included `navigationPanelEnableColor` & `navigationPanelDisableColor` in `AppColors`.  

- [Feat]: Implement widgets of `InitializeModeScreen`. [#76](https://github.com/pactus-project/pactus-gui/pull/79)  
  - Created `CustomInputWidget` component for text fields.  
  - Developed `CustomRadioButton`, `RadioButtonGroup`, and `CustomInputRow`.  
  - Updated `InitializeModeScreen` to integrate new widgets.  
  - Added new colors to `AppColors`.  

- [Feat]: Add `CustomExpandableWidget` component. [#76](https://github.com/pactus-project/pactus-gui/pull/79)  
  - Updated `InitializeModeScreen` to improve UI flow.  

- [Update]: Fix navigation stack issue for the "Next" button. [#76](https://github.com/pactus-project/pactus-gui/pull/79)   
  - Updated `InitializeModeScreen` to correct navigation flow.  
  - Added `RemoteNodeSection` and `RadioButtonCubit` for handling remote node selection.  
  - Updated `CustomRadioButton`, `CustomInputRow`, `CustomExpandableWidget`, and `RadioButtonGroup`.  
  - Added multi-language translation files.  

- [Fix]: Resolve daemon config issue related to initialization on "Next" button click. [#76](https://github.com/pactus-project/pactus-gui/pull/79)  
  - Updated `FinishPage`, `InitializeModeScreen`, `MasterPasswordPage`, `RestorationSeedPage`, and `ValidatorConfigScreen`.  

- [Feat]: Add sample code for `GenerationSeedScreen`. [#76](https://github.com/pactus-project/pactus-gui/pull/79)  
  - Created `generation_seed` directory and screen.  
  - Updated `InitializingNavigationPane`.  
  - Developed `CustomReadOnlyTextBox` and `SeedTypeCubit`.  

- [Update]: Refactor `GenerationSeedScreen` for wallet in create local node panel. [#76](https://github.com/pactus-project/pactus-gui/pull/79)  
  - Updated `WelcomeScreen` to use `AdaptiveTextButton`.  
  - Created `SeedWordsGridSection`, `SeedTypeSelectorWidget`, `SeedNotesSection`, `SeedTypeEnum`, `SeedTypeCubit`, and `GenerationSeedTitleSection`.  
  - Updated `GenerationSeedScreen` according to Figma design.  
  - Added `CopyToClipboardButton` and `AdaptiveTextButton` for filled & text buttons.  
  - Updated `AuthMethodComponent`.  

# 1.20.0+22

- [Feat]: Implement unlock password page. [#85](https://github.com/pactus-project/pactus-gui/pull/86)
  - Added UI for the unlock password page.
  - Implemented the logic to unlock the wallet using a password.

- [Feat]: Update UI in the unlock page. [#85](https://github.com/pactus-project/pactus-gui/pull/86)
  - Improved design and layout of the unlock page.
  - Enhanced user experience with updated styling.

- [Update]: Refactor code and update the flow for the unlock wallet page. [#85](https://github.com/pactus-project/pactus-gui/pull/86)
  - Improved code structure for better maintainability.
  - Adjusted the unlocking flow for better usability.

- [Update]: Revert logic in custom password and fix build issues. [#85](https://github.com/pactus-project/pactus-gui/pull/86)
  - Fixed issues related to custom password handling.
  - Resolved build errors to ensure stability.

- [Feat]: Check user wallet for password and handle unblock screen. [#85](https://github.com/pactus-project/pactus-gui/pull/86)
  - Added logic to check if the user's wallet is password-protected.
  - Implemented handling for the unblock screen based on wallet status.

# 1.19.0+21

- [Feat]: Implement three different navigation panes for the three main flows of the app. [#84](https://github.com/pactus-project/pactus-gui/pull/87)
    - Add/create `CreateLocalNodePane` for flows where the user creates a local node.
    - Add/create `RestoringNodePane` for flows where the user restores their node.
    - Add/create `RemoteNodePane` for flows where the user connects to their node on a specific server.
    - Add/create a module named `GenerationSeedScreen` to generate a seed phrase for the first time.
    - Remove old navigation panel and its logic.
    - Provide `RadioButtonCubit` in `main.dart`.
    - Update `registrationRoutes` with the new changes to the panels.
    - Add new routes enum to `route name`.
    - Update navigation in `WelcomeScreen`.
- [Fix]: Apply theme-aware colors to Pane text style. [#84](https://github.com/pactus-project/pactus-gui/pull/87)
    - ensure that Pane text colors adjust correctly based on theme switching, providing proper contrast and readability in both light and dark modes.

# 1.18.0+20

- [Feat]: Implement `InitializingNavigationPane` for handling Pactus initializing panel. [#69](https://github.com/pactus-project/pactus-gui/pull/71)
    - Add/create `InitializingNavigationPane` and integrate each `panItem` for tabs based on Figma design.
    - Implement `NavigationPaneCubit` for managing selected tab index.
    - Add `dashboard_navigation_pane.dart` for future dashboard navigation panel integration.
    - Update `registrationRoutes` for proper navigation.
    - Provide `NavigationPaneCubit` in `main.dart`.
    - Add new variables in `.arb` files and generate updated translation files.
    - Add `navigationPanelEnableColor` & `navigationPanelDisableColor` to `AppColors`.

- [Feat]: Implement widgets of `InitializeModeScreen`. [#69](https://github.com/pactus-project/pactus-gui/pull/71)
    - Add/create `CustomInputWidget` component for text fields.
    - Add/create `CustomRadioButton` and `RadioButtonGroup` components.
    - Add new colors to `AppColors` for widget styling.
    - Update `InitializeModeScreen` for new widget integration.

- [Feat]: Add/create `CustomExpandableWidget` component. [#69](https://github.com/pactus-project/pactus-gui/pull/71)
    - Update `InitializeModeScreen` for better UI flow.

- [Update]: Fix stack issue for navigation in `InitializeModeScreen`. [#69](https://github.com/pactus-project/pactus-gui/pull/71)
    - Add/create `RemoteNodeSection` and `RadioButtonCubit` for handling remote node selection.
    - Update `RadioButtonGroup`, `CustomRadioButton`, `CustomInputRow`, and `CustomExpandableWidget`.
    - Add multi-language translation files for the new text.

- [Fix]: Resolve daemon config issue related to initialization on "Next" button click. [#69](https://github.com/pactus-project/pactus-gui/pull/71)
    - Update `FinishPage`.
    - Update `InitializeModeScreen`.
    - Update `MasterPasswordPage`.
    - Update `RestorationSeedPage`.
    - Update `ValidatorConfigScreen`.

- [Fix]: Fix button height inconsistency. [#69](https://github.com/pactus-project/pactus-gui/pull/71)

- [Fix]: Resolve Linux-specific bugs related to `TextBox` widget. [#69](https://github.com/pactus-project/pactus-gui/pull/71)

- [Refactor]: Improve `RemoteNodeSection` by separating concerns. [#69](https://github.com/pactus-project/pactus-gui/pull/71)

- [Fix]: Adjust color values in `TextStyle` to align with new palette. [#69](https://github.com/pactus-project/pactus-gui/pull/71)

# 1.17.0+19

- [Feat] : Implement `InitializingNavigationPane` for handling Pactus initializing panel. [#71](https://github.com/pactus-project/pactus-gui/pull/71)
    - Add/create `InitializingNavigationPane` and integrate each `panItem` for tabs based on Figma design.
    - Implement `NavigationPaneCubit` for managing selected tab index.
    - Add `dashboard_navigation_pane.dart` for future dashboard navigation panel integration.
    - Update `registrationRoutes` for proper navigation.
    - Provide `NavigationPaneCubit` in `main.dart`.
    - Add new variables in `.arb` files and generate updated translation files.
    - Add `navigationPanelEnableColor` & `navigationPanelDisableColor` to `AppColors`.

- [Feat] : Implement widgets of `InitializeModeScreen`. [#71](https://github.com/pactus-project/pactus-gui/pull/71)
    - Add/create `CustomInputWidget` component for text fields.
    - Add/create `CustomRadioButton` and `RadioButtonGroup` components.
    - Add new colors to `AppColors` for widget styling.
    - Update `InitializeModeScreen` for new widget integration.

- [Feat] : Add/create `CustomExpandableWidget` component. [#71](https://github.com/pactus-project/pactus-gui/pull/71)
    - Update `InitializeModeScreen` for better UI flow.

- [Update] : Fix stack issue for navigation in `InitializeModeScreen`. [#71](https://github.com/pactus-project/pactus-gui/pull/71)
    - Add/create `RemoteNodeSection` and `RadioButtonCubit` for handling remote node selection.
    - Update `RadioButtonGroup`, `CustomRadioButton`, `CustomInputRow`, and `CustomExpandableWidget`.
    - Add multi-language translation files for the new text.

- [Fix] : Resolve daemon config issue related to initialization on "Next" button click. [#71](https://github.com/pactus-project/pactus-gui/pull/71)
    - Update `FinishPage`.
    - Update `InitializeModeScreen`.
    - Update `MasterPasswordPage`.
    - Update `RestorationSeedPage`.
    - Update `ValidatorConfigScreen`.

# 1.16.0+18

- [Feat] : Implement macOS support for Daemon Execution.[#73](https://github.com/pactus-project/pactus-gui/pull/78)
- [Update] : Implement daemon execution support for Windows systems.[#73](https://github.com/pactus-project/pactus-gui/pull/78)
- [Update] : Move to run daemon by subprocess to get real-time stdout and stderr.[#73](https://github.com/pactus-project/pactus-gui/pull/78)
- [Fix] : Resolve build issue.[#73](https://github.com/pactus-project/pactus-gui/pull/78)
- [Update] : Replace pallet colors , from `onLightPallet` to `DarkPallet`. [#73](https://github.com/pactus-project/pactus-gui/pull/78)

/// to-do : there is a conflict here with issue 71 & 59 cuase both of them have same version & i accept the one that is done by me & changelog of issue 59 is removed!

# 1.15.0+17

- [Feat] : Implement `InitializingNavigationPane` for handling Pactus initializing panel. [#71](https://github.com/pactus-project/pactus-gui/pull/71)
  - Add/create `InitializingNavigationPane` and integrate each `panItem` for tabs based on Figma design.
  - Implement `NavigationPaneCubit` for managing selected tab index.
  - Add `dashboard_navigation_pane.dart` for future dashboard navigation panel integration.
  - Update `registrationRoutes` for proper navigation.
  - Provide `NavigationPaneCubit` in `main.dart`.
  - Add new variables in `.arb` files and generate updated translation files.
  - Add `navigationPanelEnableColor` & `navigationPanelDisableColor` to `AppColors`.

- [Feat] : Implement widgets of `InitializeModeScreen`. [#71](https://github.com/pactus-project/pactus-gui/pull/71)
  - Add/create `CustomInputWidget` component for text fields.
  - Add/create `CustomRadioButton` and `RadioButtonGroup` components.
  - Add new colors to `AppColors` for widget styling.
  - Update `InitializeModeScreen` for new widget integration.

- [Feat] : Add/create `CustomExpandableWidget` component. [#71](https://github.com/pactus-project/pactus-gui/pull/71)
  - Update `InitializeModeScreen` for better UI flow.

- [Update] : Fix stack issue for navigation in `InitializeModeScreen`. [#71](https://github.com/pactus-project/pactus-gui/pull/71)
  - Add/create `RemoteNodeSection` and `RadioButtonCubit` for handling remote node selection.
  - Update `RadioButtonGroup`, `CustomRadioButton`, `CustomInputRow`, and `CustomExpandableWidget`.
  - Add multi-language translation files for the new text.

- [Fix] : Resolve daemon config issue related to initialization on "Next" button click. [#71](https://github.com/pactus-project/pactus-gui/pull/71)
  - Update `FinishPage`.
  - Update `InitializeModeScreen`.
  - Update `MasterPasswordPage`.
  - Update `RestorationSeedPage`.
  - Update `ValidatorConfigScreen`.


# 1.14.0+16

- [Feat] : impl `WelcomeScreen` according to Figma design. [#70](https://github.com/pactus-project/pactus-gui/pull/70)
  - add some variables to arb files & generated translation files
  - rename `WelcomePage` to `WelcomeScreen` & update where it is used
  - impl `WelcomeScreen` widgets
  - add `primaryLight` color to AppColors
  - add some welcomeScreen png to project source
  - add/create `CustomFilledButton`

- [Update] : fix issue on pipeline about file generations [#70](https://github.com/pactus-project/pactus-gui/pull/70)
  - fix issue on pipeline about CodegenLoader class and file generations
  - fix issue on pipeline about assets file generations

# 1.13.0+15

- [Fix] : Fix conflicts between `fluent_ui.dart` and `material.dart` imports. [#67](https://github.com/pactus-project/pactus-gui/pull/67)
  - Flutter version upgraded to `3.27.3`.
  - Refactor `customized_widget/screens` by replacing `fluent_ui` widgets.
  - Remove duplicate folder `splash_screen`.

- [Feat] : Create `SeedGenerator` tools for generating secure and random seeds. [#67](https://github.com/pactus-project/pactus-gui/pull/67)

- [Update] : Modify `RestorationSeedPage` to include sample seed generation. [#67](https://github.com/pactus-project/pactus-gui/pull/67)
  - Fix color of text in `WelcomePage`.
  - Add 12 & 24 seed generation modes to `RestorationSeedPage`.
  - Modify `ValidatorConfigScreen` to add directory selector for initial node address setup.

- [Chore] : Add some packages/libraries. [#67](https://github.com/pactus-project/pactus-gui/pull/67)
  - `file_selector` for file and folder selection via native UI.
  - `bip39_mnemonic` for wallet seed generation.
  - `crypto`, `bcrypt`, and `convert` for secure layer.
  - `process_run` for running commands on daemon files.
  - Add `native_resources` directory to `.gitignore`.

# 1.12.0+14

- [Fix] : Resolved conflicts between `fluent_ui.dart` and `material.dart` imports. [#66](https://github.com/pactus-project/pactus-gui/pull/66)

- [Update] : Upgraded Flutter version to `3.27.3`. [#66](https://github.com/pactus-project/pactus-gui/pull/66)

- [Refactor] : Replaced `fluent_ui` widgets in `customized_widget/screens` for better compatibility. [#65](https://github.com/pactus-project/pactus-gui/pull/66)

# 1.11.0+13

- [Update] : Replaced *.json translation files with *.arb and edited contents. [#60](https://github.com/pactus-project/pactus-gui/pull/60)

- [Chore] : Removed `easy_localization` from project dependencies. [#60](https://github.com/pactus-project/pactus-gui/pull/60)

- [Feat] : Added new structure for building translations and switching themes. [#60](https://github.com/pactus-project/pactus-gui/pull/60)

- [Update] : Updated `build_runner.sh` file for generating translation files. [#60](https://github.com/pactus-project/pactus-gui/pull/60)

# 1.10.0+12

- [Refactor] : Migrate styles to `pactus-gui-widgetbook` package for consistency and maintainability. [#56](https://github.com/pactus-project/pactus-gui/pull/56)
  - Removed `InterTextStyles` and replaced with styles from the package.
  - Eliminated `surface` and `on_surface` palettes, adopting those from the package.
  - Removed fonts bundled in this project, utilizing package-provided fonts.
  - Updated all color palette references across the project.
  - Added `pactus-gui-widgetbook` to project dependencies.

- [Update] : Changed `pactus_gui_widgetbook` package URL to the updated repository location. [#56](https://github.com/pactus-project/pactus-gui/pull/56)

- [Fix] : Resolved theme-switching functionality issues after migration to `pactus-gui-widgetbook`. [#56](https://github.com/pactus-project/pactus-gui/pull/56)

# 1.9.1+11

- [Feature] : CI/CD Integration for Automated Release Builds and Notifications [#45](https://github.com/pactus-project/pactus-gui/pull/45)
  - feat: add some changes on theme configurations for using fluent_ui package

# 1.9.0+10

- [Feature] : Migrate to `Fluent UI` Framework/DesignSystem [#45](https://github.com/pactus-project/pactus-gui/pull/45)
  - feat: add some changes on theme configurations for using fluent_ui package

# 1.8.0+9

- [Feature] : Implement or replace the Easy Localization package for efficient localization management [#37](https://github.com/pactus-project/pactus-gui/pull/37)
  - feat(app): add inter text styles to app
  - update(app): update font weight in `pubspec.yaml`

# 1.7.0+8

- [Feature] : Implement or replace the Easy Localization package for efficient localization management [#40](https://github.com/pactus-project/pactus-gui/pull/40)
  - feat: add easy localization package to project
  - feat: reformat codes with dart reformat command
  - update: remove `l10n` from project
  - fix: fix translation files for `applications` text in `es` & `fr`
  - fix: fix configurations for `EasyLocalization` in `main.dart` file
  - fix: fix `applications` text in `SplashScreen` page
  - chore: update analyzer configuration to ignore generated files
  - ci: update `ci` for checking assets & translation files


# 1.6.0+7

- [Feature] : Implement `GoRouter` navigation system [#40](https://github.com/pactus-project/pactus-gui/pull/40)
  - feat: add `easy localization` package to project
  - feat: reformat codes with dart reformat command
  - update: remove `l10n` from project

# 1.5.0+6

- [Feature] : Implement `GoRouter` navigation system [#32](https://github.com/pactus-project/pactus-gui/pull/32)
  - feat(router): implement GoRouter navigation system
  - update(core:router): changing AppRoute get method's
  - fix(core:router): fix basic routes for correctly action of back button
  - fix(router/features): fix register routes for correctly action of back button

# 1.4.0+5

- [Feature] : Implement `ToolbarLogo` and `ThemeSwitcher` [#35](https://github.com/pactus-project/pactus-gui/pull/36)
  - feat: added `ToolbarLogo` and `ThemeSwitcher` as reusable components with UI implementation, tests, and documentation

# 1.3.0+4

- [Feature] : Implement Theme Management [#33](https://github.com/pactus-project/pactus-gui/pull/33)
  - feature(features:main:theme): add theme manager for switch between dark and light themes

# 1.2.0+3

- [Feature] : Implement Localization Management [#30](https://github.com/pactus-project/pactus-gui/pull/30)
  - feat(localization): integrate l10n_flutter with Bloc for language management

# 1.1.0+2

- [Feature] : Rewriting Project and Upgrading to Flutter 3.24.5 [#28](https://github.com/pactus-project/pactus-gui/pull/28)
  - feat: remove old project files and match code with flutter version `3.24.5`

# 1.0.0+1

- [Feature] : Implement multi-platform build targets, dashboard improvements, and enhanced wallet features
  - refactor(dashboard): refactor dashboard and transaction screen
  - feat(dashboard): add dashboard and transaction screens; adjust font sizes
  - feat(process): add process manager
  - refactor(code): apply pedantic linter rules
  - fix(build): resolve Linux run issue
  - fix(build): fix build on Linux (AMD64 only)
  - feat(daemon): add groundwork for daemon communication
  - feat(build): add Linux build target
  - feat(daemon): groundwork for running daemon within GUI context
  - feat(wallet): enable wallet creation on Windows and macOS
  - feat(build): add Windows build target
  - feat(build): add macOS build target
  - feat(dashboard): add remaining slides; core components for dashboard screen
  - fix(bugs): miscellaneous bug fixes
  - feat(recovery): rework paths for seed recovery or new seed generation
  - fix(ui): resolve issue with Windows main bar
  - feat(ui): update font, screen transition animation, and light/dark mode toggle
  - chore(dependencies): update dependencies
  - feat(validators): add incomplete number validator slide
  - refactor(auth): rework `master_password.dart`
  - feat(wallet): rework seed confirmation process
  - fix(wallet): resolve issues on wallet seed screen
  - feat(wallet): update seed confirmation process
  - fix(ui): apply scaling adjustments
  - feat(ui): set minimal window size
  - feat(wallet): add seed check and master password screens
  - feat(ui): add welcome screen (requires additional tweaks)
  - feat(wallet): add wallet seed generation
  - fix(theme): resolve automatic theme switching issue
  - feat(theme): enable automatic color mode selection based on system settings
  - feat(ui): add macOS-style bar for macOS users
  - fix(ui): apply minor UI adjustments
  - docs: create initial README.md
  - chore: clean up files and improve `.gitignore`
