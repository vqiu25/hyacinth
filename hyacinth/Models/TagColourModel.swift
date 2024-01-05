//
//  TagColourModel.swift
//  hyacinth
//
//  Created by Victor Esther Qiu on 6/01/24.
//

import SwiftUI

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
