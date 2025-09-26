//
//  PlacesModePicker.swift
//  VehicleCompanion
//
//  Created by Lazar Andonov on 26. 9. 2025..
//

import SwiftUI

struct PlacesModePicker: View {
    @Binding var selectedMode: PlacesViewMode

    var body: some View {
        Picker("View Mode", selection: $selectedMode) {
            Text("List").tag(PlacesViewMode.list)
            Text("Map").tag(PlacesViewMode.map)
        }
        .pickerStyle(.segmented)
        .padding()
    }
}

