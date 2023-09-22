# Report <br> Development of a To-Do Application in Flutter with Firestore Integration

Author: Szymon Zinkowicz 5181814  
Date: 2023-09-22  

## Abstract

This report documents the development process, architecture, and functionalities of a Flutter-based To-Do application that leverages Firestore as its database and integrates various advanced features including geolocation, OAuth, user preferences for themes, and advanced UI components.

## Introduction

### Purpose of the Application

The application serves as a versatile to-do list management tool allowing users to create notes with text, images, geolocalization, and dates.

### Technologies Used

- Dart
- Flutter
- Firestore
- Google OAuth
- Google Maps (For geolocation feature)
- BloC Pattern

## System Architecture

### Overview

The project follows a clean, modular architecture that separates different features and functionalities into corresponding folders, making the project maintainable and scalable. Here is a simplified overview of the key directories:

- Features: Contains subdirectories for home, login, and theme, each holding data, domain, and presentation layers.
- Services: Holds repository_firestore.dart related to Firestore services.
- App Files: Contains app.dart, config.dart, firebase_options.dart, and main.dart, crucial for app configuration and running.

## Feature-Based Structure

- features folder: Holds the home, login, and theme features.
- services folder: Contains Firestore repository service.
- Root folder: Consists of the main.dart, app.dart and configuration files.

## Key Features

- Notes Functionality: Users can add, preview, and manage notes, each containing text, images, geolocalization, and date.
- User Authentication: Utilizes Google's oAuth system for secure, reliable user authentication.
- Geolocation Integration: Notes include geolocation, allowing integration with map apps to point towards the noted location.
- Theme Preferences: Users can choose between light and dark themes according to their preferences.

## Implementation Details

### Libraries and Dependencies

The pubspec.yaml file lists the dependencies and dev_dependencies required for the project. Some key libraries include:

- flutter_bloc and freezed: For state management and immutable classes.
- google_sign_in and firebase_core: For user authentication and Firebase integration.
- cloud_firestore and firebase_storage: For data storage and retrieval from Firestore and Firebase Storage.
- image_picker, google_maps_flutter, url_launcher: For image picking, Google Maps integration, and URL launching.
- shimmer: For loading animations.
- flutter_dotenv: To manage environment variables, like API keys, securely.

### Handling API Keys

For securely managing API keys, this project uses the flutter_dotenv package, which allows storing configuration variables in .env files. This enables keeping sensitive information, like API keys, out of the codebase, reducing the risk of exposure. The .env.prod file is referenced in the assets section of pubspec.yaml.
Data Management and State Handling:

- Firestore Database: Serves as the backend, storing user notes and associated data.
- Bloc Pattern: Implemented using flutter_bloc for scalable and efficient state management across various components.
- Freezed Package: Assists in creating immutable classes, contributing to robust, error-free code.

## User Interface

- Home Page: Displays a preview of the notes in a list format with options to add new notes.
- Login Page: Facilitates user authentication through Google oAuth.
- Add Note Page: Allows users to add notes with multiple attributes and view them in detail.
- Theme Management: A dedicated feature enabling users to toggle between light and dark themes.

## Authentication and Authorization

The AuthorizationRepository handles user authentication using Google's oAuth system, providing secure and reliable access to the application.

### Bloc Pattern

- Utilized for state management to efficiently handle the state of UI components and ensure a clean, maintainable codebase.

### Firestore Integration

- Serves as the database to store notes, user information, and other relevant data securely and efficiently.

### UI Components

- Shimmer: Integrated shimmer package to provide sleek loading animations to enhance user experience.
- Floating Buttons: Animated floating buttons that can split into different buttons as needed.

## Challenges and Solutions

- __Challenge__ 1: Acquiring Proficiency in Dart

  - __Learning Outcome__:
        Dart, being the backbone of Flutter, necessitated a learning curve. It emerged as an intuitive language, with the richness of its libraries and the coherence of its documentation, easing the transition. Mastery over Dart enabled the efficient utilization of Flutter, unlocking the capabilities to develop refined, performant applications.

- __Challenge__ 2: Navigating through Flutter Framework

  - __Learning Outcome__:
        Flutter extended an opportunity to develop applications that are cross-platform and maintain a single codebase, making it crucial to the project. The comprehensive framework posed initial challenges but soon revealed its potency in expediting the developmental cycle and enhancing application quality, adaptability, and user experience.

- __Challenge__ 3: Incorporating Bloc Pattern

  - __Learning Outcome__:
        The Bloc Pattern introduced a structured and scalable approach to state management. The methodological understanding of this architecture illuminated its efficiency in managing states across various components, promoting code modularity, readability, and easing the debugging process.

- __Challenge__ 4: Integration with Firestore Database

  - __Learning Outcome__:
        Firestore, with its robust and secure data storage capabilities, played a pivotal role. Navigating its intricacies presented challenges, however, mastering its usage enabled secure, efficient, and real-time data storage and retrieval, ensuring data integrity and accessibility.

- __Challenge__ 5: Implementing Google oAuth Authentication

  - __Learning Outcome__:
        Integrating Google oAuth necessitated an understanding of secure authentication practices. The incorporation of this system validated its reliability and security in user authentication processes, ensuring user data protection and secure access to application features and data.

- __Challenge__ 6: Environmental Setup - FVM, Flutter, Android Studio, VS Code

  - __Learning Outcome__:
        The multi-faceted environment setup involved the integration of FVM, Android Studio, VS Code, among other tools. Although the setup phase was intricate and demanded meticulous attention, it offered insights into the synchronization of various development tools and technologies, contributing to a smoother, more cohesive development experience.

Reflective Conclusion:

    These challenges shaped the learning trajectory, each presenting unique obstacles and learning opportunities. The accumulation of knowledge in diverse domains facilitated the synthesis of high-quality, scalable, and efficient solutions. It was not merely about overcoming obstacles but about acquiring and consolidating skills, knowledge, and best practices in modern application development. This journey reflected the continuous learning ethos inherent in software development, emphasizing the importance of adaptability, continuous improvement, and mastery of emerging technologies and methodologies.
  
## Conclusion

The TodoApp is a sophisticated Flutter project leveraging a range of technologies and best practices to deliver a high-quality user experience for task management. It demonstrates proficient use of Flutter, Firestore, Google oAuth, and various other technologies and packages to create a reliable, efficient, and user-friendly application. The clean and modular architecture ensures maintainability and scalability, allowing for easy future enhancements and additions to the application.

## Future Work

- Enhance the application by introducing more features, optimizations, and potentially expanding it to other platforms.

## Appendices

Include any additional diagrams, code snippets, screenshots, or any other relevant material here.

## References

List the resources, documentation, and any other references used during the development of the project.

### Project Structure

📦lib
┣ 📂features
┃ ┣ 📂home
┃ ┃ ┣ 📂data
┃ ┃ ┃ ┗ 📂repositories
┃ ┃ ┃ ┃ ┗ 📜location_repository.dart
┃ ┃ ┣ 📂domain
┃ ┃ ┃ ┗ 📂entities
┃ ┃ ┃ ┃ ┣ 📜location_entity.dart
┃ ┃ ┃ ┃ ┣ 📜note_entity.dart
┃ ┃ ┃ ┃ ┗ 📜note_input.dart
┃ ┃ ┗ 📂presentation
┃ ┃ ┃ ┣ 📂cubits
┃ ┃ ┃ ┃ ┣ 📂add_note_cubit
┃ ┃ ┃ ┃ ┃ ┣ 📜add_note_cubit.dart
┃ ┃ ┃ ┃ ┃ ┣ 📜add_note_state.dart
┃ ┃ ┃ ┃ ┃ ┗ 📜add_note_state.freezed.dart
┃ ┃ ┃ ┃ ┗ 📂notes_cubit
┃ ┃ ┃ ┃ ┃ ┣ 📜notes_cubit.dart
┃ ┃ ┃ ┃ ┃ ┣ 📜notes_state.dart
┃ ┃ ┃ ┃ ┃ ┗ 📜notes_state.freezed.dart
┃ ┃ ┃ ┣ 📂pages
┃ ┃ ┃ ┃ ┣ 📂add_note_page
┃ ┃ ┃ ┃ ┃ ┣ 📂widgets
┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂find_location_bottom_sheet
┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂cubits
┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂find_location_bloc
┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜find_location_bloc.dart
┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜find_location_state.dart
┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜find_location_state.freezed.dart
┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜find_location_bottom_sheet.dart
┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜add_note_floating_button.dart
┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜bottom_sheet_choose_image.dart
┃ ┃ ┃ ┃ ┃ ┗ 📜add_note_page.dart
┃ ┃ ┃ ┃ ┣ 📂home_page
┃ ┃ ┃ ┃ ┃ ┣ 📂widgets
┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜floating_add_button.dart
┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜note_card_element.dart
┃ ┃ ┃ ┃ ┃ ┗ 📜home_page.dart
┃ ┃ ┃ ┃ ┗ 📂note_detail_page
┃ ┃ ┃ ┃ ┃ ┣ 📂widgets
┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜floating_menu_button.dart
┃ ┃ ┃ ┃ ┃ ┗ 📜note_detail_page.dart
┃ ┃ ┃ ┗ 📂widgets
┃ ┃ ┃ ┃ ┣ 📜my_date_time_picker.dart
┃ ┃ ┃ ┃ ┗ 📜save_note_button.dart
┃ ┣ 📂login
┃ ┃ ┣ 📂data
┃ ┃ ┃ ┗ 📂repositories
┃ ┃ ┃ ┃ ┗ 📜authorization_repository.dart
┃ ┃ ┣ 📂domain
┃ ┃ ┃ ┗ 📂entities
┃ ┃ ┃ ┃ ┣ 📜auth_status.dart
┃ ┃ ┃ ┃ ┣ 📜auth_status.freezed.dart
┃ ┃ ┃ ┃ ┗ 📜user_entity.dart
┃ ┃ ┗ 📂presentation
┃ ┃ ┃ ┣ 📂cubits
┃ ┃ ┃ ┃ ┣ 📜login_cubit.dart
┃ ┃ ┃ ┃ ┣ 📜login_state.dart
┃ ┃ ┃ ┃ ┗ 📜login_state.freezed.dart
┃ ┃ ┃ ┗ 📂pages
┃ ┃ ┃ ┃ ┗ 📂login_page
┃ ┃ ┃ ┃ ┃ ┣ 📂widgets
┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜login_button.dart
┃ ┃ ┃ ┃ ┃ ┗ 📜login_page.dart
┃ ┗ 📂theme
┃ ┃ ┣ 📂data
┃ ┃ ┃ ┗ 📂repositories
┃ ┃ ┃ ┃ ┗ 📜theme_repository.dart
┃ ┃ ┗ 📂presentation
┃ ┃ ┃ ┣ 📜theme_bloc.dart
┃ ┃ ┃ ┣ 📜theme_event.dart
┃ ┃ ┃ ┗ 📜theme_state.dart
┣ 📂services
┃ ┗ 📜repository_firestore.dart
┣ 📜app.dart
┣ 📜config.dart
┣ 📜firebase_options.dart
┗ 📜main.dart
