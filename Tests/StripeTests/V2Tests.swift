import Testing
import Foundation
@testable import Stripe

@Suite("V2 API Tests")
struct V2Tests {

    // MARK: - V2ListObject Tests

    @Suite("V2ListObject")
    struct V2ListObjectTests {

        @Test("Decodes list with pagination URLs")
        func decodesListWithPaginationURLs() throws {
            let json = """
            {
                "data": [
                    {"id": "item_1"},
                    {"id": "item_2"}
                ],
                "next_page_url": "https://api.stripe.com/v2/resource?page=next",
                "previous_page_url": "https://api.stripe.com/v2/resource?page=prev"
            }
            """.data(using: .utf8)!

            struct TestItem: Codable {
                let id: String
            }

            let list = try JSONDecoder().decode(V2ListObject<TestItem>.self, from: json)

            #expect(list.data.count == 2)
            #expect(list.data[0].id == "item_1")
            #expect(list.nextPageUrl == "https://api.stripe.com/v2/resource?page=next")
            #expect(list.previousPageUrl == "https://api.stripe.com/v2/resource?page=prev")
            #expect(list.hasMore == true)
            #expect(list.hasPrevious == true)
        }

        @Test("Decodes list without pagination")
        func decodesListWithoutPagination() throws {
            let json = """
            {
                "data": [{"id": "only_item"}],
                "next_page_url": null,
                "previous_page_url": null
            }
            """.data(using: .utf8)!

            struct TestItem: Codable {
                let id: String
            }

            let list = try JSONDecoder().decode(V2ListObject<TestItem>.self, from: json)

            #expect(list.hasMore == false)
            #expect(list.hasPrevious == false)
        }
    }

    // MARK: - MeterEvent Tests

    @Suite("MeterEvent")
    struct MeterEventTests {

        @Test("Has correct schema")
        func hasCorrectSchema() {
            #expect(MeterEvent.schema == "billing/meter_events")
        }

        @Test("Creates meter event with required fields")
        func createsMeterEventWithRequiredFields() {
            let event = MeterEvent(
                eventName: "api_requests",
                payload: ["stripe_customer_id": "cus_123", "value": "100"]
            )

            #expect(event.eventName == "api_requests")
            #expect(event.payload["stripe_customer_id"] == "cus_123")
            #expect(event.payload["value"] == "100")
            #expect(event.identifier == nil)
            #expect(event.timestamp == nil)
        }

        @Test("Creates meter event with all fields")
        func createsMeterEventWithAllFields() {
            let timestamp = Date().timeIntervalSince1970
            let event = MeterEvent(
                eventName: "storage_usage",
                identifier: "evt_unique_123",
                payload: ["stripe_customer_id": "cus_456", "value": "500"],
                timestamp: timestamp
            )

            #expect(event.eventName == "storage_usage")
            #expect(event.identifier == "evt_unique_123")
            #expect(event.timestamp == timestamp)
        }

        @Test("Encodes to JSON correctly")
        func encodesToJSONCorrectly() throws {
            let event = MeterEvent(
                eventName: "test_event",
                identifier: "test_id",
                payload: ["key": "value"],
                timestamp: nil
            )

            let encoder = JSONEncoder()
            let data = try encoder.encode(event)
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]

            #expect(json?["event_name"] as? String == "test_event")
            #expect(json?["identifier"] as? String == "test_id")
        }
    }

    // MARK: - MeterEventSession Tests

    @Suite("MeterEventSession")
    struct MeterEventSessionTests {

        @Test("Has correct schema")
        func hasCorrectSchema() {
            #expect(MeterEventSession.schema == "billing/meter_event_session")
        }

        @Test("Decodes session from JSON")
        func decodesSessionFromJSON() throws {
            let json = """
            {
                "id": "mes_123",
                "object": "billing.meter_event_session",
                "authentication_token": "token_abc123",
                "created": 1704067200,
                "expires_at": 1704068100,
                "livemode": true
            }
            """.data(using: .utf8)!

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            let session = try decoder.decode(MeterEventSession.self, from: json)

            #expect(session.id == "mes_123")
            #expect(session.authenticationToken == "token_abc123")
            #expect(session.livemode == true)
        }
    }

    // MARK: - EventDestination Tests

    @Suite("EventDestination")
    struct EventDestinationTests {

        @Test("Has correct schema")
        func hasCorrectSchema() {
            #expect(EventDestination.schema == "core/event_destinations")
        }

        @Test("Decodes webhook destination")
        func decodesWebhookDestination() throws {
            let json = """
            {
                "id": "ed_123",
                "object": "event_destination",
                "created": 1704067200,
                "enabled_events": ["charge.succeeded", "charge.failed"],
                "type": "webhook_endpoint",
                "livemode": true,
                "name": "My Webhook",
                "status": "enabled",
                "updated": 1704067200,
                "webhook_endpoint": {
                    "url": "https://example.com/webhook"
                }
            }
            """.data(using: .utf8)!

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            let destination = try decoder.decode(EventDestination.self, from: json)

            #expect(destination.id == "ed_123")
            #expect(destination.type == .webhookEndpoint)
            #expect(destination.enabledEvents.count == 2)
            #expect(destination.status == .enabled)
            #expect(destination.webhookEndpoint?.url == "https://example.com/webhook")
        }

        @Test("Decodes EventBridge destination")
        func decodesEventBridgeDestination() throws {
            let json = """
            {
                "id": "ed_456",
                "object": "event_destination",
                "created": 1704067200,
                "enabled_events": ["*"],
                "type": "amazon_eventbridge",
                "livemode": false,
                "name": "AWS EventBridge",
                "status": "enabled",
                "updated": 1704067200,
                "amazon_eventbridge": {
                    "aws_account_id": "123456789012",
                    "aws_region": "us-east-1"
                }
            }
            """.data(using: .utf8)!

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            let destination = try decoder.decode(EventDestination.self, from: json)

            #expect(destination.type == .amazonEventbridge)
            #expect(destination.amazonEventbridge?.awsAccountId == "123456789012")
            #expect(destination.amazonEventbridge?.awsRegion == "us-east-1")
        }
    }

    // MARK: - ThinEvent Tests

    @Suite("ThinEvent")
    struct ThinEventTests {

        @Test("Decodes thin event from JSON")
        func decodesThinEventFromJSON() throws {
            let json = """
            {
                "id": "evt_123",
                "object": "event",
                "api_version": "2024-09-30.acacia",
                "created": 1704067200,
                "livemode": true,
                "type": "charge.succeeded",
                "related_object": {
                    "id": "ch_123",
                    "type": "charge",
                    "url": "/v1/charges/ch_123"
                }
            }
            """.data(using: .utf8)!

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            let event = try decoder.decode(ThinEvent.self, from: json)

            #expect(event.id == "evt_123")
            #expect(event.type == "charge.succeeded")
            #expect(event.livemode == true)
            #expect(event.relatedObject.id == "ch_123")
            #expect(event.relatedObject.type == "charge")
        }

        @Test("Decodes event with request reason")
        func decodesEventWithRequestReason() throws {
            let json = """
            {
                "id": "evt_456",
                "object": "event",
                "created": 1704067200,
                "livemode": false,
                "type": "customer.created",
                "related_object": {
                    "id": "cus_123",
                    "type": "customer"
                },
                "reason": {
                    "type": "request",
                    "request": {
                        "id": "req_abc",
                        "idempotency_key": "key_123"
                    }
                }
            }
            """.data(using: .utf8)!

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            let event = try decoder.decode(ThinEvent.self, from: json)

            #expect(event.reason?.type == .request)
            #expect(event.reason?.request?.id == "req_abc")
            #expect(event.reason?.request?.idempotencyKey == "key_123")
        }
    }
}
