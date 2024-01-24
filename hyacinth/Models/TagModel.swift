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
    private var colour: TagColourModel
    
    internal init(id: UUID = UUID(), title: String, colour: TagColourModel) {
        self.id = id
        self.title = title
        self.colour = colour
    }
    
    // Getters and Setters
    internal var tagTitle: String {
        get { self.title }
        set { self.title = newValue }
    }
    
    internal var tagColour: TagColourModel {
        get { self.colour }
        set { self.colour = newValue }
    }
}

// Mock Data
extension TagModel {
    
    static let sampleTags: [TagModel] = [
        TagModel(title: "Work", colour: TagColourModel.crimson),
        TagModel(title: "Personal", colour: TagColourModel.perwinkle),
        TagModel(title: "Work", colour: TagColourModel.forest)
    ]
}
