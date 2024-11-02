# SystemSettingsNavigator

## Overview

This small framework is designed to simplify the process of opening any system settings pane on macOS. Inspired by the [SystemPreferences](https://github.com/bvanpeski/SystemPreferences) project, this tool aims to provide an easy-to-use interface for developers looking to integrate system settings access within their macOS applications. A huge thanks to the original project for the inspiration and groundwork. This project encapsulates the original idea and extends its functionalities for broader use cases.

## Features

- Open almost all macOS system settings pane.
- Lightweight and easy to integrate into any macOS application.

## Requirements
- AppKit or SwiftUI or UIKit(MacCatalyst)
- macOS 13 or later.
- Swift 5.9 or later.

## Installation
SystemSettingsNavigator can be installed with the Swift Package Manager:

```
https://github.com/Mx-Iris/SystemSettingsNavigator.git
```

## Usage

```swift
import SystemSettingsNavigator

// Example: Open the Accessibility pane audio tab
// AppKit
NSWorkspace.shared.openSystemSettings(.accessibility(.audio))
// UIKit
UIApplication.shared.openSystemSettings(.accessibility(.audio))
```

## Contributing

If a pane fails or is unavailable, I'll gladly accept a PR!

## Credits

- Inspired by [SystemPreferences](https://github.com/bvanpeski/SystemPreferences)

## License

MIT
