//
//  TagColourModel.swift
//  hyacinth
//
//  Created by Victor Esther Qiu on 6/01/24.
//

import SwiftUI

internal enum TagColourModel {
    case crimson
    case forest
    case honey
    case lavendar
    case perwinkle
    case custom(Color)
    
    internal var colorValue: Color {
        switch self {
        case .crimson:
            return Color.crimson
        case .forest:
            return Color.forest
        case .honey:
            return Color.honey
        case .lavendar:
            return Color.lavendar
        case .perwinkle:
            return Color.perwinkle
        case .custom(let customColour):
            return customColour
        }
    }
}
