//
//  Corporate.swift
//  TechSpeak
//
//  Created by Joshua Mae on 8/8/23.
//

import Foundation

struct Corporate: Decodable {
    let corporate: String

    enum CodingKeys: String, CodingKey {
        case corporate = "phrase"
    }
}
