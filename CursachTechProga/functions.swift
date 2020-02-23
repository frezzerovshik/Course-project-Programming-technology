//
//  functions.swift
//  CursachTechProga
//
//  Created by Артем Шарапов on 23.02.2020.
//  Copyright © 2020 Artem Feklistov. All rights reserved.
//

import Foundation
func makeIssues(content : String) throws -> [Issue]{
    var returnedList : [Issue] = []
    var stringsFromText = content.components(separatedBy: "\n")
    if stringsFromText.count % 4 != 0 {
        //определить исключение - некорректно заполнен файл
    }
    let numberOfIterations = stringsFromText.count / 4
    for _ in 0 ..< numberOfIterations {
        let newIssue : Issue = Issue(nameOfJournalInit: stringsFromText[0], releaseDateInit: stringsFromText[1], numberInit: stringsFromText[2], issueTopicInit: stringsFromText[3])
        returnedList.append(newIssue)
        for i in 0 ..< 3 {
            stringsFromText.remove(at: i)
        }
    }
    return returnedList
}
