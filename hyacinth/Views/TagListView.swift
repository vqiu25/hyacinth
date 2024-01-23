//
//  TagListView.swift
//  hyacinth
//
//  Created by Victor Esther Qiu on 24/01/24.
//

import SwiftUI

struct TagListView: View {
    @Binding var tags: [TagModel]
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(tags) { tag in
                        // Create a view for each tag
                        HStack {
                            Spacer()
                            Text(tag.tagTitle)
                            Spacer()
                        }
                        .listRowBackground(tag.tagColour.colorValue)
                    }
                }
                Section(footer:
                            HStack(alignment: .center) {
                    Spacer()
                    
                    Button("Add Tag") {
                        print("tapped button")
                    }
                    .buttonStyle(.bordered)
                    .tint(.lavendar)
                    
                    
                    Spacer()
                }){}
            }
            .listSectionSpacing(20.0)
            .padding(.vertical, -20)
            .navigationBarTitle("Tags", displayMode: .inline)
            
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Dismiss") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .tint(.lavendar)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Edit") {
                        // Add your edit action here
                    }
                    .tint(.lavendar)
                }
            }
        }
    }
}

#Preview {
    TagListView(tags: .constant(TagModel.sampleTags))
}
