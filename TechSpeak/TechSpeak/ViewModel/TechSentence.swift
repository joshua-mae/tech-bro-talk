//
//  TechSentence.swift
//  TechSpeak
//
//  Created by Joshua Mae on 8/8/23.
//

import Foundation

class TechSentence: ObservableObject {

    @Published var sentence: Tech
    
    init() {
        self.sentence = Tech(tech: "")
    }

    func fetchTechBroSentence() {
            // Create URL
            guard let url = URL(string: "https://techy-api.vercel.app/api/json") else {return}
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
                    let techSentence = try JSONDecoder().decode(Tech.self, from: data)
                    DispatchQueue.main.async {
                        self.sentence = techSentence
                    }
                } catch {
                    print("Error decoding: \(error)")
                }
            }
            // Start Request
            task.resume()
        }
}
