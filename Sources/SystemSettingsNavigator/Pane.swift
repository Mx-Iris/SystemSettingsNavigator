import Foundation

public protocol Pane {
    var urlSchema: String { get }
}

extension Pane {
    public var url: URL { URL(string: urlSchema)! }
}
