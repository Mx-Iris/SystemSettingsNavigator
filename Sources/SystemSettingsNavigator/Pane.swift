#if canImport(AppKit) && !targetEnvironment(macCatalyst)

import AppKit

public protocol Pane {
    var urlSchema: String { get }
}

#endif
