//
//  YapilacaklarDetayProtocols.swift
//  ToDoList
//
//  Created by Burak Özkan on 09.09.2022.
//

import Foundation
//view->presenter->interactor
protocol ViewToPresenterYapilacaklarDetayProtocol {
    var yapilacakDetayInteractor:PresenterToInteractorYapilacaklarDetayProtocol? {get set}
    func guncelle(yapilacak_id:Int, yapilacak_is:String)
}

protocol PresenterToInteractorYapilacaklarDetayProtocol {
    func yapilacakGuncelle(yapilacak_id:Int, yapilacak_is:String)
}

protocol PresenterToRouterYapilacaklarDetayProtocol {
    static func createModule(ref:YapilacaklarDetayVC)
}
