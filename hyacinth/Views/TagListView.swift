//
//  TagListView.swift
//  hyacinth
//
//  Created by Victor Esther Qiu on 24/01/24.
//

import SwiftUI

struct TagListView: View {
    // Variables
    @State private var isEditNavigation: Bool = false
    @State private var isAddNavigation: Bool = false
    @State private var selectedIndex: Int = 0
    @State private var editMode: EditMode = .inactive
    @Binding private var task: TaskModel
    @Binding private var tags: [TagModel]
    @Environment(\.presentationMode) var presentationMode
    
    // Initialiser
    internal init(task: Binding<TaskModel>, tags: Binding<[TagModel]>) {
        self._task = task
        self._tags = tags
    }
    
    // Body
    var body: some View {
        List {
            // Default Tag
            DefaultTagView(task: self.$task, tags: self.$tags)
            
            // Custom Tags
            CustomTagsView(isEditNavigation: self.$isEditNavigation, selectedIndex: self.$selectedIndex, task: self.$task, tags: self.$tags)
            
            // Add Tag Button
            Section {
                HStack {
                    Spacer()
                    Text("Add Tag")
                    Spacer()
                }
                .contentShape(Rectangle())
                .foregroundColor(.lavendar)
                .listRowBackground(Color.button)
                .onTapGesture {
                    print("Add Tag")
                    isAddNavigation = true
                }
            }
            // Navigation to Custom Tag
            NavigationLink(destination: TagView(mode: .edit, tag: tags[selectedIndex], tags: self.$tags), isActive: $isEditNavigation){}
                .hidden()
                .listRowBackground(Color(uiColor: .systemGray6))
            
            // Navigation to Add Tag
            NavigationLink(destination: TagView(mode: .add, tags: self.$tags), isActive: $isAddNavigation){}
                .hidden()
                .listRowBackground(Color(uiColor: .systemGray6))
                .listRowSeparator(.hidden)
        }
        .padding(.vertical, -15)
        .navigationBarTitle("Tags", displayMode: .inline)
        
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
        }
    }
    
}

// Default Tag Section
struct DefaultTagView: View {
    @Binding private var task: TaskModel
    @Binding private var tags: [TagModel]
    @Environment(\.presentationMode) var presentationMode
    
    internal init(task: Binding<TaskModel>, tags: Binding<[TagModel]>) {
        self._task = task
        self._tags = tags
    }
    
    var body: some View {
        Section {
            if let firstTag = tags.first {
                HStack {
                    Spacer()
                    Text(firstTag.tagTitle)
                    // Bold the selected tag for the currently selected task
                        .fontWeight(task.taskTag.tagId == firstTag.id ? .bold : .regular)
                    Spacer()
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    task.taskTag = firstTag
                    presentationMode.wrappedValue.dismiss()
                }
                .listRowBackground(firstTag.tagColour.colorValue)
            }
        } header: {
            Text("Default")
        }
    }
}

// Custom Tag Section
struct CustomTagsView: View {
    @Binding private var isEditNavigation: Bool
    @Binding private var selectedIndex: Int
    @Binding private var task: TaskModel
    @Binding private var tags: [TagModel]
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.editMode) var editMode
    
    internal init(isEditNavigation: Binding<Bool>, selectedIndex: Binding<Int>, task: Binding<TaskModel>, tags: Binding<[TagModel]>) {
        self._isEditNavigation = isEditNavigation
        self._selectedIndex = selectedIndex
        self._task = task
        self._tags = tags
    }
    
    var body: some View {
        // Check if there are more tags beyond the first one
        if tags.count > 1 {
            Section {
                ForEach(tags.indices.dropFirst(), id: \.self) { index in
                    let tag = tags[index]
                    HStack {
                        Spacer()
                        Text(tag.tagTitle)
                            .fontWeight(task.taskTag.tagId == tag.id ? .bold : .regular)
                        Spacer()
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        task.taskTag = tag
                        presentationMode.wrappedValue.dismiss()
                    }
                    // Leading Swipe Action (Delete)
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button {
                            deleteTag(tag.id)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                        .tint(.red)
                    }
                    // Trailing Swipe Action (Delete)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button {
                            selectedIndex = index
                            isEditNavigation = true
                            
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                        .tint(.blue)
                    }
                    .listRowBackground(tag.tagColour.colorValue)
                }
                .onMove(perform: moveCustomTags)
            } header: {
                Text("Custom")
            }
        }
    }
    
    // Helper function to reorder tags
    private func moveCustomTags(from source: IndexSet, to destination: Int) {
        // Adjust source indices to account for the dropped first element
        let adjustedSource = source.map { index in
            return index + 1
        }
        
        // Adjust the destination index to account for the dropped first element
        let adjustedDestination = destination + 1

        // Use the adjusted indices to move items in the original tags array
        tags.move(fromOffsets: IndexSet(adjustedSource), toOffset: adjustedDestination)
    }
    
    // Helper function to delete a tag
    private func deleteTag(_ tagId: UUID) {
        tags.removeAll { $0.id == tagId }
    }
}

// Preview
#Preview {
    TagListView(task: .constant(TaskModel.sampleTask), tags: .constant(TagModel.sampleTags))
}
