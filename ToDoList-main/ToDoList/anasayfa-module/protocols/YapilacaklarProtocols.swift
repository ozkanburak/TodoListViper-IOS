//
//  YapilacaklarProtocols.swift
//  ToDoList
//
//  Created by Burak Özkan on 09.09.2022.
//

import Foundation

//ana protocoller

protocol ViewToPresenterYapilacaklarProtocol {
    
    var yapilacaklarInteractor:PresenterToInteractorYapilacaklarProtocol? {get set}
    var yapilacaklarView:PresenterToViewYapilacaklarProtocol? {get set}
    
    func tumYapilacaklariYukle()
    func ara(aramaKelimesi:String)
    func sil(yapilacak_id:Int)
}

protocol PresenterToInteractorYapilacaklarProtocol {
    
    var yapilacaklarPresenter:InteractorToPresenterYapilacaklarProtocol? {get set}
    
    func tumYapilacaklar()
    func yapilacakAra(aramaKelimesi:String)
    func yapilacakSil(yapilacak_id:Int)
}

//taşıyıcı protocoller

protocol InteractorToPresenterYapilacaklarProtocol {
    func presenteraVeriGonder(yapilacaklarListesi:Array<Yapilacaklar>)
}

protocol PresenterToViewYapilacaklarProtocol {
    func vieweVeriGonder(yapilacaklarListesi:Array<Yapilacaklar>)
}

//router

protocol PresenterToRouterYapilacaklarProtocol {
    static func createModule(ref:YapilacaklarVC)
}
