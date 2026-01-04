//
//  Order.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/4/22.
//

import Foundation

public struct Order: Codable {
    public static let schema = "orders"
    
    /// Order cost before any discounts or taxes are applied. A positive integer representing the subtotal of the order in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency).
    public let amountSubtotal: Int
    /// Total order cost after discounts and taxes are applied. A positive integer representing the cost of the order in the smallest currency unit (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency).
    public let amountTotal: Int
    /// ID of the Connect application that created the Order, if any.
    public let application: String?
    /// Settings and latest results for automatic tax lookup for this Order.
    public let automaticTax: AutomaticTax
    /// Customer billing details associated with the order.
    public let billingDetails: Billing?
    /// The client secret of this Order. Used for client-side retrieval using a publishable key.
    /// The client secret can be used to complete a payment for an Order from your frontend. It should not be stored, logged, embedded in URLs, or exposed to anyone other than the customer. Make sure that you have TLS enabled on any page that includes the client secret.
    /// Refer to our docs for [creating and processing](https://stripe.com/docs/orders-beta/create-and-process) an order to learn about how client_secret should be handled.
    public let clientSecret: String?
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public let created: Int
    /// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    public let currency: String
    /// The customer which this orders belongs to.
    public let customer: Customer.Expandable?
    /// The discounts applied to the order. Use `expand[]=discounts` to expand each discount.
    public let discounts: Discount.ExpandableArray
    /// The unique identifier of the object.
    public let id: String
    /// A recent IP address of the purchaser used for tax reporting and tax location inference.
    public let ipAddress: String?
    /// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    public let livemode: Bool
    /// A list of line items the customer is ordering. Each line item includes information about the product, the quantity, and the resulting cost. There is a maximum of 100 line items. This field is not included by default. To include it in the response, [expand](https://stripe.com/docs/api/expanding_objects) the `line_items` field.
    public let lineItems: [LineItem]?
    public let metadata: Metadata
    /// String representing the object’s type. Objects of the same type share the same value.
    public let object: String
    /// An arbitrary string attached to the object. Often useful for displaying to users.
    public let orderDescription: String?
    public let payment: Payment
    /// The details of the customer cost of shipping, including the customer chosen ShippingRate.
    public let shippingCost: ShippingCost?
    /// Customer shipping information associated with the order.
    public let shippingDetails: Shipping?
    public let status: Self.Status
    public let taxDetails: TaxDetails?
    /// Tax, discount, and shipping details for the computed total amount of this order.
    public let totalDetails: TotalDetails
    
    /// Designated initializer
    public init(amountSubtotal: Int, amountTotal: Int, application: String?, automaticTax: AutomaticTax, billingDetails: Billing?, clientSecret: String?, created: Int, currency: String, customer: Customer.Expandable?, discounts: Discount.ExpandableArray, id: String, ipAddress: String?, livemode: Bool, lineItems: [LineItem]?, metadata: Metadata, object: String, orderDescription: String?, payment: Payment, shippingCost: ShippingCost?, shippingDetails: Shipping?, status: Self.Status, taxDetails: TaxDetails?, totalDetails: TotalDetails) {
        self.amountSubtotal = amountSubtotal
        self.amountTotal = amountTotal
        self.application = application
        self.automaticTax = automaticTax
        self.billingDetails = billingDetails
        self.clientSecret = clientSecret
        self.created = created
        self.currency = currency
        self.customer = customer
        self.discounts = discounts
        self.id = id
        self.ipAddress = ipAddress
        self.livemode = livemode
        self.lineItems = lineItems
        self.metadata = metadata
        self.object = object
        self.orderDescription = orderDescription
        self.payment = payment
        self.shippingCost = shippingCost
        self.shippingDetails = shippingDetails
        self.status = status
        self.taxDetails = taxDetails
        self.totalDetails = totalDetails
    }
    
    public enum CodingKeys: String, CodingKey {
        case amountSubtotal = "amount_subtotal",
             amountTotal = "amount_total",
             application,
             automaticTax = "automatic_tax",
             billingDetails = "billing_details",
             clientSecret = "client_secret",
             created,
             currency,
             customer,
             discounts,
             id,
             ipAddress = "ip_address",
             lineItems = "line_items",
             livemode,
             metadata,
             object,
             orderDescription = "description",
             payment,
             shippingCost = "shipping_cost",
             shippingDetails = "shipping_details",
             status,
             taxDetails = "tax_details",
             totalDetails = "total_details"
    }
}
