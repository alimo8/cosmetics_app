# Cosmetics App

Cosmetics App is a modern Flutter application designed for beauty and cosmetics shopping. The app provides users with a seamless experience to browse, search, and purchase a wide range of cosmetic products. It features a clean UI, smooth navigation, and robust state management using Bloc.

## Features

- **Onboarding Screens:** Welcome and guide new users through the app’s features.
- **Authentication:** Secure login and account verification.
- **Home Page:** Displays top-rated and most-ordered products with promotional banners.
- **Categories:** Browse products by category.
- **Product Details:** View detailed information and images for each product.
- **Cart:** Add products to the cart and manage quantities.
- **Checkout:** Review payment details and complete purchases.
- **Profile:** View and edit user information, order history, wallet, and vouchers.
- **Search:** Quickly find products using the search bar.
- **Responsive Design:** Optimized for all screen sizes using `flutter_screenutil`.
- **State Management:** Uses `flutter_bloc` for efficient state handling.
- **Networking:** Fetches data from Firebase Realtime Database using Dio.

## Technologies Used

- **Flutter**: UI toolkit for building natively compiled applications.
- **Dart**: Programming language for Flutter.
- **Firebase Realtime Database**: Backend for storing product and user data.
- **Dio**: Powerful HTTP client for Dart/Flutter.
- **Bloc**: State management library.
- **Lottie**: For beautiful animations.
- **Google Maps Flutter**: For location-based features.

## Project Structure

```
lib/
  core/
    logic/
    networking/
    ui/
  views/
    auth/
    home/
      cubit/
      model/
      pages/
      repo/
    on_boarding.dart
    splash.dart
    check_out.dart
    ...
assets/
  icons/
  images/
  lotties/
android/
ios/
```

## Getting Started

1. **Clone the repository:**
   ```
   git clone https://github.com/alimo8/Cosmetics_App.git
   ```
2. **Install dependencies:**
   ```
   flutter pub get
   ```
3. **Run the app:**
   ```
   flutter run
   ```

## APK Download

You can download the latest APK from the following link:
[Download APK](https://drive.google.com/file/d/1lE0T_68sqJ8Utwz9JX31h9Al3HUTcqju/view?usp=sharing)


## Contributing

Contributions are welcome! Please fork the repository and submit a pull request for any improvements or bug fixes.


