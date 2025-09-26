//
//  POISmallDetailView.swift
//  VehicleCompanion
//
//  Created by Lazar Andonov on 26. 9. 2025..
//

import SwiftUI

struct POISmallDetailView: View {
    let poi: POI

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(poi.name)
                .font(.headline)
            if let category = poi.category {
                Text(category)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            if let rating = poi.rating {
                HStack(spacing: 2) {
                    ForEach(0..<5, id: \.self) { i in
                        Image(systemName: i < Int(rating.rounded()) ? "star.fill" : "star")
                            .font(.caption)
                            .foregroundStyle(i < Int(rating.rounded()) ? .yellow : .gray)
                    }
                }
            }
        }
        .padding()
    }
}
