//
//  main.swift
//  cursovayaTechProg
//
//  Created by Артем Шарапов on 10.02.2020.
//  Copyright © 2020 Артем Шарапов. All rights reserved.
//

/*
 Создать подписку на журналы. Журналы доступные для подписки: TopGear, NationalGeographic, People, BusinessWeek, PROСпорт, Forbes. Каждый журнал имеет одновременно несколько выпусков, каждый из которых характеризуется: наименование, тема выпуска, дата выпуска, номер журнала, краткое содержание (текст). Для каждого вида журнала создается входной файл, который содержит в себе всю информацию по всем выпускам. Файлы во врмя работы программы обновляются пользователем. Данные из файлов обновляются в программе каждые 30 секунд. Пользователь выбирает, на какие журналы желает подписаться. Как только появляется свежий выпуск – пользователь получает данные. Использовать паттерн «Наблюдатель» для реализации клиента. У пользователя формируется выходной файл, в котором хранятся все данные обо всех журналах, которые он получил.
 */


/*import Foundation
let pause : UInt32 = 30
var TopGearObject = TopGear(path: "/Users/frez2zerovshik/Documents/Универ/Третий курс/6 семестр/CursachTechProga/CursachTechProga/tgdata.txt")
print("Объект издания TopGear успешно создан")
var User : Controller = Controller()

try TopGearObject.register(NewObserver: User)
var Exit : Bool = true

while Exit {
    TopGearObject.checkFile()
    sleep(pause)
    print("Пауза кончиналсь ебать")
}
*/
let testText = """
first
first
first
first
second
second
second
second
"""
let strings = testText.components(separatedBy: "\n")
for string in strings {
    print ("Element of strings array: \(string)")
}


