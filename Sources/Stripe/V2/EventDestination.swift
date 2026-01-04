//
//  EventDestination.swift
//  Stripe
//
//  V2 API - Event destinations for webhook management.
//  Endpoint: /v2/core/event_destinations
//

import Foundation

/// An event destination represents a location where Stripe can send events.
///
/// Event destinations allow you to configure where Stripe sends webhook events,
/// including HTTP endpoints, Amazon EventBridge, and other supported destinations.
///
/// - Note: This is a v2 API resource. Requires `Stripe-Version` header.
public struct EventDestination: Codable {
    public static let schema = "core/event_destinations"

    /// Unique identifier for the object.
    public let id: String

    /// String representing the object's type.
    public let object: String

    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public let created: Date

    /// An optional description of what the event destination is used for.
    public let eventDestinationDescription: String?

    /// The list of events to enable for this endpoint.
    public let enabledEvents: [String]

    /// The type of event destination.
    public let type: DestinationType

    /// Has the value `true` if the object exists in live mode or `false` if in test mode.
    public let livemode: Bool

    /// Set of key-value pairs that you can attach to an object.
    public let metadata: Metadata?

    /// The name of the event destination.
    public let name: String

    /// The status of the event destination.
    public let status: Status

    /// The status details of the event destination.
    public let statusDetails: StatusDetails?

    /// Time at which the object was last updated. Measured in seconds since the Unix epoch.
    public let updated: Date

    /// Webhook endpoint configuration, if type is `webhook_endpoint`.
    public let webhookEndpoint: WebhookEndpoint?

    /// Amazon EventBridge configuration, if type is `amazon_eventbridge`.
    public let amazonEventbridge: AmazonEventbridge?

    /// Designated initializer
    public init(id: String, object: String, created: Date, eventDestinationDescription: String?, enabledEvents: [String], type: DestinationType, livemode: Bool, metadata: Metadata?, name: String, status: Status, statusDetails: StatusDetails?, updated: Date, webhookEndpoint: WebhookEndpoint?, amazonEventbridge: AmazonEventbridge?) {
        self.id = id
        self.object = object
        self.created = created
        self.eventDestinationDescription = eventDestinationDescription
        self.enabledEvents = enabledEvents
        self.type = type
        self.livemode = livemode
        self.metadata = metadata
        self.name = name
        self.status = status
        self.statusDetails = statusDetails
        self.updated = updated
        self.webhookEndpoint = webhookEndpoint
        self.amazonEventbridge = amazonEventbridge
    }

    public enum CodingKeys: String, CodingKey {
        case id,
             object,
             created,
             eventDestinationDescription = "description",
             enabledEvents = "enabled_events",
             type,
             livemode,
             metadata,
             name,
             status,
             statusDetails = "status_details",
             updated,
             webhookEndpoint = "webhook_endpoint",
             amazonEventbridge = "amazon_eventbridge"
    }

    // MARK: - Destination Type

    /// The type of event destination.
    public enum DestinationType: String, Codable {
        /// A webhook endpoint that receives HTTP POST requests.
        case webhookEndpoint = "webhook_endpoint"

        /// Amazon EventBridge event bus.
        case amazonEventbridge = "amazon_eventbridge"
    }

    // MARK: - Status

    /// The status of the event destination.
    public enum Status: String, Codable {
        /// The destination is enabled and receiving events.
        case enabled

        /// The destination is disabled and not receiving events.
        case disabled
    }

    // MARK: - Status Details

    /// Additional details about the status of the event destination.
    public struct StatusDetails: Codable {
        /// The reason the destination is in its current status.
        public let message: String?

        public init(message: String?) {
            self.message = message
        }
    }

    // MARK: - Webhook Endpoint

    /// Configuration for a webhook endpoint destination.
    public struct WebhookEndpoint: Codable {
        /// The URL of the webhook endpoint.
        public let url: String

        /// The signing secret used to verify webhook signatures.
        /// Only returned when the destination is first created.
        public let signingSecret: String?

        public init(url: String, signingSecret: String?) {
            self.url = url
            self.signingSecret = signingSecret
        }

        public enum CodingKeys: String, CodingKey {
            case url,
                 signingSecret = "signing_secret"
        }
    }

    // MARK: - Amazon EventBridge

    /// Configuration for an Amazon EventBridge destination.
    public struct AmazonEventbridge: Codable {
        /// The AWS account ID.
        public let awsAccountId: String

        /// The AWS region.
        public let awsRegion: String

        /// The name of the event bus.
        public let eventBusName: String?

        public init(awsAccountId: String, awsRegion: String, eventBusName: String?) {
            self.awsAccountId = awsAccountId
            self.awsRegion = awsRegion
            self.eventBusName = eventBusName
        }

        public enum CodingKeys: String, CodingKey {
            case awsAccountId = "aws_account_id",
                 awsRegion = "aws_region",
                 eventBusName = "event_bus_name"
        }
    }
}

// MARK: - Event Destination Create Parameters

/// Parameters for creating an event destination.
public struct EventDestinationCreateParams: Codable {
    /// The name of the event destination.
    public let name: String

    /// The type of event destination.
    public let type: EventDestination.DestinationType

    /// The list of events to enable for this destination.
    public let enabledEvents: [String]

    /// An optional description of what the event destination is used for.
    public let description: String?

    /// Set of key-value pairs that you can attach to an object.
    public let metadata: Metadata?

    /// Webhook endpoint configuration. Required if type is `webhook_endpoint`.
    public let webhookEndpoint: WebhookEndpointParams?

    /// Amazon EventBridge configuration. Required if type is `amazon_eventbridge`.
    public let amazonEventbridge: AmazonEventbridgeParams?

    public init(name: String, type: EventDestination.DestinationType, enabledEvents: [String], description: String? = nil, metadata: Metadata? = nil, webhookEndpoint: WebhookEndpointParams? = nil, amazonEventbridge: AmazonEventbridgeParams? = nil) {
        self.name = name
        self.type = type
        self.enabledEvents = enabledEvents
        self.description = description
        self.metadata = metadata
        self.webhookEndpoint = webhookEndpoint
        self.amazonEventbridge = amazonEventbridge
    }

    public enum CodingKeys: String, CodingKey {
        case name,
             type,
             enabledEvents = "enabled_events",
             description,
             metadata,
             webhookEndpoint = "webhook_endpoint",
             amazonEventbridge = "amazon_eventbridge"
    }

    /// Parameters for creating a webhook endpoint.
    public struct WebhookEndpointParams: Codable {
        /// The URL of the webhook endpoint.
        public let url: String

        public init(url: String) {
            self.url = url
        }
    }

    /// Parameters for creating an Amazon EventBridge destination.
    public struct AmazonEventbridgeParams: Codable {
        /// The AWS account ID.
        public let awsAccountId: String

        /// The AWS region.
        public let awsRegion: String

        public init(awsAccountId: String, awsRegion: String) {
            self.awsAccountId = awsAccountId
            self.awsRegion = awsRegion
        }

        public enum CodingKeys: String, CodingKey {
            case awsAccountId = "aws_account_id",
                 awsRegion = "aws_region"
        }
    }
}
