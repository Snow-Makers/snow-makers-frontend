# snowmakers

A new Flutter project.

## Getting Started

## Features
1. **Multi-themes**

2. **Multi-Language**

3. **Routing system with guard using GORouter**

4. **Unit and Widget testing**

## Folder Structure


![Screenshot 2023-12-07 at 10 54 28 PM](https://github.com/YousefSalahKassem/schools/assets/91211054/58876336-a1d3-4240-8f55-675df1ee1f59)


### Core

| Folder         | Description                                               |
|-----------------------|-----------------------------------------------------------|
| **components**        | Shared UI components across the entire application.       |
| **notifiers**         | Shared global and generic states and notifiers.           |
| **themes**            | Stores different themes for the application.              |
| **routes**            | Manages application routing and guards.                   |
| **utilities**         | Holds utility functions, enums, extensions, etc.          |

### Features

Each feature in the application has its own folder.

| Folder                       | Description                                                   |
|------------------------------|---------------------------------------------------------------|
| **models**                   | Data models specific to the feature.                          |
| **screens**                  | Feature-specific screens/UI.                                  |
| **pages**                    | Feature-specific pages/UI.                                    |
| **widgets**                  | Widgets tailored for different screen sizes.                  |
| **notifiers**                | Feature-specific business logic components.                   |
| **data**                     | Manages data sources for the feature.                         |


# Packages Used for Lead Liaison Project

## UI
- `cupertino_icons: ^1.0.2`
- `flutter_lints: ^2.0.0`
- `cached_network_image: ^3.3.0`
- `loader_overlay: ^2.2.0`
- `flutter_svg: ^2.0.8`
- `flutter_screenutil: ^5.7.0`
- `animate_do: ^3.1.2`
- `dropdown_button2: ^2.3.9`
- `syncfusion_flutter_sliders: ^23.1.44`
- `like_button: ^2.0.5`
- `animated_progress_bar: ^0.0.3`

## State Management
- `flutter_riverpod: any`
- `riverpod: ^2.2.0`

## Remote
- `dio: ^5.3.3`
- `json_annotation: ^4.5.0`

## Local
- `shared_preferences: ^2.2.2`
- `flutter_secure_storage: ^9.0.0`
- `hive: ^2.2.3`
- `hive_flutter: ^1.1.0`

## Utils
- `in_app_update: ^4.0.1`
- `flutter_native_splash: ^2.3.4`
- `flutter_launcher_icons: ^0.13.1`
- `equatable: ^2.0.5`
- `dartz: ^0.10.1`
- `url_launcher: ^6.2.1`
- `webview_flutter: ^4.4.2`

## Maps
- `google_maps_flutter: ^2.5.0`

## Testing
- `mockito: ^5.4.2`

## Routing
- `go_router: ^8.0.1`

## Localization
- `easy_localization: ^3.0.0`

## Depend Reference
- `intl: ^0.18.0`
- `easy_logger: ^0.0.2`

## Debugging and Testing
- `logging: ^1.1.1`


## Dev Dependencies
- `build_runner: ^2.1.5`
- `lint: ^2.0.1`
- `flutter_test: sdk: flutter`
- `flutter_lints: ^2.0.0`


# Themes

## Overview
Flavors in themes refer to different variations within a theme, offering both light and dark modes. <br />
Each flavor comprises a distinct color palette and theme styling, providing users with a customized visual experience.

1. **Flavors**: Variants within a theme, each comprising:
   - Light Mode
   - Dark Mode

2. **Color and Theme**: Specific attributes defining each flavor.
   - **Color Palette**: Set of colors used in both light and dark modes.
   - **Theme Styling**: Design elements, such as typography, layout, and visual components specific to each flavor.

### Code Example
```dart
// Accessing the 'black' color from the current app theme using the context object
Color myBlackColor = context.appTheme.black;
// Utilizing the obtained color in your Flutter widgets
Container(
width: 100,
height: 100,
color: myBlackColor,
)
```

```dart
// Accessing the current theme using the context object
ThemeData currentTheme = context.theme;
// Implementing the obtained theme in your Flutter widgets
Container(
decoration: BoxDecoration(
color: currentTheme.backgroundColor,
border: Border.all(color: currentTheme.accentColor),
),
)
```

## AppTextStyles
The `AppTextStyles` class in Flutter serves as a comprehensive text style manager, allowing for the definition and management of various text styles within a theming system.<br />
It offers a set of predefined text styles adaptable to different screen sizes, ensuring a consistent and responsive typography design within a Flutter application.


### Design Customization
    1. Adjusting the font size, weight, or line-height for specific text styles.
  
    2. Adding new text styles tailored to their design needs.

### Implementation Details

1. **Screen Adaptability**:
   `AppTextStyles` provides unique text styles tailored for mobile and tablet screen sizes, ensuring responsiveness and optimal readability across various devices.

2. **Lerp Method**:
   The `lerp` method allows for smooth transitions or transformations between text styles by linearly interpolating between two instances of `AppTextStyles`.

### Code Example
```dart
// Accessing the headlineMedium text style using the context object
TextStyle myHeadlineMediumStyle = context.textTheme.headlineMedium;
// Implementing the obtained style in your Flutter widgets
Text(
'Your Text Here',
style: myHeadlineMediumStyle,
)
```

### AppTheme Widget
The `AppTheme` widget in Flutter is a pivotal component for managing and applying various themes within an application. Leveraging Flutter Bloc for state management, it facilitates dynamic theming capabilities.

## Overview
`AppTheme` connects theme management and the user interface, enabling seamless switching and application of different themes within the app.

### Initialization

To implement the `AppTheme` widget, integrate it within the widget tree. Define a builder function that accepts the generated `ThemeData` to be applied.

### Code Example

```dart
AppTheme(
builder: (theme) {
return MaterialApp(
theme: theme,
// Other MaterialApp configurations
);
},
)
```

# Routing

The `RouteArg` library provides a set of classes and structures for handling different types of route arguments in a Flutter application.


### Types of RouteArgs

1. **NoArg:**
   - Represents routes with no arguments, indicating that no data is passed to the route.

2. **SimpleQueryArg<T>:**
   - Represents routes with a single query argument of type `T`. It allows passing a single argument to the route.

3. **SimpleExtraArg<T>:**
   - Represents routes with an extra argument of any type `T` along with a route. It includes a `getExtra` method to retrieve the extra argument when needed.


### AppRouteUtils Extension

The `AppRouteUtils` extension provides convenient methods for navigating, pushing, and replacing routes based on the `AppRoute` class.

| Method     | Description                                                       |
|------------|-------------------------------------------------------------------|
| `navigate` | Navigate to the specified route without allowing a back action.  |
| `push`     | Pushes the specified route, allowing a back action.               |
| `replace`  | Replaces the current route in the stack with the specified route. |

### Code Example

```dart
// for no arguments.
myNoArgRoute.navigate(context);
```
