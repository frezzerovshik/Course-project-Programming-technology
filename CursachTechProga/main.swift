//
//  main.swift
//  cursovayaTechProg
//
//  Created by Артем Шарапов on 10.02.2020.
//  Copyright © 2020 Артем Шарапов. All rights reserved.
//

import Foundation

enum NameOfJournal {
    case TopGear
    case NationalGeographic
    case PROSport
    case Forbes
    case BusinessWeek
    case People
}

var listOfSubscribedJournals = [NameOfJournal]()

var flagNeedToExit : Bool = true;

var TopGearEd : TopGear = TopGear(path: "/Users/frez2zerovshik/Documents/Универ/Третий курс/6 семестр/CursachTechProga/CursachTechProga/tgdata.txt")
var NatGeoEd : NationalGeopraphic = NationalGeopraphic(path: "/Users/frez2zerovshik/Documents/Универ/Третий курс/6 семестр/CursachTechProga/CursachTechProga/ngdata.txt")
var PROSportEd : PROSport = PROSport(path: "/Users/frez2zerovshik/Documents/Универ/Третий курс/6 семестр/CursachTechProga/CursachTechProga/psdata.txt")
var ForbesEd : Forbes = Forbes(path: "/Users/frez2zerovshik/Documents/Универ/Третий курс/6 семестр/CursachTechProga/CursachTechProga/fbdata.txt")
var BWEd : BusinessWeek = BusinessWeek(path: "/Users/frez2zerovshik/Documents/Универ/Третий курс/6 семестр/CursachTechProga/CursachTechProga/bwdata.txt")
var PeopleEd : People = People(path: "/Users/frez2zerovshik/Documents/Универ/Третий курс/6 семестр/CursachTechProga/CursachTechProga/pdata.txt")

var User : Controller = Controller()

while flagNeedToExit {
    print("1 - Меню издания TopGear\n2 - Меню издания NationalGeographic\n3 - Меню издания PROСпорт\n4 - Меню издания Forbes\n5 - Меню издания BusinessWeek\n6 - Меню издания People\n7 - Перейти в режим наблюдения\n8 - Прекратить работу программы\n9 - Просмотреть список изданий, на которые Вы подписаны")
    let unwrappedUserChoice = (readLine() ?? "0")
    switch unwrappedUserChoice {
    case "1":
        subUnsubToJournal(type : .TopGear )
    case "2":
        subUnsubToJournal(type : .NationalGeographic)
    case "3":
        subUnsubToJournal(type : .PROSport)
    case "4":
        subUnsubToJournal(type : .Forbes)
    case "5":
        subUnsubToJournal(type : .BusinessWeek)
    case "6":
        subUnsubToJournal(type : .People)
    case "7":
        //Осталось как-то абстрагировать вот это вот говно
        var flagStopToObserve : Bool = true
        let timeToSleep : UInt32 = 30
        while flagStopToObserve {
            print("Добро пожаловать в режим наблюдения!\n")
            sleep(timeToSleep)
            TopGearEd.checkFile()
            NatGeoEd.checkFile()
            PROSportEd.checkFile()
            ForbesEd.checkFile()
            BWEd.checkFile()
            PeopleEd.checkFile()
            print("Пауза длиной \(timeToSleep) секунд завершена!")
            print("Хотите прекратить ожидание новых выпусках? 1 - Да, выйти 2 - Нет, продолжить наблюдать\n")
            let command = (readLine() ?? "0")
            switch command {
            case "1":
                flagStopToObserve = false
            case "2":
                flagStopToObserve = true
            case "0":
                print("Ошибка при чтении команды с клавиатуры")
            default:
                print("Непредвиденная ошибка!")
            }
        }
    case "8":
        flagNeedToExit = false
    case "9":
        print(listOfSubscribedJournals)
    case "0":
        print("Возникла ошибка при считывании команды с клавиатуры, попробуйте еще раз")
    default:
        print("Возникла непредвиденная ошибка, попробуйте еще раз")
    }
}
