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
    
    // MARK: - Methods. Public
    
    func loadCards() {
        self.isLoading = true
        
        defer {
            self.isLoading = false
        }
        
        self.cards = JSONLoader.load("Interiors")
    }
}

