//
//  Tech.swift
//  TechSpeak
//
//  Created by Joshua Mae on 8/7/23.
//

//https://corporatebs-generator.sameerkumar.website/ -> next
import Foundation

struct Tech: Codable {
    let tech: String

    enum CodingKeys: String, CodingKey {
        case tech = "message"
    }
}
