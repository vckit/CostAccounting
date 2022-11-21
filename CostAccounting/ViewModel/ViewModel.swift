//
//  ViewModel.swift
//  CostAccounting
//
//  Created by Абдулхаким Магомедов on 11/21/22.
//

import Foundation

class Expenses: ObservableObject {
    
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try?encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init(){
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }
    }
    
    func onDeleteItem(as offSets: IndexSet) {
        items.remove(atOffsets: offSets)
    }
    
    func onMoveItem(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }
    
    func roundToPleaces(places: Double) -> String {
        let numberString = String(format: "%05.2f", places)
        return numberString
    }
}
