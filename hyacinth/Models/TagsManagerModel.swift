//
//  TagsManagerModel.swift
//  hyacinth
//
//  Created by Victor Esther Qiu on 26/01/24.
//

import Foundation

class TagsManagerModel: ObservableObject {
    // Variable
    @Published private var tags: [TagModel]

    internal init(tags: [TagModel]) {
        self.tags = tags
    }
}
