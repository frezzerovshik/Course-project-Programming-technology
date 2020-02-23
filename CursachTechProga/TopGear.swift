//
//  TopGear.swift
//  cursovayaTechProg
//
//  Created by Артем Шарапов on 17.02.2020.
//  Copyright © 2020 Артем Шурупiв. All rights reserved.
//

import Foundation

class TopGear : Journal{
    init(path: String) {
        super.init()
        // Блок чтения файла - содержимое храним для дальнейшей сверки (проверка на изменения)
        do{
            contentOfFile = try String(contentsOfFile: path, encoding: .utf8)
        }
        catch let error as NSError{
            print("Some trouble: class TopGear, method init : \(error)")
        }
        //Создание выпусков и добавление в массив
        do{
            issuesList = try makeIssues(content: contentOfFile)
        }
        catch let error as NSError {
            print("Ошибка с заполнением файла! \(error)")
        }
        self.path = path
    }
}

