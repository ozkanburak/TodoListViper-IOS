//
//  YapilacaklarDetayRouter.swift
//  ToDoList
//
//  Created by Burak Özkan on 09.09.2022.
//

import Foundation

class YapilacaklarDetayRouter : PresenterToRouterYapilacaklarDetayProtocol {
    static func createModule(ref: YapilacaklarDetayVC) {
        //yetki verme
        ref.yapilacakDetayPresenterNesnesi = YapilacaklarDetayPresenter()
        ref.yapilacakDetayPresenterNesnesi?.yapilacakDetayInteractor = YapilacaklarDetayInteractor()
    }
}
