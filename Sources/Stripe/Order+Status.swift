//
//  Order+Status.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/5/22.
//

import Foundation

extension Order {
    public enum Status: String, Codable, Sendable {
        case cancelled, complete, open, processing, submitted
    }
}
