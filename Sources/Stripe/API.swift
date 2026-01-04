//
//  API.swift
//  Stripe
//
//  Created by Jonathan Holland on 8/28/22.
//

import Foundation

/// Assists with interacting with the `Stripe` API. Use `shared` to use the global instance setup ahead of time.
///
/// - Note: When interacting with the `shared` instance, the secrets **must** be setup *before* accessing. Please call `-initialize(endPoint:liveSecret:testSecret:)` to set up `API` before use.
public struct API {
    public static var shared = API()

    /// The API namespace to use for requests.
    public enum Namespace: String {
        case v1 = "v1"
        case v2 = "v2"

        /// The base URL for this namespace.
        public var baseURL: String {
            switch self {
            case .v1:
                return "https://api.stripe.com/v1/"
            case .v2:
                return "https://api.stripe.com/v2/"
            }
        }

        /// The content type for requests in this namespace.
        public var contentType: String {
            switch self {
            case .v1:
                return "application/x-www-form-urlencoded"
            case .v2:
                return "application/json"
            }
        }
    }

    /// The endpoint to connect to `Stripe` v1 services.
    public var endPoint: String!

    /// The endpoint to connect to `Stripe` v2 services.
    public var v2EndPoint: String!

    /// The secret used to access live or test data.
    ///
    /// This is `private` to keep access restricted locally and ensure setting this is deliberate. Also, this secret **must** be setup *before* accessing. Please call `-initialize(endPoint:secret:)` to set up `API` before use.
    public private(set) var secret: String!

    /// The API version to use for v2 requests.
    /// This header is required for all v2 API calls.
    public var apiVersion: String = "2024-09-30.acacia"

    public init() {}

    /// Setup necessary data for interacting with `Stripe`.
    ///
    /// - Parameters:
    ///     - endPoint: The URL endpoint to connect to.
    ///     - secret: The secret for live data. **Please use environment variables to keep this secure**
    public init(endPoint: String, secret: String) {
        self.endPoint = endPoint
        self.v2EndPoint = Namespace.v2.baseURL
        self.secret = secret
    }

    /// Returns the endpoint URL for the specified namespace.
    public func endPoint(for namespace: Namespace) -> String {
        switch namespace {
        case .v1:
            return endPoint ?? Namespace.v1.baseURL
        case .v2:
            return v2EndPoint ?? Namespace.v2.baseURL
        }
    }

    /// Creates the required headers for a request to the specified namespace.
    public func headers(for namespace: Namespace) -> [String: String] {
        var headers: [String: String] = [
            "Authorization": "Bearer \(secret ?? "")",
            "Content-Type": namespace.contentType
        ]

        // v2 requires the Stripe-Version header
        if namespace == .v2 {
            headers["Stripe-Version"] = apiVersion
        }

        return headers
    }
}

extension API {
    /// Setup necessary data for interacting with `Stripe`.
    ///
    /// - Parameters:
    ///     - endPoint: The URL endpoint to connect to for v1.
    ///     - secret: The secret for live or test data. **Please use environment variables to keep this secure**
    ///     - apiVersion: The API version for v2 requests. Defaults to "2024-09-30.acacia".
    public static func initialize(
        endPoint: String = "https://api.stripe.com/v1/",
        secret: String,
        apiVersion: String = "2024-09-30.acacia"
    ) {
        API.shared.endPoint = endPoint
        API.shared.v2EndPoint = Namespace.v2.baseURL
        API.shared.secret = secret
        API.shared.apiVersion = apiVersion
    }

    /// Setup necessary data for interacting with `Stripe` v2 API.
    ///
    /// - Parameters:
    ///     - secret: The secret key. **Note: v2 only supports secret keys, not restricted keys.**
    ///     - apiVersion: The API version for v2 requests.
    public static func initializeV2(
        secret: String,
        apiVersion: String = "2024-09-30.acacia"
    ) {
        API.shared.v2EndPoint = Namespace.v2.baseURL
        API.shared.secret = secret
        API.shared.apiVersion = apiVersion
    }
}
