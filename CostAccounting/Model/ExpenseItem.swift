//
//  ExpenseItem.swift
//  CostAccounting
//
//  Created by Абдулхаким Магомедов on 11/21/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    var name: String
    var type: String
    var amount: Double
}
