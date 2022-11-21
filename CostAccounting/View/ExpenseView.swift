//
//  ExpenseView.swift
//  CostAccounting
//
//  Created by Абдулхаким Магомедов on 11/21/22.
//

import SwiftUI

struct ExpenseView: View {
    
    @State private var showingAddExpense = false
    @ObservedObject var expenses = Expenses()
    
    var body: some View {
        NavigationView{
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text("\(expenses.roundToPleaces(places: item.amount)) рублей")
                    }
                }
                .onMove(perform: expenses.onMoveItem)
                .onDelete(perform: expenses.onDeleteItem)
            }
            .navigationBarTitle("Мои расходы", displayMode: .inline)
            .navigationBarItems(trailing: HStack {
                Button(action: {
                    self.showingAddExpense.toggle()
                }) {
                    Image(systemName: "plus")
                }
                EditButton()
            })
            .sheet(isPresented: $showingAddExpense) {
                ActionView(expenses: self.expenses)
            }
        }
    }
}
