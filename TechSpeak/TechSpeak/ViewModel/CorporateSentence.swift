//
//  CorporateSentence.swift
//  TechSpeak
//
//  Created by Joshua Mae on 8/8/23.
//

import Foundation

class CorporateSentence: ObservableObject {

    @Published var corporateSentence: Corporate
    
    init() {
        self.corporateSentence = Corporate(corporate: "")
    }

    func fetchCorpBroSentence() {
            // Create URL
            guard let url = URL(string: "https://corporatebs-generator.sameerkumar.website") else {return}
            // Create Request
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            // Fetch Request
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard error == nil else {
                    print("Error: \(error!)")
                    return
                }
                guard let data = data else {
                    print("No data")
                    return
                }
                // Decode Response
                do {
                    let corpSentence = try JSONDecoder().decode(Corporate.self, from: data)
                    DispatchQueue.main.async {
                        self.corporateSentence = corpSentence
                    }
                } catch {
                    print("Error decoding: \(error)")
                }
            }
            // Start Request
            task.resume()
        }
}
