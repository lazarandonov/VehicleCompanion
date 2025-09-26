//
//  AddVehicleView.swift
//  VehicleCompanion
//
//  Created by Lazar Andonov on 26. 9. 2025..
//

import SwiftUI

struct AddVehicleView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: GarageViewModel

    @State private var nickname = ""
    @State private var make = ""
    @State private var model = ""
    @State private var year = ""
    @State private var vin = ""
    @State private var fuelType = ""
    @State private var image: UIImage?

    var body: some View {
        NavigationStack {
            Form {
                TextField("Nickname", text: $nickname)
                TextField("Make", text: $make)
                TextField("Model", text: $model)
                TextField("Year", text: $year)
                    .keyboardType(.numberPad)
                TextField("VIN", text: $vin)
                TextField("Fuel Type", text: $fuelType)
            }
            .navigationTitle("Add Vehicle")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        if let yearInt = Int(year) {
                            viewModel.addVehicle(
                                nickname: nickname,
                                make: make,
                                model: model,
                                year: yearInt,
                                vin: vin,
                                fuelType: fuelType
                            )
                            dismiss()
                        }
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
        }
    }
}
