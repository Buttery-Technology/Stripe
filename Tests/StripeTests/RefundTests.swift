import Testing
import Foundation
@testable import Stripe

@Suite("Refund Tests")
struct RefundTests {

    // MARK: - JSON Decoding Tests

    @Test("Decodes minimal refund JSON")
    func decodesMinimalRefund() throws {
        let json = """
        {
            "id": "re_123",
            "object": "refund",
            "amount": 1000,
            "charge": "ch_123",
            "created": 1234567890,
            "currency": "usd",
            "status": "succeeded"
        }
        """.data(using: .utf8)!

        let refund = try JSONDecoder().decode(Refund.self, from: json)

        #expect(refund.id == "re_123")
        #expect(refund.object == "refund")
        #expect(refund.amount == 1000)
        #expect(refund.charge == "ch_123")
        #expect(refund.currency == "usd")
        #expect(refund.status == .succeeded)
    }

    @Test("Decodes refund with reason")
    func decodesRefundWithReason() throws {
        let json = """
        {
            "id": "re_reason",
            "object": "refund",
            "amount": 500,
            "charge": "ch_456",
            "created": 1234567890,
            "currency": "usd",
            "reason": "requested_by_customer",
            "status": "succeeded"
        }
        """.data(using: .utf8)!

        let refund = try JSONDecoder().decode(Refund.self, from: json)

        #expect(refund.reason == .requestedByCustomer)
    }

    @Test("Decodes all refund reasons")
    func decodesAllRefundReasons() throws {
        let reasons: [(String, Refund.Reason)] = [
            ("duplicate", .duplicate),
            ("fraudulent", .fraudulent),
            ("requested_by_customer", .requestedByCustomer),
            ("expired_uncaptured_charge", .expiredUncapturedCharge)
        ]

        for (reasonString, expectedReason) in reasons {
            let json = """
            {
                "id": "re_test",
                "object": "refund",
                "amount": 100,
                "created": 1234567890,
                "currency": "usd",
                "reason": "\(reasonString)",
                "status": "succeeded"
            }
            """.data(using: .utf8)!

            let refund = try JSONDecoder().decode(Refund.self, from: json)
            #expect(refund.reason == expectedReason)
        }
    }

    @Test("Decodes refund with destination details")
    func decodesRefundWithDestinationDetails() throws {
        let json = """
        {
            "id": "re_dest",
            "object": "refund",
            "amount": 2000,
            "created": 1234567890,
            "currency": "usd",
            "destination_details": {
                "card": {
                    "reference": "ref_123",
                    "reference_status": "available",
                    "reference_type": "acquirer_reference_number",
                    "type": "refund"
                },
                "type": "card"
            },
            "status": "succeeded"
        }
        """.data(using: .utf8)!

        let refund = try JSONDecoder().decode(Refund.self, from: json)

        #expect(refund.destinationDetails != nil)
        #expect(refund.destinationDetails?.type == "card")
        #expect(refund.destinationDetails?.card?.reference == "ref_123")
        #expect(refund.destinationDetails?.card?.referenceStatus == "available")
    }

    @Test("Decodes refund with failure info")
    func decodesRefundWithFailureInfo() throws {
        let json = """
        {
            "id": "re_failed",
            "object": "refund",
            "amount": 1500,
            "created": 1234567890,
            "currency": "usd",
            "failure_balance_transaction": "txn_fail",
            "failure_reason": "lost_or_stolen_card",
            "status": "failed"
        }
        """.data(using: .utf8)!

        let refund = try JSONDecoder().decode(Refund.self, from: json)

        #expect(refund.status == .failed)
        #expect(refund.failureBalanceTransaction == "txn_fail")
        #expect(refund.failureReason == "lost_or_stolen_card")
    }

    @Test("Decodes refund with next action")
    func decodesRefundWithNextAction() throws {
        let json = """
        {
            "id": "re_action",
            "object": "refund",
            "amount": 3000,
            "created": 1234567890,
            "currency": "usd",
            "instructions_email": "customer@example.com",
            "next_action": {
                "display_details": {
                    "email_sent": {
                        "email_sent_at": 1234567900,
                        "email_sent_to": "customer@example.com"
                    },
                    "expires_at": 1234657890
                },
                "type": "display_details"
            },
            "status": "pending"
        }
        """.data(using: .utf8)!

        let refund = try JSONDecoder().decode(Refund.self, from: json)

        #expect(refund.instructionsEmail == "customer@example.com")
        #expect(refund.nextAction != nil)
        #expect(refund.nextAction?.type == "display_details")
        #expect(refund.nextAction?.displayDetails?.emailSent?.emailSentTo == "customer@example.com")
    }

    @Test("Handles optional charge field")
    func handlesOptionalChargeField() throws {
        let json = """
        {
            "id": "re_no_charge",
            "object": "refund",
            "amount": 500,
            "charge": null,
            "created": 1234567890,
            "currency": "usd",
            "payment_intent": "pi_123",
            "status": "succeeded"
        }
        """.data(using: .utf8)!

        let refund = try JSONDecoder().decode(Refund.self, from: json)

        #expect(refund.charge == nil)
    }

    // MARK: - Schema Tests

    @Test("Has correct schema")
    func hasCorrectSchema() {
        #expect(Refund.schema == "refunds")
    }
}
