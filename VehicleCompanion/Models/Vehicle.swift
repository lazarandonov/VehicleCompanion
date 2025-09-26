//
//  Vehicle.swift
//  VehicleCompanion
//
//  Created by Lazar Andonov on 26. 9. 2025..
//

import Foundation
import SwiftData

@Model
final class Vehicle {
    @Attribute(.unique) var id: UUID
    var nickname: String
    var make: String
    var model: String
    var year: Int
    var vin: String
    var fuelType: String
    var heroImageData: Data?

    init(
        id: UUID = UUID(),
        nickname: String,
        make: String,
        model: String,
        year: Int,
        vin: String,
        fuelType: String,
        heroImageData: Data? = nil
    ) {
        self.id = id
        self.nickname = nickname
        self.make = make
        self.model = model
        self.year = year
        self.vin = vin
        self.fuelType = fuelType
        self.heroImageData = heroImageData
    }
}

