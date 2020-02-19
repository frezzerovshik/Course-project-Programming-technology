//
//  TopGear.swift
//  cursovayaTechProg
//
//  Created by Артем Шарапов on 17.02.2020.
//  Copyright © 2020 Артем Шарапов. All rights reserved.
//

import Foundation
class TopGear : Journal{
    
    var contentOfFile = String()
    
    var issuesList: [Issue] = []// Список выпусков
    
    static var Observers: [Observer] = [] // Список наблюдателей
    
    init(path: String) {
        // Блок чтения файла - содержимое храним для дальнейшей сверки (проверка на изменения)
        do{
            contentOfFile = try String(contentsOfFile: path, encoding: .utf8)
        }
        catch let error as NSError{
            print("Some trouble: class TopGear , method init : \(error)")
        }
        //Создание выпусков и добавление в массив
        let separatedContent = contentOfFile.components(separatedBy: "\\")
        for everyIssue in separatedContent{
            let dataPackageForIssue = everyIssue.components(separatedBy: "\n")
            let issueToAdd = Issue(releaseDateInit: dataPackageForIssue[0] , numberInit: dataPackageForIssue[1] , issueTopicInit: dataPackageForIssue[2])
            issuesList.append(issueToAdd)
        }
    }
    
    static func register(NewObserver: Observer) throws {  // Добавление наблюдателя
        Observers.append(NewObserver)
    }
    
    static func delete(SomeObserverWithId : Int) throws {  // Удаление наблюдателя
        var wasFound : Bool = false
        if Observers.isEmpty == false {
            for num in 0..<Observers.count{
                if num == SomeObserverWithId {
                    Observers.remove(at: num)
                    wasFound = true
                }
            }
            if wasFound == false{
                print("Подписчик с указанным ID отсутствует")
            }
        }
        else {
            // Выкинуть исключение - нет подписчиков
        }
    }
    
    static func notifyObservers(WithNewIssue :Issue) throws {
        if Observers.isEmpty == false {
            for everyone in Observers {
                if everyone.update(State : WithNewIssue) == false {
                    //Выкинуть исключение - возникла ошибка при обновлении данных у подписчиков
                }
            }
        }
        else {
         //Выкинуть исключение - нет подписчиков
        }
    }
    
    func checkFile() {
        
    }
    
    static func getLastObserverNum() -> Int {
        return Observers.count-1
    }
}
