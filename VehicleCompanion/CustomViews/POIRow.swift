//
//  POIRow.swift
//  VehicleCompanion
//
//  Created by Lazar Andonov on 26. 9. 2025..
//

import SwiftUI

struct POIRow: View {
    let poi: POI

    var body: some View {
        HStack(spacing: 12) {
            if let imageURL = poi.imageURL,
               let url = URL(string: imageURL) {
                AsyncImage(url: url) { image in
                    image.resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 60, height: 60)
                    .overlay(Image(systemName: "photo"))
            }

            VStack(alignment: .leading, spacing: 4) {
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
                            Image(systemName: Double(i) < rating ? "star.fill" : "star")
                                .font(.caption)
                                .foregroundStyle(Double(i) < rating ? .yellow : .gray)
                        }
                    }
                }
            }
        }
        .padding(.vertical, 4)
    }
}

