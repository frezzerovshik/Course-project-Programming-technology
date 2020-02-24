//
//  Controller.swift
//  CursachTechProga
//
//  Created by Артем Шарапов on 19.02.2020.
//  Copyright © 2020 Artem Feklistov. All rights reserved.
//

import Foundation

class Controller : Observer{
    var Id: Int = 0
    
    init() {
        // empty
    }
    func update(State : Issue) -> Bool {
        let path = "/Users/frez2zerovshik/Documents/Универ/Третий курс/6 семестр/CursachTechProga/CursachTechProga/ControllerOutputFile.txt"
        do{
            print("Новый выпуск журнала \(State.nameOfJournal)!\nДата выпуска: \(State.releaseDate) \nНомер: \(State.number) \nТема выпуска: \(State.issueTopic)\n")
            let url = URL(fileURLWithPath: path)
            try State.nameOfJournal.write(to: url, atomically: true, encoding: .utf8)
            try State.number.write(to: url, atomically: true, encoding: .utf8)
            try State.releaseDate.write(to: url, atomically: true, encoding: .utf8)
            try State.issueTopic.write(to: url, atomically: true, encoding: .utf8)
           return true
        }
        catch let error as NSError{
            print("Что-то пошло не так при записи в выходной файл! Ошибка: \(error)")
            return false
        }
    }
}
