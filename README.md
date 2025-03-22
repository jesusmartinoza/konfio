# Konfio Challenge - Dog App

A Flutter application developed as part of the Konfio interview process. The app displays a list of dogs with their details in a card layout.

![App Demo](extras/demo.gif)

## Considerations

- Initial app launch fetches data from the remote endpoint. Subsequent pull-to-refresh actions load data from the local database 🤓
- The second item in the list displays a red shadow effect as specified in the design mockup.

## Architecture

The project follows a clean architecture approach with clear separation of concerns, organized into the following structure:

- **api**: Handles all external API communications and data fetching using a custom API client wrapper for HTTP dependency.
- **db**: Manages local database operations using Sembast for offline storage
- **models**: Contains data models and entities used throughout the app
- **pages**: UI screens and their associated logic. Each screen is organized in a dedicated folder containing:
  - `[SCREEN_NAME].page.dart`: Handles UI layout and user interactions
  - `[SCREEN_NAME].cubit.dart`: Contains business logic and state management using BLoC pattern
  - `[SCREEN_NAME].state.dart`: Defines state properties
- **repos**: Implements repository pattern to abstract data sources
- **theme**: Centralizes app-wide styling, colors, and design utilities
- **utils**: Contains utility functions and extensions, including a Kotlin-inspired 'let' function for null safety <3
- **widgets**: Reusable UI components per page

Each layer has a specific responsibility:

- The API layer communicates with external services
- Repositories coordinate between API and local database
- Models define the data structure
- Pages and widgets handle the presentation layer

## Testing Strategy

While tests have not been implemented yet, the project structure is designed with testability in mind and ready for:

- **Unit Tests**: The BLoC architecture and separation of concerns makes it easy to add unit tests using BlocTest
- **Mock Testing**: With Repos and Mockito is easy to mock API/DB requests.

The architecture provides a solid foundation for adding comprehensive test coverage in the future.
