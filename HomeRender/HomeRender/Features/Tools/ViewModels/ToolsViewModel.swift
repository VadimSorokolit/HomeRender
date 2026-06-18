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
    
    // MARK: - Methods. Public
    
    func loadCards() {
        self.cards = JSONLoader.load("Interiors")
    }
}

