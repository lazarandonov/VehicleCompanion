//
//  PlacesListView.swift
//  VehicleCompanion
//
//  Created by Lazar Andonov on 26. 9. 2025..
//

import SwiftUI

struct PlacesListView: View {
    let pois: [POI]

    var body: some View {
        List(pois) { poi in
            POIRow(poi: poi)
        }
        .listStyle(.plain)
    }
}
