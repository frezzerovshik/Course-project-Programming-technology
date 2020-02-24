//
//  Journal.swift
//  cursovayaTechProg
//
//  Created by Артем Шарапов on 17.02.2020.
//  Copyright © 2020 Артем Шарапов. All rights reserved.
//

import Foundation
class Journal : Subject {
    
    var contentOfFile = String()
    
    var issuesList: [Issue] = [Issue()]// Список выпусков
    
    var Observers: [Observer] = [] // Список наблюдателей
    
    var path : String = String()
    
    func register(NewObserver: Observer) throws {  // Добавление наблюдателя
        var tempObserver = NewObserver
        tempObserver.Id = Observers.count
        Observers.append(tempObserver)
    }
    
    func delete(SomeObserver : Observer) throws {  // Удаление наблюдателя
        var wasFound : Bool = false
        if Observers.isEmpty == false {
            for observer in Observers {
                if observer.Id == SomeObserver.Id {
                    Observers.remove(at: observer.Id)
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
    
    func notifyObservers(WithNewIssue :Issue) throws {
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
        var updatedContent : String?
        do{
            updatedContent = try String(contentsOfFile: path , encoding: .utf8)
        }
        catch let error as NSError{
            print("Some trouble: class TopGear , method checkFile() : \(error)")
        }
        if let dataToCheck = updatedContent {
            if dataToCheck != contentOfFile {
                contentOfFile = dataToCheck
                let sizeBeforeUpdate = issuesList.count
                issuesList.removeAll()
                do{
                    issuesList = try makeIssues(content: contentOfFile)
                }
                catch let error as NSError {
                    print("Ошибка с заполнением файла! \(error)")
                }
                for i in sizeBeforeUpdate ..< issuesList.count{
                    do{
                        try notifyObservers(WithNewIssue: issuesList[i])
                    }
                    catch let error as NSError {
                        print("Ошибка \(error)")
                    }
                }
            }
        }
        else {
            print("Что-то пошло не так при попытке обратиться к файлу!")
        }
    }
    
    func getLastObserverNum() -> Int {
        return Observers.count-1
    }
}
