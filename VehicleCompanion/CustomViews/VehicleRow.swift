//
//  VehicleRow.swift
//  VehicleCompanion
//
//  Created by Lazar Andonov on 26. 9. 2025..
//

import SwiftUI

struct VehicleRow: View {
    let vehicle: Vehicle

    var body: some View {
        HStack {
            if let data = vehicle.heroImageData,
               let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 60, height: 60)
                    .overlay(Image(systemName: "car.fill"))
            }

            VStack(alignment: .leading) {
                Text(vehicle.nickname)
                    .font(.headline)
                Text("\(vehicle.make) \(vehicle.model) • \(vehicle.year)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

