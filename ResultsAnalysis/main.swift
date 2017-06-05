//
//  main.swift
//  ResultsAnalysis
//
//  Created by JU HO YOON on 2017. 6. 3..
//  Copyright © 2017년 YJH Studio. All rights reserved.
//

import Foundation

// Global Variable.
let fm = FileManager.default
var students: [Student]?
var resultString = ""

// Input - Read Student Data.
let dataFileName = "students.json"
let dataPath = fm.homeDirectoryForCurrentUser.appendingPathComponent(dataFileName)

if fm.isReadableFile(atPath: dataPath.path) {
    do {
        let file = try FileHandle(forReadingFrom: dataPath)
        let data = file.readDataToEndOfFile()
        students = JSONSerialization.studentObjects(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
    } catch {
        print("Fail to read student data file")
    }
} else {
    print("\(dataPath.path) not exist.")
}


// Make Result String.
resultString += "성적결과표\n\n"
students?.sort(by: { (s1, s2) -> Bool in
    return s1.name < s2.name
})

// Make Result String. - All Student Average.
var sum = 0.0
for stu in students! {
    sum += stu.average
}
let allAvg = sum/Double(students!.count)
resultString += "전체 평균 : \(allAvg.roundToPlaces(places: 2))\n\n"

// Make Result String. - Each Student GPA
resultString += "개인별 학점\n"
for stu in students! {
    resultString += "\(stu.name!)\t: \(stu.GPA)\n"
}

// Make Result String. - Pass Students
resultString += "\n수료생\n"
for stu in students! {
    if stu.average > 70 {
        resultString += "\(stu.name!), "
    }
}
resultString = resultString.substring(to: resultString.index(resultString.endIndex, offsetBy: -2))


// Output = Create Result File.
let resultName = "result.txt"
let resultPath = fm.homeDirectoryForCurrentUser.appendingPathComponent(resultName)

if fm.createFile(atPath: resultPath.path, contents: resultString.data(using: String.Encoding.utf8), attributes: nil) {
    print("Succeed")
} else {
    print("Fail")
}
