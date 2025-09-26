//
//  POIAnnotation.swift
//  VehicleCompanion
//
//  Created by Lazar Andonov on 26. 9. 2025..
//

import Foundation
import CoreLocation

struct POIAnnotation: Identifiable {
    let id = UUID()
    let poi: POI
    let coordinate: CLLocationCoordinate2D
}
