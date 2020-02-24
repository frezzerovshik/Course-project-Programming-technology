//
//  main.swift
//  cursovayaTechProg
//
//  Created by Артем Шарапов on 10.02.2020.
//  Copyright © 2020 Артем Шарапов. All rights reserved.
//

import Foundation

var flagNeedToExit : Bool = true;

var TopGearEd : TopGear = TopGear(path: "/Users/frez2zerovshik/Documents/Универ/Третий курс/6 семестр/CursachTechProga/CursachTechProga/tgdata.txt")
var NatGeoEd : NationalGeopraphic = NationalGeopraphic(path: "/Users/frez2zerovshik/Documents/Универ/Третий курс/6 семестр/CursachTechProga/CursachTechProga/ngdata.txt")
var PROSportEd : PROSport = PROSport(path: "/Users/frez2zerovshik/Documents/Универ/Третий курс/6 семестр/CursachTechProga/CursachTechProga/psdata.txt")
var ForbesEd : Forbes = Forbes(path: "/Users/frez2zerovshik/Documents/Универ/Третий курс/6 семестр/CursachTechProga/CursachTechProga/fbdata.txt")
var BWEd : BusinessWeek = BusinessWeek(path: "/Users/frez2zerovshik/Documents/Универ/Третий курс/6 семестр/CursachTechProga/CursachTechProga/bwdata.txt")
var PeopleEd : People = People(path: "/Users/frez2zerovshik/Documents/Универ/Третий курс/6 семестр/CursachTechProga/CursachTechProga/pdata.txt")

var User : Controller = Controller()

while flagNeedToExit {
    print("1 - Меню издания TopGear\n2 - Меню издания NationalGeographic\n3 - Меню издания PROСпорт\n4 - Меню издания Forbes\n5 - Меню издания BusinessWeek\n6 - Меню издания People\n7 - Перейти в режим наблюдения\n8 - Прекратить работу программы")
    let unwrappedUserChoice = (readLine() ?? "0")
    switch unwrappedUserChoice {
    case "1":
        subUnsubToJournal(Ed: TopGearEd, User: User)
    case "2":
        subUnsubToJournal(Ed: NatGeoEd, User: User)
    case "3":
        subUnsubToJournal(Ed: PROSportEd, User: User)
    case "4":
        subUnsubToJournal(Ed: ForbesEd, User: User)
    case "5":
        subUnsubToJournal(Ed: BWEd, User: User)
    case "6":
        subUnsubToJournal(Ed: PeopleEd, User: User)
    case "7":
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
    case "0":
        print("Возникла ошибка при считывании команды с клавиатуры, попробуйте еще раз")
    default:
        print("Возникла непредвиденная ошибка, попробуйте еще раз")
    }
}
