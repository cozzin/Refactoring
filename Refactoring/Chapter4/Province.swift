//
//  Province.swift
//  Refactoring
//
//  Created by seongho.hong on 2021/04/17.
//

import Foundation

final class Province: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case name
        case producers
        case demand
        case price
    }
    
    let name: String
    let demand: Int
    let price: Int
    
    var totalProduction: Int
    private(set) var producers: [Producer] = []
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        demand = try values.decode(Int.self, forKey: .demand)
        price = try values.decode(Int.self, forKey: .price)
        producers = try values.decode([Producer].self, forKey: .producers)
        totalProduction = producers.reduce(into: 0) { $0 += $1.production }
        
        producers.forEach {
            $0.province = self
        }
    }
    
    var shortfall: Int {
        return demand - totalProduction
    }
    
    var profit: Int {
        return demandValue - demandCost
    }
    
    var demandValue: Int {
        return satisfiedDemand * price
    }
    
    var satisfiedDemand: Int {
        return min(demand, totalProduction)
    }
    
    var demandCost: Int {
        var remainingDemand = demand
        var result = 0
        producers
            .sorted(by: { $0.cost < $1.cost })
            .forEach {
                let contribution = min(remainingDemand, $0.production)
                remainingDemand -= contribution
                result += contribution * $0.cost
            }
        return result
    }
}
