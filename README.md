# Flutter Challenge App for SaveStrike

This Flutter app is developed as part of a coding challenge for SaveStrike, showcasing an Intro screen with carousel flow, a Home screen with dummy data, and various other features as outlined in the development process.

## Development Duration

14.march.2024 - 15.march.2024
10 Hours combined

## Getting Started

To run this app on your system, follow these steps:

1. Clone the repository to your local machine.
2. Navigate to the project directory in a terminal.
3. Run `flutter pub get` to install dependencies.
4. Execute `flutter run` to start the app on a connected device or emulator.

## Development Process and Architecture

This app was developed for SaveStrike as part of a coding challenge. Throughout the development process, several key decisions were made to ensure the app's scalability, maintainability, and overall performance.

### Folder Structure and Code Organization

The project adopts a feature-first structure over a layer-first approach. This decision was made to enhance scalability, allowing each feature to be developed and scaled independently. The primary features include:

- **Authenticating**: Guards navigation between the Onboarding page and the Main page.
- **Onboarding**: Contains the Intro screen with carousel flow and a Login button.
- **Favorite**: Hosts the Favorite screen displaying groups of favorites.

Each feature is organized into layers: Presentation (widgets and controllers), Domain (data models), and Data (repositories).

### State Management and Routing

For state management, the Riverpod package was chosen for its flexibility and recent experience with it, despite familiarity with other packages like go_router. Auto_route was selected as the routing solution to leverage recent experiences and integrate smoothly with the chosen state management solution.

### Implementation Highlights

- **Dummy Data**: Utilized JSON files to create dummy data for the Favorite data model, simulating async functions with a delay to showcase loading animations (shimmer effect).
- **Bonus Features**: Added haptic feedback to Login buttons and BottomNavigationBar items. Introduced a shimmer effect for loading FavoriteGroups in the FavoritePage and a subtle animation in the onboarding page for smooth background color transitions.

### Reflections and Improvements

The development required more time than anticipated, primarily due to familiarizing with Riverpod and determining the optimal architecture. While UI implementation was straightforward, understanding Riverpod's architecture posed challenges. However, this process offered valuable learning opportunities in state management and app architecture.

#### Potential Improvements:

- Refactoring some larger widgets into smaller, more manageable components.
- Clarification and implementation of the Sticky Bar behavior, as the current implementation has the bar floating, requiring further specifications for desired behavior.

### Packages Used

The project incorporates several packages to enhance functionality and user experience:

- `dots_indicator: ^3.0.0`
- `dotted_border: ^2.1.0`
- `shimmer: ^3.0.0`

This development journey underscores a commitment to learning and adapting to new technologies, ensuring the delivery of a functional and user-friendly app while embracing the challenge of integrating new architectural patterns and packages.



