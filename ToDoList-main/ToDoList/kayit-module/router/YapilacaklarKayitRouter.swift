//
//  YapilacaklarKayitRouter.swift
//  ToDoList
//
//  Created by Burak Özkan on 09.09.2022.
//

import Foundation

class YapilacaklarKayitRouter : PresenterToRouterYapilacaklarKayitProtocol{
    static func createModule(ref: YapilacaklarKayitVC) {
        //yetkilendirme
        ref.yapilacakKayitPresenterNesnesi = YapilacaklarKayitPresenter()
        ref.yapilacakKayitPresenterNesnesi?.yapilacakKayitInteractor = YapilacaklarKayitInteractor()
    }
}
