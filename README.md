# 🍎 Fruit Hub - E-commerce Mobile Application

A modern, cross-platform fruit delivery e-commerce application built with Flutter. Fruit Hub provides a seamless shopping experience with secure authentication, real-time updates, and multiple payment options.

## ✨ Features

- 🔐 **Multi-Authentication**: Google, Facebook, Apple, and Email/Password sign-in
- 🛒 **Shopping Cart**: Add, remove, and manage items with persistent storage
- ❤️ **Favorites**: Save and manage your favorite products
- 💳 **Payment Integration**: Secure checkout with PayPal
- 🌍 **Multi-language Support**: Arabic and English localization
- 📱 **Cross-Platform**: iOS, Android, Web, and Desktop support
- 🔄 **Real-time Updates**: Live data synchronization with Firebase
- 🎨 **Modern UI**: Beautiful Material Design with custom Cairo fonts
- 📍 **Address Management**: Shipping address input and validation
- ⭐ **Product Reviews**: Rating and review system

## 🛠️ Tech Stack

- **Frontend**: Flutter, Dart
- **State Management**: BLoC Pattern with Cubit
- **Backend**: Firebase (Authentication, Firestore)
- **Payment**: PayPal API
- **Authentication**: Google Sign-In, Facebook Auth, Apple Sign-In
- **Local Storage**: SharedPreferences
- **UI Components**: Custom widgets, SVG support, responsive design

## 🏗️ Architecture

The project follows Clean Architecture principles with proper separation of concerns:

```
lib/
├── core/           # Shared utilities, services, and widgets
├── features/       # Feature-based modules
│   ├── authentication/
│   ├── home/
│   ├── checkout/
│   ├── best_selling_fruits/
│   ├── on_boarding/
│   └── splash/
└── main.dart       # Application entry point
```

## 📱 Screenshots

*[Add your app screenshots here]*

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (^3.6.0)
- Dart SDK
- Android Studio / VS Code
- Firebase project setup

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/fruit_hub.git
   cd fruit_hub
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**
   - Create a Firebase project
   - Add your Android/iOS apps
   - Download and add configuration files:
     - `google-services.json` for Android
     - `GoogleService-Info.plist` for iOS

4. **Run the app**
   ```bash
   flutter run
   ```

## 🔧 Configuration

### Firebase Configuration

1. Enable Authentication methods in Firebase Console
2. Configure Firestore database
3. Set up security rules
4. Add your app's bundle ID/package name

### PayPal Configuration

1. Create PayPal developer account
2. Configure client ID and secret
3. Update payment configuration in the app

## 📁 Project Structure

```
lib/
├── core/
│   ├── cubits/          # Shared state management
│   ├── entities/        # Core business entities
│   ├── models/          # Data models
│   ├── repositories/    # Data access layer
│   ├── services/        # External services
│   ├── utils/           # Utility functions
│   └── widgets/         # Reusable UI components
├── features/
│   ├── authentication/  # User authentication
│   ├── home/           # Main app interface
│   ├── checkout/       # Order processing
│   ├── best_selling_fruits/  # Featured products
│   ├── on_boarding/    # App introduction
│   └── splash/         # Loading screen
└── main.dart
```

## 🎯 Key Features Implementation

### Authentication System
- Secure user registration and login
- Social media authentication integration
- User session management

### Shopping Experience
- Product browsing and search
- Cart management with local persistence
- Favorite products system
- Real-time inventory updates

### Checkout Process
- Address input and validation
- Order summary and confirmation
- Secure payment processing
- Order tracking

## 🔒 Security Features

- Secure authentication with Firebase
- Data encryption in transit
- Input validation and sanitization
- Secure payment processing

## 🌐 Internationalization

The app supports multiple languages:
- English (en)
- Arabic (ar)

Localization files are located in `lib/l10n/` and generated files in `lib/generated/`.

## 📱 Platform Support

- ✅ Android (API 21+)
- ✅ iOS (12.0+)
- ✅ Web
- ✅ Desktop (Windows, macOS, Linux)

## 🚀 Deployment

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Your Name**
- GitHub: [@yourusername](https://github.com/yourusername)
- LinkedIn: [Your LinkedIn](https://linkedin.com/in/yourprofile)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for backend services
- PayPal for payment integration
- All contributors and supporters

## 📞 Support

If you have any questions or need help, please open an issue on GitHub or contact me directly.

---

⭐ **Star this repository if you found it helpful!**
