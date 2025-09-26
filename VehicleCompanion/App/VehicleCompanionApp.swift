//
//  VehicleCompanionApp.swift
//  VehicleCompanion
//
//  Created by Lazar Andonov on 24. 9. 2025..
//

import SwiftUI
import SwiftData

@main
struct VehicleCompanionApp: App {
    
    private let container: ModelContainer
    
    init() {
        let schema = Schema([Vehicle.self])
        container = try! ModelContainer(for: schema)
    }
    
    var body: some Scene {
        WindowGroup {
            TabView {
                // 🚗 Garage tab
                let garageVM = GarageViewModel(context: container.mainContext)
                GarageView(viewModel: garageVM)
                    .tabItem {
                        Label("Garage", systemImage: "car.fill")
                    }

                // 📍 Places tab
                PlacesView()
                    .tabItem {
                        Label("Places", systemImage: "map.fill")
                    }
            }
        }
        .modelContainer(container)
    }
}
