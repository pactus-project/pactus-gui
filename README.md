# Pactus GUI


The official graphical user interface for the Pactus blockchain, built with Flutter.

## Purpose
Pactus GUI aims to democratize access to blockchain technology by providing an intuitive interface that bridges the gap between complex blockchain operations and user-friendly interaction. Our primary objectives are:

1. **Accessibility**: Make blockchain technology approachable for users of all technical levels
2. **Security**: Maintain the highest security standards while providing a seamless user experience
3. **Decentralization**: Empower users to participate in the network without compromising decentralization principles
4. **Education**: Provide clear guidance and information to help users understand blockchain concepts
5. **Interoperability**: Ensure compatibility across multiple platforms and devices

## Key Features
Pactus GUI offers a comprehensive suite of features designed to meet the needs of both casual users and blockchain enthusiasts:

### Core Functionality
- **Wallet Management**:
  - Create and manage multiple wallets with secure seed phrase backup
  - Import/export wallet functionality with encryption
- **Node Operation**:
  - Run a Pactus node in Full or Pruned mode
  - Real-time node status monitoring
  - Network health and connectivity diagnostics
- **Validator Setup**:
  - Step-by-step validator configuration
  - Staking management and reward tracking
  - Validator performance analytics

### Transaction Handling
- Send and receive transactions with intuitive interfaces
- Transaction history with detailed information
- Address book for frequently used addresses
- Multi-signature transaction support

### Blockchain Interaction
- Real-time account balance and transaction history
- Validator information and network statistics
- Block explorer integration
- Smart contract interaction (future implementation)

### User Experience
- Multi-language support
- Dark/Light theme options
- Responsive design for various screen sizes
- Accessibility features for visually impaired users
- Comprehensive help and documentation

### Security Features
- Biometric authentication support
- Hardware wallet integration
- Transaction confirmation safeguards
- Security audit trail
- Regular security updates and patches

## Figma Design
Explore our UI/UX design and components in Figma:
[Figma Design](https://www.figma.com/design/jejFb35BStREUTPhiB9qIU/Pactus-Applications-(Community)?node-id=0-1&p=f&t=XozGWB5eaN68OdVJ-0)

## Widget Book
We use Widget Book for documenting and showcasing our UI components:
[Widget Book](https://github.com/pactus-project/pactus-gui-widgetbook)

The Widget Book serves as:
- A living style guide for the application
- A component library for developers
- A visual documentation of all UI elements

## Requirements
- [Flutter 3.13.0 or higher](https://docs.flutter.dev/get-started/install)
- [Dart 3.1.0 or higher](https://dart.dev/get-dart)
- Android Studio/VSCode with Flutter plugin
  - [Android Studio](https://developer.android.com/studio)
  - [Visual Studio Code](https://code.visualstudio.com/)
- [Android SDK](https://developer.android.com/studio#command-tools) (for Android builds)
- [Xcode](https://developer.apple.com/xcode/) (for iOS builds)

## Getting Started

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/pactus-project/pactus-gui.git
   cd pactus-gui
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

### Build and Run
Use the build runner script to handle all build and run operations:

```bash
# Make the script executable
chmod +x build_runner.sh

# Run the script
./build_runner.sh
```

You'll be presented with two options:
1. **Automatic Execution**: Handles all build processes and runs the application
2. **Re-Generate Asset Files**: Only regenerates asset files

### Manual Commands
If you prefer to run commands manually:

```bash
# Generate localization files
flutter gen-l10n --output-dir=lib/l10n --arb-dir=lib/l10n

# Run build runner
flutter pub run build_runner build --delete-conflicting-outputs

# Run the application
flutter run
```

## Contributing
We welcome contributions to the Pactus GUI project! Please follow these guidelines to ensure your contributions align with our standards.

### Before You Contribute
1. **Understand the Project**: Familiarize yourself with the project goals and architecture
2. **Check Figma Design**: Verify if the component or feature you're working on exists in our [Figma Design](https://www.figma.com/design/jejFb35BStREUTPhiB9qIU/Pactus-Applications-(Community)?node-id=0-1&p=f&t=XozGWB5eaN68OdVJ-0)
3. **Review Widget Book**: Check our [Widget Book](https://github.com/pactus-project/pactus-gui-widgetbook) for existing components

### Code Guidelines
- Follow clean code principles as outlined in Robert C. Martin's "Clean Code"
- Write comprehensive tests for new code or changes
- Ensure all tests pass before submitting a pull request
- Maintain consistent code style and formatting

### Commit Guidelines
We use Conventional Commits format for commit messages and PR titles. Follow these rules:

#### Commit Types
| Type      | Description                                      |
|-----------|--------------------------------------------------|
| fix       | A bug fix                                        |
| feat      | A new feature                                    |
| docs      | Documentation changes                            |
| test      | Adding or correcting tests                       |
| build     | Build system or dependency changes               |
| ci        | CI configuration changes                         |
| perf      | Performance improvements                         |
| refactor  | Code changes that don't fix bugs or add features |
| style     | Formatting, white-space, etc.                    |
| chore     | Other changes not modifying src/test files       |

#### Commit Scope
Specify which part of the code is affected (e.g., wallet, validator, ui). Multiple scopes can be used if changes impact several areas.

#### Commit Message Format
- Keep under 50 characters
- Start with lowercase letter
- No ending punctuation
- Use imperative mood (e.g., "fix bug" not "fixed bug")

Examples:
- Correct ✅: "feat(wallet): add biometric authentication"
- Incorrect ❌: "feat(wallet): Added biometric authentication."

### Code Review Process
Your PR will go through these checks:
1. Flutter environment setup (v3.27.3)
2. Dependency installation (`flutter pub get`)
3. Localization file generation (`flutter gen-l10n`)
4. Localization file verification
5. Code formatting check (`dart format .`)
6. Code analysis (`flutter analyze`)
7. Test execution (`flutter test`)
8. Final merge check

### After Submission
- **If Approved**: Your PR will be merged into main
- **If Rejected**: You'll receive feedback for improvements

### Reporting Issues
When reporting bugs, include:
- Detailed reproduction steps
- Environment information
- Suggested fixes if possible

### Code of Conduct
We follow the Contributor Covenant Code of Conduct. Please read it before contributing.

[Read the full Code of Conduct](https://www.contributor-covenant.org/version/2/1/code_of_conduct/)
