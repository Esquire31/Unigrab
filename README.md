![Flutter](https://img.shields.io/badge/Flutter-3.x-blue)   ![Status](https://img.shields.io/badge/Status-In%20Development-blue)

# UniGrab - Food Ordering Made Easy

UniGrab is a seamless food ordering app for university campuses, allowing users to browse restaurant menus, customize orders, and make payments directly through the app. The app also helps restaurants manage their orders efficiently.

---

## Table of Contents

- [Features](#features)
- [Demo](#demo)
- [Installation](#installation)
- [Usage](#usage)
- [Technologies Used](#technologies-used)
- [Project Structure](#project-structure)
- [Future Improvements](#future-improvements)

---

## Features

- **Restaurant Listings**: Browse a variety of restaurants and their detailed menus with pricing and ratings.
- **Food Ordering**: Add items to the cart, customize orders (e.g., toppings, spice level), and place orders with ease.
- **Order Tracking**: Real-time updates on order status, including preparation and delivery.
- **Payment Integration**: Supports multiple payment options, including UPI, credit/debit cards, and wallets.
- **User-Friendly Design**: A sleek, intuitive interface designed for students and campus restaurants.

---

## Demo

### Home Page
- A visually appealing page showcasing:
  - Restaurant categories
  - Search functionality
  - Featured restaurants and offers

### Restaurant Page
- Displays:
  - Restaurant name, rating, and opening hours
  - Menu with categorized food items (e.g., appetizers, main course, desserts)

### Order Tracking
- Real-time updates, including:
  - Order preparation status
  - Estimated delivery time

---

## Installation

Follow these steps to set up and run UniGrab locally:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/unigrab.git
   cd unigrab
   
2. **Install Flutter and Dart**:
   - Follow the [Flutter installation guide](https://flutter.dev/docs/get-started/install)
   - Verify installation:
   ```bash
   flutter doctor
   ```

3. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

4. **Set Up Firebase**:
   - Create a new project in Firebase Console
   - Download configuration files:
     - Place `google-services.json` in `android/app/`
     - Place `GoogleService-Info.plist` in `ios/Runner/`

5. **Run the App**:
   ```bash
   flutter run
   ```

6. **Run Tests**:
   ```bash
   flutter test
   ```

---

## Usage
1. Launch the app and create an account or log in
2. Browse through restaurants or search for specific items
3. Add food items to the cart and customize as needed
4. Complete payment using your preferred method
5. Track your order in real-time

---

## Technologies Used
- **Frontend**:
  - Flutter
  - Dart
- **Backend**:
  - Firebase Authentication
  - Firebase Firestore
  - Firebase Cloud Functions
- **Real-Time Updates**:
  - Firebase Cloud Messaging
- **Payment Integration**:
  - Razorpay API
  - Stripe (optional)
- **Design**:
  - Material Design principles

---

## Project Structure
```
unigrab/
├── lib/           # Main application code
│   ├── screens/   # Screens for different pages
│   ├── models/    # Data models
│   ├── services/  # Services for Firebase, API calls
│   ├── widgets/   # Reusable components
├── assets/        # Images, icons, static files
├── android/       # Android configuration
├── ios/          # iOS configuration
├── test/         # Unit and widget tests
├── pubspec.yaml  # Flutter project configuration
└── README.md     # Project documentation
```

---

## Future Improvements
- **Advanced Search and Filters**:
  - Filter by cuisine, ratings, price range
  - Dietary preference options

- **AI Recommendations**:
  - Personalized restaurant suggestions
  - Order history-based recommendations

- **Enhanced Features**:
  - Multi-language support
  - Delivery service integration
  - Subscription plans
  - Dark mode
  - Restaurant admin panel
