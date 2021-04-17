//
//  Chapter4Spec.swift
//  RefactoringTests
//
//  Created by seongho.hong on 2021/04/17.
//

import Quick
import Nimble
import Foundation
@testable import Refactoring

final class Chapter4Spec: QuickSpec {
    
    private func sampleProvinceData() -> Data {
        let json: [String : Any] = [
            "name": "Asia",
            "producers": [
                ["name": "Byzantium", "cost": 10, "production": 9],
                ["name": "Attalia", "cost": 12, "production": 10],
                ["name": "Byzantium", "cost": 10, "production": 6]
            ],
            "demand": 30,
            "price": 20
        ]
        
        return try! JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
    }
    
    override func spec() {
        describe("province") {
            var asia: Province!
            beforeEach {
                asia = try! JSONDecoder().decode(Province.self, from: self.sampleProvinceData())
            }
            it("shortfall") {
                expect(asia.shortfall).to(equal(5))
            }
            it("profit") {
                expect(asia.profit).to(equal(230))
            }
            it("change production") {
                asia.producers[0].production(amountStr: "20")
                expect(asia.shortfall).to(equal(-6))
                expect(asia.profit).to(equal(292))
            }
        }
    }

}
