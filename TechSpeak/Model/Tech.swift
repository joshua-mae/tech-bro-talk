//
//  Tech.swift
//  TechSpeak
//
//  Created by Joshua Mae on 8/8/23.
//

import Foundation

struct Tech: Decodable {
    let tech: String

    enum CodingKeys: String, CodingKey {
        case tech = "message"
    }
}
