//
//  MeterEventSession.swift
//  Stripe
//
//  V2 API - Meter event sessions for high-throughput usage reporting.
//  Endpoint: POST /v2/billing/meter_event_session
//

import Foundation

/// A meter event session is used to send high-throughput meter events.
///
/// You can send a higher-throughput of meter events using meter event streams.
/// For this flow, you must first create a meter event session, which will provide
/// you with a session token. You can then create meter events through the meter
/// event stream endpoint, using the session token for authentication.
///
/// The session tokens are short-lived (15 minutes) and you will need to create
/// a new meter event session when the token expires.
///
/// - Note: This is a v2 API resource. Supports up to 10,000 requests per second in livemode.
public struct MeterEventSession: Codable {
    public static let schema = "billing/meter_event_session"

    /// The unique identifier for the session.
    public let id: String

    /// String representing the object's type.
    public let object: String

    /// The authentication token for this session. Use this token to authenticate
    /// meter event stream requests.
    public let authenticationToken: String

    /// The time at which the object was created. Measured in seconds since the Unix epoch.
    public let created: TimeInterval

    /// The time at which the session will expire. Measured in seconds since the Unix epoch.
    /// Sessions are valid for 15 minutes.
    public let expiresAt: TimeInterval

    /// Has the value `true` if the object exists in live mode or `false` if in test mode.
    public let livemode: Bool

    /// Designated initializer
    public init(id: String, object: String, authenticationToken: String, created: TimeInterval, expiresAt: TimeInterval, livemode: Bool) {
        self.id = id
        self.object = object
        self.authenticationToken = authenticationToken
        self.created = created
        self.expiresAt = expiresAt
        self.livemode = livemode
    }

    public enum CodingKeys: String, CodingKey {
        case id,
             object,
             authenticationToken = "authentication_token",
             created,
             expiresAt = "expires_at",
             livemode
    }

    /// Whether this session has expired.
    public var isExpired: Bool {
        return Date().timeIntervalSince1970 >= expiresAt
    }

    /// The remaining time until this session expires, in seconds.
    public var remainingTime: TimeInterval {
        return max(0, expiresAt - Date().timeIntervalSince1970)
    }
}

// MARK: - Meter Event Stream

/// Represents a batch of meter events to send via the high-throughput stream endpoint.
///
/// The meter event stream endpoint supports up to 100,000 events per second for a
/// single business, and up to 100 events per request.
///
/// - Note: Requires a valid `MeterEventSession` token for authentication.
public struct MeterEventStream: Codable {
    public static let schema = "billing/meter_event_stream"

    /// The list of meter events to create. Maximum 100 events per request.
    public let events: [MeterEventCreateParams]

    /// Designated initializer
    public init(events: [MeterEventCreateParams]) {
        self.events = events
    }
}

// MARK: - Meter Event Stream Response

/// The response returned after sending meter events via the stream endpoint.
public struct MeterEventStreamResponse: Codable {
    /// The list of meter event responses.
    public let events: [MeterEventResponse]?

    /// Any errors that occurred while processing the events.
    public let errors: [MeterEventError]?

    public init(events: [MeterEventResponse]?, errors: [MeterEventError]?) {
        self.events = events
        self.errors = errors
    }
}

// MARK: - Meter Event Error

/// An error that occurred while processing a meter event.
public struct MeterEventError: Codable {
    /// The error code.
    public let code: String

    /// A human-readable message describing the error.
    public let message: String

    /// The identifier of the event that caused the error, if applicable.
    public let identifier: String?

    public init(code: String, message: String, identifier: String?) {
        self.code = code
        self.message = message
        self.identifier = identifier
    }
}
