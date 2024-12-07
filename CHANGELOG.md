# 1.4.0+5

- Implement `ToolbarLogo` and `ThemeSwitcher` 
  - feat: added `ToolbarLogo` and `ThemeSwitcher` as reusable components with UI implementation, tests, and documentation [#35](https://github.com/pactus-project/pactus-gui/pull/36)

# 1.3.0+4

- Implement Theme Management
  - feature(features:main:theme): add theme manager for switch between dark and light themes [#33](https://github.com/pactus-project/pactus-gui/pull/33)

# 1.2.0+3

- Implement Localization Management
  - feat(localization): integrate l10n_flutter with Bloc for language management [#30](https://github.com/pactus-project/pactus-gui/pull/30)

# 1.1.0+2

- Rewriting Project and Upgrading to Flutter 3.24.5
    - feat: remove old project files and match code with flutter version `3.24.5` [#28](https://github.com/pactus-project/pactus-gui/pull/28)

# 1.0.0+1
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
