//
//  Event.swift
//  Stripe
//
//  Event object for Stripe webhooks (v1 API).
//

import Foundation

/// Events are Stripe's way of letting you know when something interesting happens in your account.
///
/// When an interesting event occurs, Stripe creates a new `Event` object. For example, when a charge
/// succeeds, a `charge.succeeded` event is created, and when an invoice payment attempt fails,
/// an `invoice.payment_failed` event is created.
///
/// Certain API requests might create multiple events. For example, if you create a new subscription
/// for a customer, you receive both a `customer.subscription.created` event and a `charge.succeeded` event.
public struct Event: Codable {
    public static let schema = "events"

    /// Unique identifier for the object.
    public let id: String
    /// String representing the object's type.
    public let object: String
    /// The connected account that originated the event.
    public let account: String?
    /// The Stripe API version used to render `data`.
    public let apiVersion: String?
    /// Description of the event (e.g., `invoice.created` or `charge.refunded`).
    public let type: String
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public let created: TimeInterval
    /// Object containing data associated with the event.
    public let data: EventData
    /// Has the value `true` if the object exists in live mode.
    public let livemode: Bool
    /// Number of webhooks that haven't been successfully delivered.
    public let pendingWebhooks: Int
    /// Information on the API request that triggered the event.
    public let request: EventRequest?
    /// Description of the event context.
    public let context: String?

    public init(id: String, object: String, account: String?, apiVersion: String?, type: String, created: TimeInterval, data: EventData, livemode: Bool, pendingWebhooks: Int, request: EventRequest?, context: String?) {
        self.id = id
        self.object = object
        self.account = account
        self.apiVersion = apiVersion
        self.type = type
        self.created = created
        self.data = data
        self.livemode = livemode
        self.pendingWebhooks = pendingWebhooks
        self.request = request
        self.context = context
    }

    public enum CodingKeys: String, CodingKey {
        case id,
             object,
             account,
             apiVersion = "api_version",
             type,
             created,
             data,
             livemode,
             pendingWebhooks = "pending_webhooks",
             request,
             context
    }

    // MARK: - Event Data

    /// Object containing the API resource relevant to the event.
    public struct EventData: Codable {
        /// Object containing the API resource relevant to the event.
        /// The type of object depends on the event type (e.g., a `Charge` object for `charge.succeeded`).
        public let object: [String: AnyCodable]
        /// Object containing the names of the updated attributes and their values prior to the event.
        /// Only included for `*.updated` events.
        public let previousAttributes: [String: AnyCodable]?

        public init(object: [String: AnyCodable], previousAttributes: [String: AnyCodable]?) {
            self.object = object
            self.previousAttributes = previousAttributes
        }

        public enum CodingKeys: String, CodingKey {
            case object,
                 previousAttributes = "previous_attributes"
        }
    }

    // MARK: - Event Request

    /// Information on the API request that triggered the event.
    public struct EventRequest: Codable {
        /// ID of the API request that caused the event.
        /// If null, the event was automatic (e.g., Stripe's automatic subscription handling).
        public let id: String?
        /// The idempotency key transmitted during the request, if any.
        public let idempotencyKey: String?

        public init(id: String?, idempotencyKey: String?) {
            self.id = id
            self.idempotencyKey = idempotencyKey
        }

        public enum CodingKeys: String, CodingKey {
            case id,
                 idempotencyKey = "idempotency_key"
        }
    }
}

// MARK: - Common Event Types

/// Common Stripe event types for reference.
public enum EventType: String, Codable {
    // Account events
    case accountUpdated = "account.updated"
    case accountApplicationAuthorized = "account.application.authorized"
    case accountApplicationDeauthorized = "account.application.deauthorized"
    case accountExternalAccountCreated = "account.external_account.created"
    case accountExternalAccountDeleted = "account.external_account.deleted"
    case accountExternalAccountUpdated = "account.external_account.updated"

    // Balance events
    case balanceAvailable = "balance.available"

    // Charge events
    case chargeSucceeded = "charge.succeeded"
    case chargeFailed = "charge.failed"
    case chargePending = "charge.pending"
    case chargeRefunded = "charge.refunded"
    case chargeUpdated = "charge.updated"
    case chargeCaptured = "charge.captured"
    case chargeExpired = "charge.expired"
    case chargeDisputeCreated = "charge.dispute.created"
    case chargeDisputeUpdated = "charge.dispute.updated"
    case chargeDisputeClosed = "charge.dispute.closed"
    case chargeDisputeFundsWithdrawn = "charge.dispute.funds_withdrawn"
    case chargeDisputeFundsReinstated = "charge.dispute.funds_reinstated"
    case chargeRefundUpdated = "charge.refund.updated"

    // Checkout events
    case checkoutSessionCompleted = "checkout.session.completed"
    case checkoutSessionExpired = "checkout.session.expired"
    case checkoutSessionAsyncPaymentSucceeded = "checkout.session.async_payment_succeeded"
    case checkoutSessionAsyncPaymentFailed = "checkout.session.async_payment_failed"

    // Customer events
    case customerCreated = "customer.created"
    case customerUpdated = "customer.updated"
    case customerDeleted = "customer.deleted"
    case customerSubscriptionCreated = "customer.subscription.created"
    case customerSubscriptionUpdated = "customer.subscription.updated"
    case customerSubscriptionDeleted = "customer.subscription.deleted"
    case customerSubscriptionTrialWillEnd = "customer.subscription.trial_will_end"
    case customerSubscriptionPaused = "customer.subscription.paused"
    case customerSubscriptionResumed = "customer.subscription.resumed"
    case customerSourceCreated = "customer.source.created"
    case customerSourceUpdated = "customer.source.updated"
    case customerSourceDeleted = "customer.source.deleted"
    case customerSourceExpiring = "customer.source.expiring"
    case customerDiscountCreated = "customer.discount.created"
    case customerDiscountUpdated = "customer.discount.updated"
    case customerDiscountDeleted = "customer.discount.deleted"
    case customerTaxIdCreated = "customer.tax_id.created"
    case customerTaxIdUpdated = "customer.tax_id.updated"
    case customerTaxIdDeleted = "customer.tax_id.deleted"

    // Invoice events
    case invoiceCreated = "invoice.created"
    case invoiceUpdated = "invoice.updated"
    case invoiceDeleted = "invoice.deleted"
    case invoiceFinalized = "invoice.finalized"
    case invoicePaid = "invoice.paid"
    case invoicePaymentSucceeded = "invoice.payment_succeeded"
    case invoicePaymentFailed = "invoice.payment_failed"
    case invoicePaymentActionRequired = "invoice.payment_action_required"
    case invoiceSent = "invoice.sent"
    case invoiceUpcoming = "invoice.upcoming"
    case invoiceMarkedUncollectible = "invoice.marked_uncollectible"
    case invoiceVoided = "invoice.voided"

    // Invoice item events
    case invoiceItemCreated = "invoiceitem.created"
    case invoiceItemUpdated = "invoiceitem.updated"
    case invoiceItemDeleted = "invoiceitem.deleted"

    // Payment intent events
    case paymentIntentCreated = "payment_intent.created"
    case paymentIntentSucceeded = "payment_intent.succeeded"
    case paymentIntentPaymentFailed = "payment_intent.payment_failed"
    case paymentIntentCanceled = "payment_intent.canceled"
    case paymentIntentProcessing = "payment_intent.processing"
    case paymentIntentRequiresAction = "payment_intent.requires_action"
    case paymentIntentAmountCapturableUpdated = "payment_intent.amount_capturable_updated"
    case paymentIntentPartiallyFunded = "payment_intent.partially_funded"

    // Payment link events
    case paymentLinkCreated = "payment_link.created"
    case paymentLinkUpdated = "payment_link.updated"

    // Payment method events
    case paymentMethodAttached = "payment_method.attached"
    case paymentMethodDetached = "payment_method.detached"
    case paymentMethodUpdated = "payment_method.updated"
    case paymentMethodAutomaticallyUpdated = "payment_method.automatically_updated"

    // Payout events
    case payoutCreated = "payout.created"
    case payoutUpdated = "payout.updated"
    case payoutCanceled = "payout.canceled"
    case payoutFailed = "payout.failed"
    case payoutPaid = "payout.paid"
    case payoutReconciliationCompleted = "payout.reconciliation_completed"

    // Price events
    case priceCreated = "price.created"
    case priceUpdated = "price.updated"
    case priceDeleted = "price.deleted"

    // Product events
    case productCreated = "product.created"
    case productUpdated = "product.updated"
    case productDeleted = "product.deleted"

    // Refund events
    case refundCreated = "refund.created"
    case refundUpdated = "refund.updated"

    // Setup intent events
    case setupIntentCreated = "setup_intent.created"
    case setupIntentSucceeded = "setup_intent.succeeded"
    case setupIntentCanceled = "setup_intent.canceled"
    case setupIntentRequiresAction = "setup_intent.requires_action"
    case setupIntentSetupFailed = "setup_intent.setup_failed"

    // Subscription schedule events
    case subscriptionScheduleCreated = "subscription_schedule.created"
    case subscriptionScheduleUpdated = "subscription_schedule.updated"
    case subscriptionScheduleCanceled = "subscription_schedule.canceled"
    case subscriptionScheduleReleased = "subscription_schedule.released"
    case subscriptionScheduleCompleted = "subscription_schedule.completed"
    case subscriptionScheduleAborted = "subscription_schedule.aborted"
    case subscriptionScheduleExpiring = "subscription_schedule.expiring"

    // Transfer events
    case transferCreated = "transfer.created"
    case transferUpdated = "transfer.updated"
    case transferReversed = "transfer.reversed"
}
