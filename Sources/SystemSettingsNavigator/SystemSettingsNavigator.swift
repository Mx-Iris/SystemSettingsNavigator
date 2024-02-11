#if canImport(AppKit) && !targetEnvironment(macCatalyst)

import AppKit

public final class SystemSettingsNavigator {
    public static let shared = SystemSettingsNavigator()

    @discardableResult
    public func navigate(to pane: SystemSettingsPane) throws -> Bool {
        guard let url = URL(string: pane.urlSchema) else {
            throw SystemSettingsNavigatorError.failedCreateURL(pane)
        }
        return NSWorkspace.shared.open(url)
    }
}

#endif
