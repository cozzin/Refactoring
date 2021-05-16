//
//  Chapter8Spec.swift
//  RefactoringTests
//
//  Created by seongho.hong on 2021/05/16.
//

import Quick
import Nimble
import Foundation
@testable import Refactoring

final class Chapter8Spec: QuickSpec {
    
    override func spec() {
        describe("Company") {
            it("empty") {
                let people: [Person] = []
                let company = Company(people: people)
                
                expect(company.averageAge).to(equal(0))
                expect(company.totalSalary).to(equal(0))
            }
            it("normal") {
                let people: [Person] = [
                    Person(age: 30, salary: 300),
                    Person(age: 40, salary: 400),
                    Person(age: 50, salary: 500)
                ]
                let company = Company(people: people)
                
                expect(company.averageAge).to(equal(40))
                expect(company.totalSalary).to(equal(1200))
            }
        }
    }

}
