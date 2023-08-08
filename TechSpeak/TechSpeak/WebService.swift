//
//  WebService.swift
//  TechSpeak
//
//  Created by Joshua Mae on 8/7/23.
//

import Foundation


enum NetworkError: Error {
    case invalidUrl
    case badRequest
}



class Webservice {
    func fetchRandomTechBro() async throws -> Tech? {
        
        guard let url = URL(string: "https://techy-api.vercel.app/api/json") else {
            throw NetworkError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        return try JSONDecoder().decode(Tech.self, from: data)
        
    }
}
