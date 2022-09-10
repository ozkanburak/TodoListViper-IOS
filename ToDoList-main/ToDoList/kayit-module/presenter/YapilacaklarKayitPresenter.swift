//
//  YapilacaklarKayitPresenter.swift
//  ToDoList
//
//  Created by Burak Özkan on 09.09.2022.
//

import Foundation

class YapilacaklarKayitPresenter : ViewToPresenterYapilacaklarKayitProtocol {
    
    var yapilacakKayitInteractor: PresenterToInteractorYapilacaklarKayitProtocol?
    func ekle(yapilacak_is: String) {
        yapilacakKayitInteractor?.yapilacakEkle(yapilacak_is: yapilacak_is)
    }
}
