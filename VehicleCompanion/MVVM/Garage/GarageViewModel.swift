//
//  GarageViewModel.swift
//  VehicleCompanion
//
//  Created by Lazar Andonov on 26. 9. 2025..
//

import Foundation
import SwiftData
import SwiftUI
import Combine

@MainActor
final class GarageViewModel: ObservableObject {
    
    @Published var vehicles: [Vehicle] = []
    @Published var errorMessage: String?

    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
        fetchVehicles()
    }

    func fetchVehicles() {
        do {
            let descriptor = FetchDescriptor<Vehicle>()
            vehicles = try context.fetch(descriptor)
        } catch {
            errorMessage = "Failed to load vehicles: \(error.localizedDescription)"
        }
    }

    func addVehicle(
        nickname: String,
        make: String,
        model: String,
        year: Int,
        vin: String,
        fuelType: String,
        heroImageData: Data? = nil
    ) {
        let vehicle = Vehicle(
            nickname: nickname,
            make: make,
            model: model,
            year: year,
            vin: vin,
            fuelType: fuelType,
            heroImageData: heroImageData
        )
        context.insert(vehicle)
        save()
    }

    func deleteVehicle(_ vehicle: Vehicle) {
        context.delete(vehicle)
        save()
    }

    private func save() {
        do {
            try context.save()
            fetchVehicles()
        } catch {
            errorMessage = "Failed to save: \(error.localizedDescription)"
        }
    }
}
