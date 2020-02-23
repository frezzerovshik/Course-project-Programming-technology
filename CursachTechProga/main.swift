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
    print("1 - Меню издания TopGear\n2 - Меню издания NationalGeographic\n3 - Меню издания PROСпорт\n4 - Меню издания Forbes\n5 - Меню издания BusinessWeek\n6 - Меню издания People\n7 - Перейти в режим наблюдения")
    let userChoice = readLine(); let unwrappedUserChoice = (userChoice ?? "0")
    /*switch unwrappedUserChoice {
    case "1":
   
    case "2":
    case "3":
    case "4":
    case "5":
    case "6":
    case "7":
    case "0":
        print("Возникла ошибка при считывании команды с клавиатуры, попробуйте еще раз")
    default:
        print("Возникла непредвиденная ошибка, попробуйте еще раз")
    }*/
}
/*Последние мысли - написать функцию регистрации/удаления обсерверов, используя общий интерфейс, функция принимает объект с супертипом сабж*/
