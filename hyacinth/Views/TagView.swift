//
//  TagView.swift
//  hyacinth
//
//  Created by Victor Esther Qiu on 6/01/24.
//

import SwiftUI

struct TagView: View {
    // Variables
    private var mode: TagViewModeModel
    @State private var newTag: TagModel
    @State private var selectedColor: Color
    @Binding private var tag: TagModel
    @Binding private var tags: [TagModel]
    @Environment(\.presentationMode) var presentationMode
    
    // Initialiser
    // Editing Tag
    internal init(mode: TagViewModeModel, tag: Binding<TagModel>, tags: Binding<[TagModel]>) {
        self.mode = mode
        self._tag = tag
        self._tags = tags
        self._selectedColor = State(initialValue: .lavendar)
        // Dummy Variable
        self._newTag = State(initialValue: TagModel(title: "", colour: .lavendar))
    }
    
    // Creating New Tag
    internal init(mode: TagViewModeModel, tags: Binding<[TagModel]>) {
        self.mode = mode
        self._newTag = State(initialValue: TagModel(title: "", colour: .lavendar))
        self._tags = tags
        self._selectedColor = State(initialValue: .lavendar)
        // Dummy Variable
        self._tag = Binding.constant(TagModel(title: "", colour: .lavendar))
    }
    
    // Body
    var body: some View {
        Form {
            // Show empty string when adding a tag, otherwise show name of tag that is being edited
            TextField("Title", text: mode == .add ? $newTag.tagTitle : $tag.tagTitle)
            
            Section {
                HStack {
                    colourButtonView(colour: .crimson, tagColour: .crimson)
                    Spacer()
                    colourButtonView(colour: .honey, tagColour: .honey)
                    Spacer()
                    colourButtonView(colour: .forest, tagColour: .forest)
                    Spacer()
                    colourButtonView(colour: .perwinkle, tagColour: .perwinkle)
                    Spacer()
                    
                    ColorPicker("", selection: $selectedColor)
                        .labelsHidden()
                        .scaleEffect(1.5)
                        .frame(width: 40, height: 40)
                        .onChange(of: selectedColor) { newColour, oldColour in
                            if (mode == .add) {
                                self.newTag.tagColour = mapColorToTagColourModel(colour: newColour)
                            } else {
                                self.tag.tagColour = mapColorToTagColourModel(colour: newColour)
                            }
                        }

                }
                .padding(.vertical, 5)
            }
            .listSectionSpacing(20.0)
        }
        .padding(.vertical, -15)
        // Update NavigationBarTitle depending on whether we are adding or editing a tag
        .navigationBarTitle(mode == .add ? "New Tag" : "Edit Tag", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(mode == .add ? "Add" : "Save") {
                    if mode == .add {
                        // Add tag to storage
                        self.tags.append(self.newTag)
                    } else {
                        // SwiftUI handles editing colour automatically
                    }
                    presentationMode.wrappedValue.dismiss()
                }
                .disabled(mode == .add ? newTag.tagTitle.isEmpty : tag.tagTitle.isEmpty)
            }
        }
    }
    
    private func colourButtonView(colour: Color, tagColour: TagColourModel) -> some View {
        Circle()
            .foregroundColor(colour)
            .frame(width: 40, height: 40)
            .onTapGesture {
                if(mode == .add) {
                    self.newTag.tagColour = tagColour
                } else {
                    self.tag.tagColour = tagColour
                }
                print("\(tagColour) selected")
            }
    }
    
    private func mapColorToTagColourModel(colour: Color) -> TagColourModel {
        return .custom(colour)
    }
}

// Preview
#Preview {
    //    TagView(mode: .edit, tag: .constant(TagModel.sampleTag))
    TagView(mode: .add, tags: .constant(TagModel.sampleTags))
}
