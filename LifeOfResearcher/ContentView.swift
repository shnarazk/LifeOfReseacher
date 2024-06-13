//
//  ContentView.swift
//  LifeOfResearcher
//
//  Created by 楢崎修二 on 2024/06/13.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        NavigationSplitView {
            VStack {
                List {
                    ForEach(items) { item in
                        NavigationLink {
                            VStack {
                                Text("\(item.name) by \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                            }
                        } label: {
                            Text(item.name)
                            Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                .navigationSplitViewColumnWidth(min: 180, ideal: 200)
                .toolbar {
                    ToolbarItem {
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
//                Button (action: addItem) {
//                    Label("End of term1", systemImage: "forward")
//                }
//                Button (action: addItem) {
//                    Label("End of term2", systemImage: "forward")
//                }
            }
        } detail: {
            Text("Select an item")
        }

    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date(), name: "現在抱えている仕事")
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
