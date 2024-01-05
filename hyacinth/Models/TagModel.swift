//
//  TagModel.swift
//  hyacinth
//
//  Created by Victor Esther Qiu on 5/01/24.
//

import SwiftUI

internal struct TagModel: Identifiable {
    let id: UUID
    private var title: String
    private var colour: TagColour
    
    internal init(id: UUID = UUID(), title: String, colour: TagColour) {
        self.id = id
        self.title = title
        self.colour = colour
    }
    
    // Getters and Setters
    internal var tagTitle: String {
        get { self.title }
        set { self.title = newValue }
    }
    
    internal var tagColour: TagColour {
        get { self.colour }
        set { self.colour = newValue }
    }
}

internal enum TagColour {
    case crimson
    case forest
    case lavendar
    case perwinkle
    case custom(Color)
    
    internal var colorValue: Color {
        switch self {
        case .crimson:
            return Color.crimson
        case .forest:
            return Color.forest
        case .lavendar:
            return Color.lavendar
        case .perwinkle:
            return Color.perwinkle
        case .custom(let customColour):
            return customColour
        }
    }
}
