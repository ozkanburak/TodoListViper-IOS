//
//  YapilacaklarKayitInteractor.swift
//  ToDoList
//
//  Created by Burak Özkan on 09.09.2022.
//

import Foundation

class YapilacaklarKayitInteractor : PresenterToInteractorYapilacaklarKayitProtocol {
    
    let db: FMDatabase?
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("todoliste.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    func yapilacakEkle(yapilacak_is: String) {
        db?.open()
        do {
            try db!.executeUpdate("INSERT INTO yapilacaklar (yapilacak_is) VALUES (?)", values: [yapilacak_is])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
}
