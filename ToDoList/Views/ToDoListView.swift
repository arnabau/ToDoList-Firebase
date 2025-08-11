//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Arnaldo Baumanis on 7/16/25.
//

import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
    //@StateObject private var viewModel = ToDoListViewViewModel()
    @StateObject private var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    //private var userId: String = ""
    
    init(userId: String) {
        //self.userId = userId
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationBarTitle("To-Do List")
            .toolbar {
                Button(action: {
                    viewModel.showAddItemView = true
                }) {
                    Image(systemName: "plus.circle.fill")
                }
            }
            .sheet(isPresented: $viewModel.showAddItemView) {
                NewItemView(newItemPresented: $viewModel.showAddItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "eDPp3IvYymRNcwxBcrpPIL72aie2")
}
