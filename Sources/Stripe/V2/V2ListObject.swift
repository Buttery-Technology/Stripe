//
//  V2ListObject.swift
//  Stripe
//
//  V2 API pagination uses URL-based cursors instead of v1's starting_after pattern.
//

import Foundation

/// A paginated list of objects returned by the v2 API.
///
/// V2 lists are eventually consistent by default (rather than immediately consistent like v1),
/// enabling faster response times. Use the `nextPageUrl` and `previousPageUrl` to navigate.
public struct V2ListObject<T: Codable>: Codable {
    /// The list of items in this page.
    public let data: [T]

    /// URL to fetch the next page of results, or nil if this is the last page.
    public let nextPageUrl: String?

    /// URL to fetch the previous page of results, or nil if this is the first page.
    public let previousPageUrl: String?

    /// Designated initializer
    public init(data: [T], nextPageUrl: String?, previousPageUrl: String?) {
        self.data = data
        self.nextPageUrl = nextPageUrl
        self.previousPageUrl = previousPageUrl
    }

    public enum CodingKeys: String, CodingKey {
        case data,
             nextPageUrl = "next_page_url",
             previousPageUrl = "previous_page_url"
    }

    /// Whether there are more pages after this one.
    public var hasMore: Bool {
        return nextPageUrl != nil
    }

    /// Whether there are pages before this one.
    public var hasPrevious: Bool {
        return previousPageUrl != nil
    }
}
