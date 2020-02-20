//
//  TopGear.swift
//  cursovayaTechProg
//
//  Created by Артем Шарапов on 17.02.2020.
//  Copyright © 2020 Артем Шурупiв. All rights reserved.
//

import Foundation

func makeIssues(content : [String])-> [Issue]{
    var returnedList : [Issue] = []
    for everyIssue in content{
        let dataPackageForIssue = everyIssue.components(separatedBy: "\n")
        let issueToAdd = Issue(nameOfJournalInit: "TopGear", releaseDateInit: dataPackageForIssue[0] , numberInit: dataPackageForIssue[1] , issueTopicInit: dataPackageForIssue[2])
        returnedList.append(issueToAdd)
    }
    return returnedList
}

class TopGear : Journal{
    
    var contentOfFile = String()
    
    var issuesList: [Issue] = [Issue()]// Список выпусков
    
    var Observers: [Observer] = [] // Список наблюдателей
    
    
    var path : String
    
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
        issuesList = makeIssues(content: separatedContent)
        self.path = path
    }
    
    func register(NewObserver: Observer) throws {  // Добавление наблюдателя
        Observers.append(NewObserver)
    }
    
    func delete(SomeObserverWithId : Int) throws {  // Удаление наблюдателя
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
                let separatedContent = contentOfFile.components(separatedBy: "\\")
                let sizeBeforeUpdate = issuesList.count
                issuesList.removeAll()
                issuesList = makeIssues(content: separatedContent)
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
