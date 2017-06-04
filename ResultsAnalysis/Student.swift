//
//  Student.swift
//  ResultsAnalysis
//
//  Created by JU HO YOON on 2017. 6. 3..
//  Copyright © 2017년 YJH Studio. All rights reserved.
//

import Foundation

struct Grade {
    var data_structure: Int
    var algorithm: Int
    var networking: Int
    var database: Int
    var operating_system: Int
}

class Student: NSObject {
    var name: String!
    var grade: Grade!
    var average: Double {
        get {
            var sum = 0
            var count = 0
            if self.grade.data_structure > 0 {
                sum += self.grade.data_structure
                count += 1
            }
            if self.grade.algorithm > 0 {
                sum += self.grade.algorithm
                count += 1
            }
            if self.grade.networking > 0 {
                sum += self.grade.networking
                count += 1
            }
            if self.grade.database > 0 {
                sum += self.grade.database
                count += 1
            }
            if self.grade.operating_system > 0 {
                sum += self.grade.operating_system
                count += 1
            }
            return (Double(sum) / Double(count))
        }
    }
    var GPA: String {
        if self.average >= 90 {
            return "A"
        } else if self.average >= 80 {
            return "B"
        } else if self.average >= 70 {
            return "C"
        } else if self.average >= 60 {
            return "D"
        } else {
            return "F"
        }
    }
    
    init(name: String, grade: Grade) {
        super.init()
        
        self.name = name
        self.grade = grade
    }
}
