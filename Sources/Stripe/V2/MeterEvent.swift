//
//  MeterEvent.swift
//  Stripe
//
//  V2 API - Meter events for usage-based billing.
//  Endpoint: POST /v2/billing/meter_events
//

import Foundation

/// Meter events are used to report customer usage of your product or service.
///
/// Meter events are associated with billing meters, which define the shape of the event's
/// payload and how those events are aggregated. Meter events are processed asynchronously,
/// so they may not be immediately reflected in aggregates or on upcoming invoices.
///
/// - Note: This is a v2 API resource. Requires `Stripe-Version` header and JSON request body.
public struct MeterEvent: Codable {
    public static let schema = "billing/meter_events"

    /// The name of the meter event. Corresponds to the `event_name` field on a meter.
    public let eventName: String

    /// A unique identifier for the event. If not provided, one will be generated.
    /// We recommend using a globally unique identifier for this. We'll enforce
    /// uniqueness within a rolling 24 hour period.
    public let identifier: String?

    /// The payload of the event. This must contain the fields corresponding to a
    /// meter's `customer_mapping.event_payload_key` (default is `stripe_customer_id`)
    /// and `value_settings.event_payload_key` (default is `value`). Read more on
    /// how to configure meters.
    public let payload: [String: String]

    /// The time of the event. Must be within the past 35 calendar days or up to
    /// 5 minutes in the future. Defaults to current timestamp if not specified.
    public let timestamp: TimeInterval?

    /// Designated initializer
    public init(eventName: String, identifier: String? = nil, payload: [String: String], timestamp: TimeInterval? = nil) {
        self.eventName = eventName
        self.identifier = identifier
        self.payload = payload
        self.timestamp = timestamp
    }

    public enum CodingKeys: String, CodingKey {
        case eventName = "event_name",
             identifier,
             payload,
             timestamp
    }
}

// MARK: - Meter Event Response

/// The response returned after creating a meter event.
public struct MeterEventResponse: Codable {
    /// The unique identifier for the meter event.
    public let identifier: String

    /// The name of the meter event.
    public let eventName: String

    /// The time of the event.
    public let timestamp: TimeInterval

    /// The payload of the event.
    public let payload: [String: String]

    /// Time at which the object was created.
    public let created: TimeInterval

    /// Has the value `true` if the object exists in live mode or `false` if in test mode.
    public let livemode: Bool

    public init(identifier: String, eventName: String, timestamp: TimeInterval, payload: [String: String], created: TimeInterval, livemode: Bool) {
        self.identifier = identifier
        self.eventName = eventName
        self.timestamp = timestamp
        self.payload = payload
        self.created = created
        self.livemode = livemode
    }

    public enum CodingKeys: String, CodingKey {
        case identifier,
             eventName = "event_name",
             timestamp,
             payload,
             created,
             livemode
    }
}

// MARK: - Meter Event Create Parameters

/// Parameters for creating a meter event.
public struct MeterEventCreateParams: Codable {
    /// The name of the meter event. Corresponds to the `event_name` field on a meter.
    public let eventName: String

    /// A unique identifier for the event.
    public let identifier: String?

    /// The payload of the event.
    public let payload: [String: String]

    /// The time of the event. Measured in seconds since the Unix epoch.
    public let timestamp: TimeInterval?

    public init(eventName: String, identifier: String? = nil, payload: [String: String], timestamp: TimeInterval? = nil) {
        self.eventName = eventName
        self.identifier = identifier
        self.payload = payload
        self.timestamp = timestamp
    }

    public enum CodingKeys: String, CodingKey {
        case eventName = "event_name",
             identifier,
             payload,
             timestamp
    }
}
