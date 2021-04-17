//
//  Producer.swift
//  Refactoring
//
//  Created by seongho.hong on 2021/04/17.
//

import Foundation

final class Producer: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case name
        case cost
        case production
    }
    
    weak var province: Province?
    
    let name: String
    private(set) var cost: Int
    private(set) var production: Int
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try values.decode(String.self, forKey: .name)
        cost = try values.decode(Int.self, forKey: .cost)
        production = try values.decodeIfPresent(Int.self, forKey: .production) ?? 0
    }
    
    func cost(_ newValue: String) {
        guard let cost = Int(newValue) else { return }
        self.cost = cost
    }
    
    func production(amountStr: String) {
        guard let amonut = Int(amountStr) else { return }
        province?.totalProduction += amonut - production
        production = amonut
    }
}
