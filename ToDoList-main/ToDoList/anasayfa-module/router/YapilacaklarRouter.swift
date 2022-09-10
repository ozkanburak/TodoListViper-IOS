//
//  YapilacaklarRouter.swift
//  ToDoList
//
//  Created by Burak Özkan on 09.09.2022.
//

import Foundation

//yetkilendirme

class YapilacaklarRouter : PresenterToRouterYapilacaklarProtocol {
    static func createModule(ref: YapilacaklarVC) {
        let presenter = YapilacaklarPresenter()
        
        //View
        ref.yapilacaklarPresenterNesnesi = presenter
        
        //Presenter
        ref.yapilacaklarPresenterNesnesi?.yapilacaklarInteractor = YapilacaklarInteractor()
        ref.yapilacaklarPresenterNesnesi?.yapilacaklarView = ref
        
        //Interactor
        ref.yapilacaklarPresenterNesnesi?.yapilacaklarInteractor?.yapilacaklarPresenter = presenter
    }
}
