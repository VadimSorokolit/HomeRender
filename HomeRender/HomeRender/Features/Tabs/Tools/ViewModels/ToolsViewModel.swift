//
//  ToolsViewModel.swift
//  HomeRender
//
//  Created by Vadim Sorokolit on 18.06.2026.
//

import Foundation
import Observation

@MainActor
@Observable
class ToolsViewModel {
    
    // MARK: - Properties. Public
    
    private(set) var cards: [ToolCard] = []
    private(set) var isLoading: Bool = false
    private(set) var error: String?
    
    // MARK: - Methods. Public
    
    func loadCards() async {
        self.isLoading = true
        
        defer {
            self.isLoading = false
        }
        
        do {
            self.cards = try JSONLoader.load("Interiors")
        } catch {
            self.handleError(error)
        }
    }
    
    // Methods. Private
    
    private func handleError(_ error: Error) {
        self.error = error.localizedDescription
    }
}
