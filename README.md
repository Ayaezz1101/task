# Flutter Authentication System - Firebase Integrated 

A professional Flutter implementation featuring a secure authentication flow (Onboarding, Sign-In, and Sign-Up) with a focus on **Clean Architecture**, **Firebase Integration**, and **User Experience**.

---

## Key Features

* **Firebase Authentication:** Integrated with Firebase to handle real-time user registration and secure login.
* **Google Social Login:** Support for Google Sign-In using OAuth2.
* **Auth Service Provider:** Abstracted backend logic into a dedicated `AuthService` class for better maintainability.
* **Robust Form Validation:** Implemented custom validation logic for:
    * **Email:** Regex-based format checking.
    * **Password:** Minimum length and "Confirm Password" matching logic.
    * **Phone Number:** Length and digit verification.
* **Custom Spring Routing:** Physics-based transitions (`SpringPageRoute`) using `dart:physics` for a premium feel (Mass: 1, Stiffness: 45, Damping: 15).
* **Reusable Component Architecture:** Modular UI using custom-built widgets (`AppPrimaryButton`, `AppTextField`, `AppPasswordField`).

---

## Tech Stack & Tools

 **Framework:** Flutter (Latest Version)
 **Backend:** Firebase Authentication
 **Language:** Dart
 **Design Tool:** Figma (Pixel-perfect implementation)
 **State Management:** StatefulWidget (Local state & UI logic)

---

## Screenshots

| Onboarding | Sign-In | Sign-Up |
| :---: | :---: | :---: |
| <img src="assets/images/screenshots/onboarding.jpg" width="200"/> | <img src="assets/images/screenshots/sign_in.jpg" width="200"/> | <img src="assets/images/screenshots/sign_up.jpg" width="200"/> |

---

## Installation

Follow these steps to run the project locally:

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/Ayaezz1101/task.git
    ```
2.  **Firebase Setup**:
    * Add your `google-services.json` to `android/app/`
    * Add your `GoogleService-Info.plist` to `ios/Runner/`
3.  **Install dependencies**:
    ```bash
    flutter pub get
    ```
4.  **Run the app**:
    ```bash
    flutter run
    ```

## Project Structure
```text
lib/
├── pages/         # Authentication screens (SignIn, SignUp, Onboarding)
├── widgets/       # Reusable UI components (AppPrimaryButton, AppTextField)
├── services/      # Firebase Logic (AuthService.dart)
├── theme/         # Centralized styles and AppTheme constants
└── routing/       # Custom physics transitions (SpringPageRoute)