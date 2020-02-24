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
    print("Количество строк в файле \(stringsFromText.count)")
    if (stringsFromText.count-1) % 4 != 0 {
        throw FileError.troublesWithContentOfFile
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
            Ed.register(NewObserver: User)
    case "2":
        do {
            try Ed.delete(SomeObserver: User)
        }
        catch JournalError.noSubscribers {
            print("Список подписчиков пуст!")
        }
        catch {
            print("Возникла непредвиденная ошибка")
        }
    case "0":
        print("Возникла ошибка при вводе команды с клавиатуры")
    default:
        print("Возникла непредвиденная ошибка")
    }
}
