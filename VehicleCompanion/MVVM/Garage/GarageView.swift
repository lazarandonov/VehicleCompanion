//
//  GarageView.swift
//  VehicleCompanion
//
//  Created by Lazar Andonov on 26. 9. 2025..
//

import SwiftUI
import SwiftData

struct GarageView: View {
    @StateObject var viewModel: GarageViewModel
    @State private var showAddSheet = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.vehicles) { vehicle in
                    VehicleRow(vehicle: vehicle)
                }
                .onDelete { indexSet in
                    indexSet.forEach { i in
                        let vehicle = viewModel.vehicles[i]
                        viewModel.deleteVehicle(vehicle)
                    }
                }
            }
            .navigationTitle("Garage")
            .toolbar {
                Button {
                    showAddSheet = true
                } label: {
                    Label("Add Vehicle", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showAddSheet) {
                AddVehicleView(viewModel: viewModel)
            }
        }
    }
}
