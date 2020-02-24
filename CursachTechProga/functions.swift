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
    var counter : Int = 1
    let arrayOfLines = content.components(separatedBy: "\n")
    var bubbleIssue : Issue = Issue()
    for line in arrayOfLines {
        switch counter {
            case 1:
                bubbleIssue.nameOfJournal = line
                counter += 1
            case 2:
                bubbleIssue.releaseDate = line
                counter += 1
            case 3:
                bubbleIssue.number = line
                counter += 1
            case 4:
                bubbleIssue.issueTopic = line
                counter = 1
                returnedList.append(bubbleIssue)
            default:
                print("Возникла ошибка при структурировании данных")
        }
    }
    return returnedList
}

func subUnsubToJournal (type : NameOfJournal){
    print("Введите команду:\n1 - Добавить\n2 - удалить")
    let command = (readLine() ?? "0")
    let register = {(Ed : Journal) -> Void in
        Ed.register(NewObserver: User)
        listOfSubscribedJournals.append(type)
    }
    let remove = {(Ed : Journal) -> Void in
        do {
            try Ed.delete(SomeObserver: User)
            for i in 0 ..< listOfSubscribedJournals.count {
                if listOfSubscribedJournals[i] == type {
                    listOfSubscribedJournals.remove(at: i)
                    break
                }
            }
        }
        catch JournalError.noSubscribers {
            print("Подписчики отсутствуют!")
        }
        catch {}
    }
    var action = {(Ed : Journal)->Void in }
    switch command {
    case "1":
        action = register
    case "2":
        action = remove
    case "0":
        print("Ошибка при считывании команды с клавиатуры")
    default:
        print("Непредвиденная ошибка!")
    }
    switch type {
    case .TopGear:
        action(TopGearEd)
    case .BusinessWeek:
        action(BWEd)
    case .Forbes:
        action(ForbesEd)
    case .NationalGeographic:
        action(NatGeoEd)
    case .People:
        action(PeopleEd)
    case .PROSport:
        action(PROSportEd)
    }
}

