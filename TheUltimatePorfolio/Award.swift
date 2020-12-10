//
//  Award.swift
//  TheUltimatePortfolio
//
//  Created by Huy Ong on 11/25/20.
//

import Foundation

struct Award: Decodable, Identifiable {
    var id: String { name }
    let name: String
    let description: String
    let color: String
    let criterion: String
    let value: Int
    let image: String
    
    static let allWards = Bundle.main.decode([Award].self, from: "Awards.json")
    static let example = allWards[0]
}



