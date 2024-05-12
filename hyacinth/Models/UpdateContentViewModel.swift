//
//  UpdateContentViewModel.swift
//  hyacinth
//
//  Created by Victor Esther Qiu on 26/01/24.
//

import SwiftUI

struct TagsUpdatedKey: EnvironmentKey {
    static let defaultValue: () -> Void = {}
}

extension EnvironmentValues {
    var tagsUpdated: () -> Void {
        get { self[TagsUpdatedKey.self] }
        set { self[TagsUpdatedKey.self] = newValue }
    }
}

