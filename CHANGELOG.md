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
