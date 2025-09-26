//
//  PlacesMapView.swift
//  VehicleCompanion
//
//  Created by Lazar Andonov on 26. 9. 2025..
//

import SwiftUI
import MapKit

struct PlacesMapView: View {
    let pois: [POI]
    @Binding var mapRegion: MKCoordinateRegion
    @State private var selectedPOI: POI?

    private var annotatedPOIs: [POIAnnotation] {
        pois.compactMap { poi in
            if let loc = poi.loc, loc.count == 2 {
                return POIAnnotation(
                    poi: poi,
                    coordinate: CLLocationCoordinate2D(latitude: loc[1], longitude: loc[0])
                )
            }
            return nil
        }
    }

    var body: some View {
        ZStack {
            Map(initialPosition: .region(mapRegion)) {
                ForEach(annotatedPOIs) { item in
                    Annotation(item.poi.name, coordinate: item.coordinate) {
                        POIAnnotationView(poi: item.poi)
                            .onTapGesture {
                                selectedPOI = item.poi
                            }
                    }
                }
            }
            .ignoresSafeArea()

            if let poi = selectedPOI {
                VStack {
                    Spacer()
                    POISmallDetailView(poi: poi)
                        .padding()
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12))
                        .padding()
                }
                .transition(.move(edge: .bottom).combined(with: .opacity))
                .animation(.spring(), value: selectedPOI)
            }
        }
    }
}
