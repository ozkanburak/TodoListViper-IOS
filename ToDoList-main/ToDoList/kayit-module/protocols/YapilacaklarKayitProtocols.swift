//
//  YapilacaklarKayitProtocols.swift
//  ToDoList
//
//  Created by Burak Özkan on 09.09.2022.
//

import Foundation

//view->presenter->interactor

protocol ViewToPresenterYapilacaklarKayitProtocol {
    var yapilacakKayitInteractor:PresenterToInteractorYapilacaklarKayitProtocol? {get set}
    func ekle(yapilacak_is:String)
}

protocol PresenterToInteractorYapilacaklarKayitProtocol {
    func yapilacakEkle(yapilacak_is:String)
}

protocol PresenterToRouterYapilacaklarKayitProtocol {
    static func createModule(ref:YapilacaklarKayitVC)
}
