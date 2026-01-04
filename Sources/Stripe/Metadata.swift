//
//  Metadata.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/5/22.
//

import Foundation

/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object.
/// This can be useful for storing additional information about the object in a structured format.
/// Keys can be up to 40 characters, and values can be up to 500 characters.
public typealias Metadata = [String: String]
