//
//  Price.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/5/22.
//

import Foundation

public struct Price: Codable {
    public static let schema = "prices"

    /// Unique identifier for the object.
    public let id: String
    /// String representing the object's type. Objects of the same type share the same value.
    public let object: String
    /// Whether the price can be used for new purchases.
    public let active: Bool
    /// Describes how to compute the price per period. Either `per_unit` or `tiered`.
    public let billingScheme: BillingScheme
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public let created: TimeInterval
    /// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    public let currency: String
    /// Prices defined in each available currency option. Each key must be a three-letter ISO currency code and a supported currency.
    public let currencyOptions: [String: CurrencyOption]?
    /// When set, provides configuration for the amount to be adjusted by the customer during Checkout Sessions and Payment Links.
    public let customUnitAmount: CustomUnitAmount?
    /// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    public let livemode: Bool
    /// A lookup key used to retrieve prices dynamically from a static string. This may be up to 200 characters.
    public let lookupKey: String?
    /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    public let metadata: Metadata?
    /// A brief description of the price, hidden from customers.
    public let nickname: String?
    /// The ID of the product this price is associated with. Expandable.
    public let product: String
    /// The recurring components of a price such as `interval` and `usage_type`.
    public let recurring: Recurring?
    /// Specifies whether the price is considered inclusive of taxes or exclusive of taxes.
    public let taxBehavior: TaxBehavior?
    /// Each element represents a pricing tier. This parameter requires `billing_scheme` to be set to `tiered`. See also the documentation for `billing_scheme`. This field is not included by default. To include it in the response, [expand](https://stripe.com/docs/api/expanding_objects) the `tiers` field.
    public let tiers: [Tier]?
    /// Defines if the tiering price should be `graduated` or `volume` based.
    public let tiersMode: TiersMode?
    /// Apply a transformation to the reported usage or set quantity before computing the amount billed. Cannot be combined with `tiers`.
    public let transformQuantity: TransformQuantity?
    /// One of `one_time` or `recurring` depending on whether the price is for a one-time purchase or a recurring (subscription) purchase.
    public let type: PriceType
    /// The unit amount in cents to be charged, represented as a whole integer if possible. Only set if `billing_scheme=per_unit`.
    public let unitAmount: Int?
    /// The unit amount in cents to be charged, represented as a decimal string with at most 12 decimal places. Only set if `billing_scheme=per_unit`.
    public let unitAmountDecimal: String?

    /// Designated initializer
    public init(id: String, object: String, active: Bool, billingScheme: BillingScheme, created: TimeInterval, currency: String, currencyOptions: [String: CurrencyOption]?, customUnitAmount: CustomUnitAmount?, livemode: Bool, lookupKey: String?, metadata: Metadata?, nickname: String?, product: String, recurring: Recurring?, taxBehavior: TaxBehavior?, tiers: [Tier]?, tiersMode: TiersMode?, transformQuantity: TransformQuantity?, type: PriceType, unitAmount: Int?, unitAmountDecimal: String?) {
        self.id = id
        self.object = object
        self.active = active
        self.billingScheme = billingScheme
        self.created = created
        self.currency = currency
        self.currencyOptions = currencyOptions
        self.customUnitAmount = customUnitAmount
        self.livemode = livemode
        self.lookupKey = lookupKey
        self.metadata = metadata
        self.nickname = nickname
        self.product = product
        self.recurring = recurring
        self.taxBehavior = taxBehavior
        self.tiers = tiers
        self.tiersMode = tiersMode
        self.transformQuantity = transformQuantity
        self.type = type
        self.unitAmount = unitAmount
        self.unitAmountDecimal = unitAmountDecimal
    }

    public enum CodingKeys: String, CodingKey {
        case id,
             object,
             active,
             billingScheme = "billing_scheme",
             created,
             currency,
             currencyOptions = "currency_options",
             customUnitAmount = "custom_unit_amount",
             livemode,
             lookupKey = "lookup_key",
             metadata,
             nickname,
             product,
             recurring,
             taxBehavior = "tax_behavior",
             tiers,
             tiersMode = "tiers_mode",
             transformQuantity = "transform_quantity",
             type,
             unitAmount = "unit_amount",
             unitAmountDecimal = "unit_amount_decimal"
    }

    // MARK: - Currency Option
    public struct CurrencyOption: Codable {
        /// When set, provides configuration for the amount to be adjusted by the customer during Checkout Sessions and Payment Links.
        public let customUnitAmount: CustomUnitAmount?
        /// Specifies whether the price is considered inclusive of taxes or exclusive of taxes.
        public let taxBehavior: String?
        /// Each element represents a pricing tier for tiered billing.
        public let tiers: [Tier]?
        /// The unit amount in cents to be charged.
        public let unitAmount: Int?
        /// The unit amount in cents as a decimal string with at most 12 decimal places.
        public let unitAmountDecimal: String?

        public init(customUnitAmount: CustomUnitAmount?, taxBehavior: String?, tiers: [Tier]?, unitAmount: Int?, unitAmountDecimal: String?) {
            self.customUnitAmount = customUnitAmount
            self.taxBehavior = taxBehavior
            self.tiers = tiers
            self.unitAmount = unitAmount
            self.unitAmountDecimal = unitAmountDecimal
        }

        public enum CodingKeys: String, CodingKey {
            case customUnitAmount = "custom_unit_amount",
                 taxBehavior = "tax_behavior",
                 tiers,
                 unitAmount = "unit_amount",
                 unitAmountDecimal = "unit_amount_decimal"
        }
    }

    // MARK: - Custom Unit Amount
    public struct CustomUnitAmount: Codable {
        /// The maximum unit amount the customer can specify for this item.
        public let maximum: Int?
        /// The minimum unit amount the customer can specify for this item.
        public let minimum: Int?
        /// The starting unit amount which can be updated by the customer.
        public let preset: Int?

        public init(maximum: Int?, minimum: Int?, preset: Int?) {
            self.maximum = maximum
            self.minimum = minimum
            self.preset = preset
        }
    }
    
    public struct Recurring: Codable {
        /// Specifies a usage aggregation strategy for prices of `usage_type=metered`. Allowed values are `sum` for summing up all usage during a period, `last_during_period` for using the last usage record reported within a period, `last_ever` for using the last usage record ever (across period bounds) or `max` which uses the usage record with the maximum reported usage during a period. Defaults to `sum`.
        public let aggregateUsage: String?
        /// The frequency at which a subscription is billed. One of `day`, `week`, `month` or `year`.
        public let interval: RecurringInterval
        /// The number of intervals (specified in the interval attribute) between subscription billings. For example, interval=month and interval_count=3 bills every 3 months.
        public let intervalCount: Int
        /// The meter tracking the usage of a metered price.
        public let meter: String?
        /// Configures how the quantity per period should be determined. Can be either `metered` or `licensed`. `licensed` automatically bills the `quantity` set when adding it to a subscription. `metered` aggregates the total usage based on usage records. Defaults to `licensed`.
        public let usageType: UsageType

        /// Designated initializer
        public init(aggregateUsage: String?, interval: RecurringInterval, intervalCount: Int, meter: String?, usageType: UsageType) {
            self.aggregateUsage = aggregateUsage
            self.interval = interval
            self.intervalCount = intervalCount
            self.meter = meter
            self.usageType = usageType
        }

        public enum CodingKeys: String, CodingKey {
            case aggregateUsage = "aggregate_usage",
                 interval,
                 intervalCount = "interval_count",
                 meter,
                 usageType = "usage_type"
        }

        public enum RecurringInterval: String, Codable {
            case day, month, week, year
        }

        public enum UsageType: String, Codable {
            case licensed, metered
        }
    }
    
    public struct Tier: Codable {
        /// Price for the entire tier.
        public let flatAmount: Int?
        /// Same as `flat_amount`, but contains a decimal value with at most 12 decimal places.
        public let flatAmountDecimal: String?
        /// Per unit price for units relevant to the tier.
        public let unitAmount: Int?
        /// Same as `unit_amount`, but contains a decimal value with at most 12 decimal places.
        public let unitAmountDecimal: String?
        /// Up to and including to this quantity will be contained in the tier.
        public let upTo: Int?

        /// Designated initializer
        public init(flatAmount: Int?, flatAmountDecimal: String?, unitAmount: Int?, unitAmountDecimal: String?, upTo: Int?) {
            self.flatAmount = flatAmount
            self.flatAmountDecimal = flatAmountDecimal
            self.unitAmount = unitAmount
            self.unitAmountDecimal = unitAmountDecimal
            self.upTo = upTo
        }

        public enum CodingKeys: String, CodingKey {
            case flatAmount = "flat_amount",
                 flatAmountDecimal = "flat_amount_decimal",
                 unitAmount = "unit_amount",
                 unitAmountDecimal = "unit_amount_decimal",
                 upTo = "up_to"
        }
    }
    
    public struct TransformQuantity: Codable {
        /// Divide usage by this number.
        public let divideBy: Int
        /// After division, either round the result `up` or `down`.
        public let round: Round
        
        /// Designated initializer
        public init(divideBy: Int, round: Round) {
            self.divideBy = divideBy
            self.round = round
        }
        
        public enum CodingKeys: String, CodingKey {
            case divideBy = "divide_by",
                 round
        }
        
        public enum Round: String, Codable {
            case down, up
        }
    }

    // MARK: - Enums

    public enum BillingScheme: String, Codable {
        case perUnit = "per_unit"
        case tiered
    }

    public enum TaxBehavior: String, Codable {
        case exclusive
        case inclusive
        case unspecified
    }

    public enum TiersMode: String, Codable {
        case graduated
        case volume
    }

    public enum PriceType: String, Codable {
        case oneTime = "one_time"
        case recurring
    }
}
