//
//  POIAnnotationView.swift
//  VehicleCompanion
//
//  Created by Lazar Andonov on 26. 9. 2025..
//

import SwiftUI

struct POIAnnotationView: View {
    let poi: POI

    var body: some View {
        VStack(spacing: 2) {
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(.red)
                .frame(width: 24, height: 24)
            Text(poi.name)
                .font(.caption2)
                .fixedSize()
                .foregroundStyle(.black)
        }
    }
}


