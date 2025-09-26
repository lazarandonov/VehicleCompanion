//
//  POI.swift
//  VehicleCompanion
//
//  Created by Lazar Andonov on 25. 9. 2025..
//

import Foundation

struct POIResponse: Decodable, Sendable {
    let pois: [POI]
}

struct POI: Identifiable, Decodable, Sendable, Equatable {
    let id: Int
    let name: String
    let url: String?
    let category: String?
    let rating: Double?
    let imageURL: String?
    let loc: [Double]?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case url
        case category = "primary_category_display_name"
        case rating
        case imageURL = "v_320x320_url"
        case loc
    }
}
