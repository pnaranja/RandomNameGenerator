# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Project Overview

RandomNameGenerator is an iOS application built with SwiftUI that displays random names from a predefined list. The app features a split-screen interface with navigation buttons and a main content area that shows names with interactive controls.

## Development Commands

### Building the Project
```bash
# Build for iOS Simulator (Debug)
xcodebuild -project RandomNameGenerator.xcodeproj -scheme RandomNameGenerator -destination 'platform=iOS Simulator,name=iPhone 15' -configuration Debug build

# Build for iOS Simulator (Release)
xcodebuild -project RandomNameGenerator.xcodeproj -scheme RandomNameGenerator -destination 'platform=iOS Simulator,name=iPhone 15' -configuration Release build

# Build for iOS Device (requires signing)
xcodebuild -project RandomNameGenerator.xcodeproj -scheme RandomNameGenerator -destination 'platform=iOS,id=<DEVICE_ID>' -configuration Release build
```

### Running in Simulator
```bash
# Open project in Xcode
open RandomNameGenerator.xcodeproj

# Build and run in simulator from command line
xcodebuild -project RandomNameGenerator.xcodeproj -scheme RandomNameGenerator -destination 'platform=iOS Simulator,name=iPhone 15' -configuration Debug build -quiet && xcrun simctl boot "iPhone 15" 2>/dev/null || true && xcrun simctl install booted ~/Library/Developer/Xcode/DerivedData/RandomNameGenerator-*/Build/Products/Debug-iphonesimulator/RandomNameGenerator.app && xcrun simctl launch booted com.example.RandomNameGenerator
```

### Testing
```bash
# Run unit tests (when added)
xcodebuild test -project RandomNameGenerator.xcodeproj -scheme RandomNameGenerator -destination 'platform=iOS Simulator,name=iPhone 15'

# Generate test coverage report
xcodebuild test -project RandomNameGenerator.xcodeproj -scheme RandomNameGenerator -destination 'platform=iOS Simulator,name=iPhone 15' -enableCodeCoverage YES
```

### Project Information
```bash
# List available schemes and configurations
xcodebuild -list -project RandomNameGenerator.xcodeproj

# Show build settings
xcodebuild -showBuildSettings -project RandomNameGenerator.xcodeproj -scheme RandomNameGenerator
```

## Architecture Overview

### Application Structure
- **App Entry Point**: `RandomNameGeneratorApp.swift` - Standard SwiftUI App structure with main WindowGroup
- **Main View**: `ContentView.swift` - Contains the primary UI implementation

### UI Architecture
The app uses a split-screen HStack layout with two main sections:

1. **Left Sidebar (35% width)**:
   - Navigation buttons (Home, Favorites) 
   - Fixed width: `UIScreen.main.bounds.width * 0.35`
   - White background with top/leading padding

2. **Main Content Area (65% width)**:
   - Displays current name with blue background
   - Contains action buttons (Next Words, Like)
   - Semi-transparent blue background: `Color.blue.opacity(0.3)`

### Data Management
- **Names Array**: Hardcoded list of 5 names: `["Adam", "Bob", "Jennifer", "Mae", "Paul"]`
- **State Management**: Uses `@State private var currentText` for current displayed name
- **Random Selection**: `randomName()` function uses `names.randomElement()` with fallback to "Paul"

### Key Components
- **Name Display**: Styled text with white color, bold font (30pt), blue background with opacity
- **Navigation Buttons**: Bordered style with house.fill icons (currently no functionality)
- **Action Buttons**: "Next Words" (triggers name change) and "Like" (no current functionality)

## Technical Details

### Build Configuration
- **iOS Deployment Target**: iOS 18.5
- **Swift Version**: 5.0
- **Xcode Version**: 16.4
- **Bundle ID**: `com.example.RandomNameGenerator`
- **Device Support**: iPhone and iPad (Universal app)
- **Orientation Support**: Portrait, Landscape Left, Landscape Right

### Code Issues to Address
1. **Unused Variable**: Line 15 in ContentView.swift has `let temp = names.randomElement()` that's assigned but never used
2. **Icon Inconsistency**: Favorites button uses house.fill icon instead of a favorites-specific icon
3. **Missing Functionality**: Home and Favorites buttons have empty action blocks
4. **Hard-coded UI Values**: Screen width calculations and fixed dimensions could be made responsive

### Development Notes
- No unit tests currently implemented
- No external dependencies (pure SwiftUI)
- Uses automatic code signing
- Previews enabled for SwiftUI development
- Asset catalog includes AppIcon and AccentColor but no custom assets defined
