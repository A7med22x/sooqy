# 🛍️ Sooqy

## A Modern Flutter E-Commerce Application

A feature-rich and modern e-commerce application built with Flutter, designed to provide a smooth shopping experience from browsing products to checkout.

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.10.1-blue?logo=dart)
![BLoC](https://img.shields.io/badge/State%20Management-BLoC%20%2F%20Cubit-blueviolet)
![Architecture](https://img.shields.io/badge/Architecture-Clean%20Architecture-success)

🔗 **Repository:** [GitHub Repository](https://github.com/A7med22x/sooqy.git)

🎥 **Demo Video:** [Watch Demo](https://drive.google.com/file/d/1wZYhk7bfRf9Yta3BeKAW5LjRszhaLFHN/view?usp=drive_link)

📦 **Download APK:** [Download APK](https://drive.google.com/file/d/163r2plHIh3FV1w8fuHJOijM7k9QxhnOo/view?usp=drive_link)

---

## 🌟 About

**Sooqy** is a modern Flutter e-commerce application that provides users with a smooth and enjoyable shopping experience.

Users can browse products, manage their shopping cart, handle shipping addresses, apply discount coupons, select payment methods, and complete the checkout process.

The project follows a clean and scalable architecture using **BLoC/Cubit**, **Repository Pattern**, **Dartz**, and **Dependency Injection**.

---

## ✨ Features

* 🛍️ Browse and explore products
* 🛒 Shopping cart management
* 📍 Add, update, select, and remove addresses
* 🎟️ Browse and apply discount coupons
* 💳 Payment method selection
* 📋 Order review before checkout
* 🚀 Checkout integration
* ⚡ Reactive UI using BLoC / Cubit
* 🌐 REST API integration
* 🔐 Secure local storage
* 💾 Local caching
* 🎨 Clean and responsive UI

---

## 🧠 Architecture

The project follows a scalable architecture inspired by **Clean Architecture**.

```text
Presentation
     ↓
   Cubit
     ↓
  Use Case
     ↓
 Repository
     ↓
Data Source
     ↓
    API
```

### Architecture Layers

* 🎨 **Presentation:** UI, screens, widgets, and Cubit
* 🧠 **Domain:** Entities, repository contracts, and use cases
* 📦 **Data:** Models, data sources, and repository implementations

---

## 🧩 State Management & Dependency Injection

### State Management

The project uses **flutter_bloc** with **Cubit** for reactive state management.

* 🧠 Business logic handled by Cubit
* 🔄 Reactive UI updates
* ⚡ Loading, success, and error states

### Dependency Injection

The project uses:

* 🧩 `get_it`
* ⚙️ `injectable`

## 🎟️ Checkout Features

### 📍 Address Management

* Add new addresses
* View saved addresses
* Update existing addresses
* Remove addresses
* Select an address for checkout

### 🎟️ Coupon System

* View available coupons
* Enter a coupon code
* Apply discounts
* Review discounts before checkout

### 💳 Payment

Select a preferred payment method before completing an order.

---

## 📸 Screenshots

### Home Screen

![Home Screen](https://drive.google.com/file/d/1KmdBDC3WDGtvcjInXbuMeJCHo6-Q4UPM/view?usp=drive_link)

### Products

![Products Screen](https://drive.google.com/file/d/1tTYFyoj00KmR56tPRfVh2RpA3p4fCI95/view?usp=drive_link)

### Cart

![Cart Screen](https://drive.google.com/file/d/1xmWyBUqKf53bOjBwTN_3vevFsF5pK5II/view?usp=drive_link)

### Categories

![Categories Screen](https://drive.google.com/file/d/1X6QnxflFgkE_T6B67r4YTLRYc3u9v6kn/view?usp=drive_link)

📸 **More Screenshots:** [View All Screenshots](https://drive.google.com/drive/folders/1sL_VEdYEr_TxudG9UtVygDLFc3p9JFzM?usp=drive_link)

---

## 🎥 Demo Video

👉 [Watch the Sooqy App Demo](https://drive.google.com/file/d/1wZYhk7bfRf9Yta3BeKAW5LjRszhaLFHN/view?usp=drive_link)

---

## 📦 Download APK

👉 [Download the Latest APK](https://drive.google.com/file/d/163r2plHIh3FV1w8fuHJOijM7k9QxhnOo/view?usp=drive_link)

---

## 🛠️ Tech Stack

| Technology                | Usage                |
| ------------------------- | -------------------- |
| 💙 Flutter                | Mobile development   |
| 🎯 Dart                   | Programming language |
| 🧠 BLoC / Cubit           | State management     |
| 🌐 Dio                    | REST API integration |
| 🧩 GetIt + Injectable     | Dependency injection |
| 🧱 Clean Architecture     | Project architecture |
| 🔄 Dartz                  | Error handling       |
| 💾 SharedPreferences      | Local storage        |
| 🔐 Flutter Secure Storage | Secure storage       |
| 🖼️ Cached Network Image   | Image caching        |
| 🎨 Flutter SVG            | SVG support          |
| 📱 Flutter ScreenUtil     | Responsive UI        |
| 🎞️ Lottie                 | Animations           |

---

## 📁 Project Structure

```text
lib/
├── core/
│   ├── network/
│   ├── resources/
│   ├── routes/
│   ├── utils/
│   └── widgets/
│
├── features/
│   ├── authentication/
│   ├── home/
│   ├── products/
│   ├── cart/
│   └── checkout/
│       ├── data/
│       ├── domain/
│       └── presentation/
│
└── main.dart
```

---

## ⚙️ Getting Started

### Clone the Repository

```bash
git clone https://github.com/A7med22x/sooqy.git
```

### Navigate to the Project

```bash
cd sooqy
```

### Install Dependencies

```bash
flutter pub get
```

### Run the Application

```bash
flutter run
```

---

## 🎨 Assets

```text
assets/
├── images/
├── icons/
├── animations/
└── fonts/
```

The application uses the **Cairo** font family.

---

## 📱 App Icon & Splash Screen

* 📱 App icon configured with `flutter_launcher_icons`
* ✨ Splash screen configured with `flutter_native_splash`

---

## 👨‍💻 Author

Ahmed Abd El-Moniem

Flutter Developer

---

## 📄 License

This project is developed for **educational and portfolio purposes**.

---

### 🛍️ Built with ❤️ using Flutter

⭐ If you like this project, consider giving it a star!
