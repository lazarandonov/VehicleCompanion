//
//  POIService.swift
//  VehicleCompanion
//
//  Created by Lazar Andonov on 25. 9. 2025..
//

import Foundation

final class Networking {
    
    func fetchPOIs(
        swCorner: (Double, Double),
        neCorner: (Double, Double),
        pageSize: Int = 50
    ) async throws -> [POI] {
        
        guard var components = URLComponents(string: Constans.baseUrl) else {
            throw URLError(.badURL)
        }

        components.queryItems = [
            URLQueryItem(name: "sw_corner", value: "\(swCorner.0),\(swCorner.1)"),
            URLQueryItem(name: "ne_corner", value: "\(neCorner.0),\(neCorner.1)"),
            URLQueryItem(name: "page_size", value: "\(pageSize)")
        ]

        guard let url = components.url else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }

        let decoded = try JSONDecoder().decode(POIResponse.self, from: data)
        return decoded.pois
    }
}

