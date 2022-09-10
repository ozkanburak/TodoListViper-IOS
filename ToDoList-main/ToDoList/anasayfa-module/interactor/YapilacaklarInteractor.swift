//
//  YapilacaklarInteractor.swift
//  ToDoList
//
//  Created by Burak Özkan on 09.09.2022.
//

import Foundation

class YapilacaklarInteractor : PresenterToInteractorYapilacaklarProtocol {

    var yapilacaklarPresenter: InteractorToPresenterYapilacaklarProtocol?
    

    let db:FMDatabase?
 
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("todoliste.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func tumYapilacaklar() {
        db?.open()
        
        var liste = [Yapilacaklar]()
        
        do{
            let rs = try db!.executeQuery("SELECT * FROM yapilacaklar", values: nil)
       
           while rs.next(){
                let yapilacakIs = Yapilacaklar(yapilacak_id: Int(rs.string(forColumn: "yapilacak_id"))!, yapilacak_is: rs.string(forColumn: "yapilacak_is")!)
                liste.append(yapilacakIs)
            }
            yapilacaklarPresenter?.presenteraVeriGonder(yapilacaklarListesi: liste)
        }catch{
            print(error.localizedDescription)
        }
    
        db?.close()
    }
    
    func yapilacakAra(aramaKelimesi: String) {
        db?.open()
                var liste = [Yapilacaklar]()
                do {
                    let rs = try db!.executeQuery("SELECT * FROM yapilacaklar WHERE yapilacak_is like '%\(aramaKelimesi)%'", values: nil)
                    while rs.next() {
                        let yapilacakIs = Yapilacaklar(yapilacak_id: Int(rs.string(forColumn: "yapilacak_id"))!, yapilacak_is: rs.string(forColumn: "yapilacak_is")!)
                        liste.append(yapilacakIs)
                    }
                    yapilacaklarPresenter?.presenteraVeriGonder(yapilacaklarListesi: liste)
                } catch {
                    print(error.localizedDescription)
                }
                db?.close()
    }
    
    func yapilacakSil(yapilacak_id: Int) {
        db?.open()
               do {
                   try db!.executeUpdate("DELETE FROM yapilacaklar WHERE yapilacak_id = ?", values: [yapilacak_id])
                   tumYapilacaklar()
               } catch {
                   print(error.localizedDescription)
               }
               db?.close()
    }
    
    
}
