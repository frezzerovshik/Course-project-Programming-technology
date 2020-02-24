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

func subUnsubToJournal (Ed : Journal , User : Observer) {
    print("Вветие команду:\n1 - Подписаться на издание\n2 - Отписаться от уведомлений о новых выпусках\n")
    let command = readLine()
    let unwrappedCommand = (command ?? "0")
    switch unwrappedCommand {
    case "1":
        do {
            try Ed.register(NewObserver: User)
        }
        catch let error as NSError {
            print("Что-то пошло не так при подписке на издание! \(error)")
        }
    case "2":
        do {
            try Ed.delete(SomeObserver: User)
        }
        catch let error as NSError {
            print("Что-то пошло не так при отписке от издания! \(error)")
        }
    case "0":
        print("Возникла ошибка при вводе команды с клавиатуры")
    default:
        print("Возникла непредвиденная ошибка")
    }
}
