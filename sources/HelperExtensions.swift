//
//  HelperExtensions.swift
//  Pantomime (iOS)
//
//  Created by Sahil Chaddha on 24/01/2018.
//  Copyright © 2018 Thomas Christensen. All rights reserved.
//

import Foundation

extension Optional {
    func `or`(_ value : Wrapped?) -> Optional {
        return self ?? value
    }
    func `or`(_ value: Wrapped) -> Wrapped {
        return self ?? value
    }
}
