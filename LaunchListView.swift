//
//  LaunchListView.swift
//  await
//
//  Created by Amandine on 12/04/26.
//
import SwiftUI

struct LaunchListView: View {
    @StateObject var viewModel = LaunchViewModel()
    
    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let error = viewModel.errorMessage {
                Text("Erreur : \(error)")
                    .foregroundColor(.red)
            } else {
                List(viewModel.launches) { launch in
                    VStack(alignment: .leading, spacing: 6) {
                        Text(launch.name)
                            .font(.headline)
                        Text(launch.details ?? "No details")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .lineLimit(2)
                    }
                }
                .navigationTitle("SpaceX 🚀")
            }
        }
        .task {
            await viewModel.fetchLaunches()
        }
    }
}
