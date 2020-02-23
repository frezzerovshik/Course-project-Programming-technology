//
//  BusinessWeek.swift
//  CursachTechProga
//
//  Created by Артем Шарапов on 23.02.2020.
//  Copyright © 2020 Artem Feklistov. All rights reserved.
//

import Foundation
class BusinessWeek : Journal {
    init(path: String) {
        super.init()
        // Блок чтения файла - содержимое храним для дальнейшей сверки (проверка на изменения)
        do{
            contentOfFile = try String(contentsOfFile: path, encoding: .utf8)
        }
        catch let error as NSError{
            print("Some trouble: class BusinessWeek, method init : \(error)")
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
