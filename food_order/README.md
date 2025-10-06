Flutter Food Order App 🍕
A single-workflow food ordering application built with Flutter. This project demonstrates a clean, scalable, and testable mobile app architecture using the BLoC pattern for state management. The entire user journey, from selecting a restaurant to confirming an order, is implemented with a focus on SOLID principles and a great user experience.

📸 Screenshots
Replace the placeholder links below with your actual screenshots.

Restaurant List
<img width="373" height="792" alt="restaurant_list" src="https://github.com/user-attachments/assets/fa8b196b-a9d1-405b-b199-d3a7a91a4e21" />

Menu View
<img width="371" height="783" alt="menu_view" src="https://github.com/user-attachments/assets/c157281e-7e23-45e4-8462-6c6057182855" />

Cart View
<img width="373" height="798" alt="cart_view" src="https://github.com/user-attachments/assets/3981dca2-1edf-4f9b-9cac-cb5738b78176" />

Order Confirmation
<img width="368" height="784" alt="order_confirmation" src="https://github.com/user-attachments/assets/ec9e1170-5f16-44d3-9662-d093c11ddac9" />

✨ Features
Browse Restaurants: Fetches and displays a list of local restaurants from a mock repository.

View Menus: Select a restaurant to view its detailed menu.

Dynamic Cart: Add or remove items from the cart with real-time updates to the total price.

Place an Order: A simulated order placement process with loading and success/error states.

Order Confirmation: A clean and simple confirmation screen after a successful order.

Robust Error Handling: Implemented error states with a "Try Again" option for data-fetching failures.

🏛️ Architecture & Tech Stack
This project was built with a modern and robust architecture to ensure separation of concerns and testability.

State Management: BloC (Business Logic Component) using the flutter_bloc package to manage the state of the application in a predictable and reactive way.

Architecture: Clean Architecture principles with a feature-first folder structure. The code is divided into three main layers:

Data Layer: Handles data models and the mock repository that simulates API calls.

Business Logic Layer: Contains all the BLoCs and Cubits that manage the app's state.

Presentation Layer: Contains all the UI components (screens and widgets).

SOLID Principles: The codebase is structured to adhere to the five SOLID principles of object-oriented design.

Testing: Unit Tests for all BLoCs and Cubits using bloc_test and mockito to ensure the business logic is reliable and bug-free.

Dependency Injection: RepositoryProvider and BlocProvider are used to provide dependencies down the widget tree.

Design: A custom, aesthetically pleasing theme using Material Design components and google_fonts.

🚀 Getting Started
Follow these instructions to get the project up and running on your local machine.

Prerequisites
You must have the Flutter SDK installed on your machine.

An editor like VS Code or Android Studio with the Flutter plugin.

Installation & Setup
Clone the repository:

git clone [https://github.com/your-username/your-repository-name.git](https://github.com/your-username/your-repository-name.git)


Navigate to the project directory:

cd your-repository-name


Install the dependencies:

flutter pub get


Run the app:

flutter run


This will launch the app on your connected device or emulator.

🧪 Running the Unit Tests
This project has a full suite of unit tests for the business logic layer. To run them, execute the following command in your terminal:

flutter test


You should see a confirmation that all tests have passed.
