//
//  Employees.swift
//  FeatureSet
//
//  Created by Luis Enrique Diaz Ramirez on 25/04/23.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let employees = try? JSONDecoder().decode(Employees.self, from: jsonData)

import Foundation

// MARK: - Employees
struct Employees: Codable {
    let status: String
    let data: [Datum]
    let message: String
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int
    let employeeName: String
    let employeeSalary, employeeAge: Int
    let profileImage: String

    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}
