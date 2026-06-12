//
//  LaunchViewModel.swift
//  await
//
//  Created by Amandine on 12/04/26.
//

import Foundation
import Combine

@MainActor
class LaunchViewModel: ObservableObject {
    @Published var launches: [Launch] = []
    @Published var isLoading = true
    @Published var errorMessage: String?

    func fetchLaunches() async {
        isLoading = true

        guard let url = Bundle.main.url(forResource: "launches", withExtension: "json") else {
            errorMessage = "Fichier JSON introuvable"
            isLoading = false
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            launches = try decoder.decode([Launch].self, from: data)
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
