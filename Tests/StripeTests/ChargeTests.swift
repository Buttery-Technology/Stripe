import Testing
import Foundation
@testable import Stripe

@Suite("Charge Tests")
struct ChargeTests {

    // MARK: - JSON Decoding Tests

    @Test("Decodes minimal charge JSON")
    func decodesMinimalCharge() throws {
        let json = """
        {
            "id": "ch_123",
            "object": "charge",
            "amount": 2000,
            "amount_captured": 2000,
            "amount_refunded": 0,
            "billing_details": {
                "address": null,
                "email": "test@example.com",
                "name": "Test User",
                "phone": null,
                "tax_id": null
            },
            "captured": true,
            "created": 1234567890,
            "currency": "usd",
            "disputed": false,
            "livemode": false,
            "paid": true,
            "refunded": false,
            "status": "succeeded"
        }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()
        let charge = try decoder.decode(Charge.self, from: json)

        #expect(charge.id == "ch_123")
        #expect(charge.object == "charge")
        #expect(charge.amount == 2000)
        #expect(charge.amountCaptured == 2000)
        #expect(charge.amountRefunded == 0)
        #expect(charge.captured == true)
        #expect(charge.currency == "usd")
        #expect(charge.disputed == false)
        #expect(charge.livemode == false)
        #expect(charge.paid == true)
        #expect(charge.refunded == false)
        #expect(charge.status == .succeeded)
    }

    @Test("Decodes charge with outcome")
    func decodesChargeWithOutcome() throws {
        let json = """
        {
            "id": "ch_456",
            "object": "charge",
            "amount": 5000,
            "amount_captured": 5000,
            "amount_refunded": 0,
            "billing_details": {
                "address": null,
                "email": null,
                "name": null,
                "phone": null,
                "tax_id": null
            },
            "captured": true,
            "created": 1234567890,
            "currency": "eur",
            "disputed": false,
            "livemode": true,
            "outcome": {
                "network_status": "approved_by_network",
                "reason": null,
                "risk_level": "normal",
                "risk_score": 25,
                "seller_message": "Payment complete.",
                "type": "authorized"
            },
            "paid": true,
            "refunded": false,
            "status": "succeeded"
        }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()
        let charge = try decoder.decode(Charge.self, from: json)

        #expect(charge.id == "ch_456")
        #expect(charge.outcome != nil)
        #expect(charge.outcome?.networkStatus == "approved_by_network")
        #expect(charge.outcome?.riskLevel == "normal")
        #expect(charge.outcome?.riskScore == 25)
        #expect(charge.outcome?.type == "authorized")
    }

    @Test("Decodes charge with fraud details")
    func decodesChargeWithFraudDetails() throws {
        let json = """
        {
            "id": "ch_789",
            "object": "charge",
            "amount": 1000,
            "amount_captured": 1000,
            "amount_refunded": 0,
            "billing_details": {
                "address": null,
                "email": null,
                "name": null,
                "phone": null,
                "tax_id": null
            },
            "captured": true,
            "created": 1234567890,
            "currency": "usd",
            "disputed": false,
            "fraud_details": {
                "stripe_report": "fraudulent",
                "user_report": null
            },
            "livemode": false,
            "paid": true,
            "refunded": false,
            "status": "succeeded"
        }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()
        let charge = try decoder.decode(Charge.self, from: json)

        #expect(charge.fraudDetails != nil)
        #expect(charge.fraudDetails?.stripeReport == "fraudulent")
        #expect(charge.fraudDetails?.userReport == nil)
    }

    @Test("Decodes all charge statuses")
    func decodesAllStatuses() throws {
        let statuses = ["succeeded", "pending", "failed"]
        let expected: [Charge.Status] = [.succeeded, .pending, .failed]

        for (statusString, expectedStatus) in zip(statuses, expected) {
            let json = """
            {
                "id": "ch_test",
                "object": "charge",
                "amount": 100,
                "amount_captured": 100,
                "amount_refunded": 0,
                "billing_details": {"address": null, "email": null, "name": null, "phone": null, "tax_id": null},
                "captured": true,
                "created": 1234567890,
                "currency": "usd",
                "disputed": false,
                "livemode": false,
                "paid": true,
                "refunded": false,
                "status": "\(statusString)"
            }
            """.data(using: .utf8)!

            let charge = try JSONDecoder().decode(Charge.self, from: json)
            #expect(charge.status == expectedStatus)
        }
    }

    // MARK: - Schema Tests

    @Test("Has correct schema")
    func hasCorrectSchema() {
        #expect(Charge.schema == "charges")
    }
}
