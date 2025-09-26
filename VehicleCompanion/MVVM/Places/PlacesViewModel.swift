//
//  PlacesViewModel.swift
//  VehicleCompanion
//
//  Created by Lazar Andonov on 26. 9. 2025..
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class PlacesViewModel: ObservableObject {
    
    @Published var pois: [POI] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service: Networking = Networking()

    func loadPOIs(
        swCorner: (Double, Double),
        neCorner: (Double, Double),
        pageSize: Int = 50
    ) {
        isLoading = true
        errorMessage = nil
        Task {
            do {
                let pois = try await service.fetchPOIs(
                    swCorner: swCorner,
                    neCorner: neCorner,
                    pageSize: pageSize
                )
                self.pois = pois
            } catch {
                self.errorMessage = "Failed to fetch POIs: \(error.localizedDescription)"
            }
            isLoading = false
        }
    }
}

