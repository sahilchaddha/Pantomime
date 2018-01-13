//
//  VarientMetadata.swift
//  Pantomime (iOS)
//
//  Created by Sahil Chaddha on 11/01/2018.
//  Copyright © 2018 Thomas Christensen. All rights reserved.
//

import Foundation

public struct VarientMetadata: Codable {
    public let high: Double?
    public let medium: Double?
    public let low: Double?
    
    public init(high: Double?, medium: Double?, low: Double?) {
        self.high = high
        self.medium = medium
        self.low = low
    }
}
