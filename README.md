
# 🧠 Task Given by Nineti GmbH

A  Flutter application that demonstrates user management, local caching, search, pagination, pull-to-refresh, and state management using Bloc.

---

## 🚀 Setup Instructions

### Prerequisites

- Flutter SDK (version 3.10+ recommended)
- Dart SDK
- Android/iOS emulator or real device

### Steps to Run

1. **Clone the repository**
   ```bash
   git clone https://github.com/unim26/Nineti-GmbH_task.git
   cd Nineti-GmbH_task
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

> ⚠️ Make sure your emulator or physical device is connected and running.

---

## 📌 Project Overview

This Flutter app fetches user data, posts, and todos from a remote API. It supports the following features:

- 🔍 Search users by name
- 🌐 Fetch users, posts, and todos from an API
- 💾 Create and  Save posts locally 
- 🧭 Navigation with GetX
- ⬇️ Pull to refresh
- 🌓 Theme switching (light/dark mode)
- 📦 State management with Bloc


---

## 🏗️ Architecture Explanation

The project is based on the **Clean Architecture** approach, structured in three core layers:

### 1. **Data Layer**
Responsible for fetching data from remote or local sources.
- `remote`: Uses Dio for REST API communication.
- `local`: Manages local caching (e.g., using in-memory/local classes).
- Converts models to domain entities.

### 2. **Domain Layer**
Contains:
- `Entities`: Pure Dart classes (e.g., `UserEntity`, `PostEntity`)
- `Repositories`: Interfaces used by the app
- `UseCases`: Business logic that connects UI and data sources

### 3. **Presentation Layer**
Handles UI and state management.
- Uses `Bloc` for managing UI state.
- `Events` trigger logic, `States` represent UI state.
- Contains pages, widgets, and bloc listeners/builders.

### Additional Tools
- **GetIt**: Used for dependency injection via `locator.dart`.
- **GetX**: Used for routing/navigation.
- **Dio**: Handles network requests with interceptors.
- **Equatable**: Simplifies equality comparison in entities and states.

---

## Images

<p align="center">
  <img src="https://github.com/user-attachments/assets/c04aab2c-aa9c-409f-89d9-ac802d3b0723" width="200"/>
  <img src="https://github.com/user-attachments/assets/d901c018-5b06-49e4-a19d-ae913c9e173f" width="200"/>
  <img src="https://github.com/user-attachments/assets/72a25b26-2c30-4967-8b4f-31db7d9a1b75" width="200"/>
  <img src="https://github.com/user-attachments/assets/aed49f21-dc57-49ae-9926-2bfa4fe54cca" width="200"/>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/d6695075-6f58-412a-ab62-3e86a470d158" width="200"/>
  <img src="https://github.com/user-attachments/assets/6436a271-01fd-4cff-bb37-bf7b2281f9c5" width="200"/>
  <img src="https://github.com/user-attachments/assets/9c9aa592-cf31-44cc-be8b-a4da64c5b4e8" width="200"/>
  <img src="https://github.com/user-attachments/assets/63bdd88a-55ae-408e-aa0c-cdb6ed0d8f6c" width="200"/>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/21530f9a-87db-42fa-9737-13e71d79646c" width="200"/>
  <img src="https://github.com/user-attachments/assets/f1ad421a-9aba-458e-b523-9b58d4e6e8aa" width="200"/>
  <img src="https://github.com/user-attachments/assets/9fe4329b-d0f6-48a7-9c93-4dc5f67754d5" width="200"/>
  <img src="https://github.com/user-attachments/assets/0f2e22fe-4bc1-4657-b9da-606ba040edd8" width="200"/>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/6b2b445b-6592-4cc5-a4e4-3b747f41cd79" width="200"/>
  <img src="https://github.com/user-attachments/assets/f2412375-fdb7-474b-b861-5080280044f7" width="200"/>
  <img src="https://github.com/user-attachments/assets/06863762-1cfb-45d2-bdf7-607833c1b671" width="200"/>
  <img src="https://github.com/user-attachments/assets/58932d02-068e-4382-aa49-155ca415f373" width="200"/>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/89f11810-8b18-48a8-a675-540b6ff184e9" width="200"/>
</p>



---

## Videos

https://github.com/user-attachments/assets/18724d69-e5de-4bbb-adf2-153c137af7b2




---


## 📁 Folder Structure






```
lib/
├── core/
├── features/
│   ├── posts/
│   ├── todos/
│   └── users/
├── locator.dart
└── main.dart
```
