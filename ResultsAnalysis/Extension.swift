//
//  Extension.swift
//  ResultsAnalysis
//
//  Created by JU HO YOON on 2017. 6. 3..
//  Copyright © 2017년 YJH Studio. All rights reserved.
//

import Foundation

enum Subject: String {
    case data_structure = "data_structure"
    case algorithm = "algorithm"
    case networking = "networking"
    case database = "database"
    case operating_system = "operating_system"
}

extension JSONSerialization {
    class func studentObjects(with data: Data, options: JSONSerialization.ReadingOptions) -> [Student]? {
        
        var students = [Student]()
        
        let json = try! jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String: Any]]
        for student in json! {
            
            guard let _name = student["name"] as? String else { return nil }
            guard let grade = student["grade"] as? [String: Int] else { return nil }
            
            var (data_strcutre, algorithm, networking, database, operating_system) = (-1, -1, -1, -1, -1)
            
            if let temp = grade[Subject.data_structure.rawValue] {
                data_strcutre = temp
            }
            if let temp = grade[Subject.algorithm.rawValue] {
                algorithm = temp
            }
            if let temp = grade[Subject.networking.rawValue] {
                networking = temp
            }
            if let temp = grade[Subject.database.rawValue] {
                database = temp
            }
            if let temp = grade[Subject.operating_system.rawValue] {
                operating_system = temp
            }

            let _grade = Grade(data_structure: data_strcutre, algorithm: algorithm, networking: networking, database: database, operating_system: operating_system)
            
            let newStudent = Student(name: _name, grade: _grade)
            students.append(newStudent)
        }
        return students
    }
}

extension Double {
    func roundToPlaces(places: Int) -> Double {
        let temp = pow(10.0, Double(places))
        return (self * temp).rounded() / temp
    }
}
