//
//  Company.swift
//  Refactoring
//
//  Created by seongho.hong on 2021/05/16.
//

import Foundation

final class Company {
    
    private let people: [Person]
    
    init(people: [Person]) {
        self.people = people
    }
    
    func totalSalary() -> Int {
        return people.map { $0.salary }.reduce(0, +)
    }

    func averageAge() -> Int {
        let totalAge = people.map { $0.age }.reduce(0, +)
        return people.count > 0 ? totalAge / people.count : 0
    }
}
