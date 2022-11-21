//
//  ActionView.swift
//  CostAccounting
//
//  Created by Абдулхаким Магомедов on 11/21/22.
//

import SwiftUI

struct ActionView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "Личное"
    @State private var amount = ""
    
    let types = ["По учёбе", "Личное", "По работе", "По дому"]
    
    var body: some View {
        
        NavigationView {
            Form {
                TextField("Название", text: $name)
                Picker("Тип", selection: $type) {
                    ForEach(self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Расходы", text: $amount).keyboardType(.numberPad)
            }
            .navigationBarTitle("Создать новый элемент", displayMode: .inline)
            .navigationBarItems(trailing: Button("Сохранить"){
                if let actualAmount = Double(self.amount){
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}
