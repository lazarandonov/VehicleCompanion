//
//  PlacesView.swift
//  VehicleCompanion
//
//  Created by Lazar Andonov on 26. 9. 2025..
//

import SwiftUI
import MapKit

struct PlacesView: View {
    @StateObject private var viewModel = PlacesViewModel()
    @State private var selectedMode: PlacesViewMode = .list
    @State private var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 39.097, longitude: -84.517),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    var body: some View {
        NavigationStack {
            VStack {
                PlacesModePicker(selectedMode: $selectedMode)
                content
            }
            .navigationTitle("Places")
            .onAppear(perform: loadDataIfNeeded)
            .onChange(of: viewModel.pois) {
                updateRegion(with: viewModel.pois)
            }
        }
    }
}


private extension PlacesView {
    @ViewBuilder
    var content: some View {
        if viewModel.isLoading {
            ProgressView("Loading POIs…")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else if let error = viewModel.errorMessage {
            Text(error)
                .foregroundStyle(.red)
                .padding()
        } else {
            switch selectedMode {
            case .list:
                PlacesListView(pois: viewModel.pois)
            case .map:
                PlacesMapView(pois: viewModel.pois, mapRegion: $mapRegion)
            }
        }
    }

    func loadDataIfNeeded() {
        if viewModel.pois.isEmpty {
            viewModel.loadPOIs(
                swCorner: (-84.540499, 39.079888),
                neCorner: (-84.494260, 39.113254)
            )
        }
    }

    func updateRegion(with pois: [POI]) {
        if let first = pois.first, let loc = first.loc, loc.count == 2 {
            mapRegion.center = CLLocationCoordinate2D(latitude: loc[1], longitude: loc[0])
        }
    }
}
