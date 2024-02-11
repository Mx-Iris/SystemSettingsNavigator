#if canImport(AppKit) && !targetEnvironment(macCatalyst)

import AppKit

public enum SystemSettingsNavigatorError: Error {
    case failedCreateURL(Pane)
}

#endif
