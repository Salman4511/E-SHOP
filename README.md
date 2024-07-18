
# E-SHOP

## Overview
This is a Flutter-based e-commerce application that showcases products from a public API. It integrates Firebase Authentication and Firebase Remote Config to manage user authentication and configuration settings. The app also calculates and displays discounted prices based on a remote config setting.

## Features
- **Firebase Authentication**: Email-based sign-up and login.
- **Firestore Integration**: Stores user details (name and email) in Firestore.
- **Products Feed**: Displays a list of products fetched from [DummyJSON](https://dummyjson.com/products).
- **Discount Calculation**: Calculates and displays discounted prices based on the `discountPercentage` field from the API.
- **Firebase Remote Config**: Controls whether to display the discounted price or the original price.

## ScreenShots

<img src="https://github.com/user-attachments/assets/edea48c8-da45-4ee2-8dce-eaa8d122a518" alt="" width="300px">
<img src="https://github.com/user-attachments/assets/2d9a1b4b-a59c-4a8e-9f27-09e82fc63415" alt="" width="300px">
<img src="https://github.com/user-attachments/assets/7df94127-3bfb-4e21-931c-5eb43d37c3d2" alt="" width="300px">


## Getting Started

### Prerequisites
- Flutter >= 2.2.0
- Firebase project setup (Firestore, Authentication, Remote Config)

### Installation

1. **Clone the repository**:
 
   git clone https://github.com/yourusername/ecommerce-app.git
   cd ecommerce-app
  

2. **Install dependencies**:
 
   flutter pub get

3. **Set up Firebase**:
   - Create a Firebase project.
   - Enable Firestore, Authentication (Email/Password), and Remote Config.
   - Download `google-services.json` and place it in the `android/app` directory.

4. **Configure Firebase Remote Config**:
   - Create a boolean parameter named `showDiscountedPrice` and set its default value as `true`.

### Running the App

- **Android**:
  
  flutter run

- **iOS**:
 
  flutter run

## Project Structure

```plaintext
lib/
│
├── main.dart                # Entry point of the application
├── models/                  # Directory for data models
│   ├── product_model.dart   # Product data model
│   └── user_model.dart      # User data model
├── views/                   # Directory for UI components
│   ├── signin_screen.dart      # Login screen
│   ├── signup_screen.dart     # Signup screen
│   └── products_screen.dart   # Product feed screen
├── controllers/             # Directory for business logic and state management
│   ├── auth_controller.dart # Authentication controller
│   ├── product_controller.dart # Product controller
├── services/                # Directory for services
│   ├── auth_service.dart    # Firebase Authentication service
│   ├── product_service.dart # Service to fetch products from API
│  
└── widgets/                 # Directory for reusable UI components
    └── product_card.dart    # Widget for product card
    ├── text_form_widget.dart # reusable authentication textformfield

## Usage

### Authentication

- **Sign Up**:
  - Users can sign up using their email and password.
  - User details (name and email) are stored in Firestore.

- **Login**:
  - Users can log in using their registered email and password.

### Products Feed

- The product feed displays a list of products fetched from [DummyJSON](https://dummyjson.com/products).
- Each product card shows:
  - Product image
  - Product title
  - Product description
  - Actual price
  - Discounted price
  - discount percent

 the discounted price is calculated and displayed using the formula:
 discountedPrice = actualPrice * (1 - discountPercentage / 100)
 

## Error Handling

- Implemented robust error handling for API and Firebase interactions.
- Displays appropriate error messages using SnackBar.

## State Management

- Utilized the Provider package for state management.

## APK

- Download the APK from [this Google Drive link]([https://drive.google.com/link-to-your-apk](https://drive.google.com/file/d/1kppEvm5szYtNZfFSMKVB45aH1klYKZDb/view?usp=drive_link)).

