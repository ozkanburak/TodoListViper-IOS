//
//  YapilacaklarDetayVC.swift
//  ToDoList
//
//  Created by Burak Özkan on 09.09.2022.
//

import UIKit

class YapilacaklarDetayVC: UIViewController {

    @IBOutlet weak var textFieldDetay: UITextField!
    
    var yapilacak:Yapilacaklar?
    var yapilacakDetayPresenterNesnesi:ViewToPresenterYapilacaklarDetayProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let y = yapilacak {
            textFieldDetay.text = y.yapilacak_is
        }
        
        YapilacaklarDetayRouter.createModule(ref: self)
    }
    

    @IBAction func buttonGuncelle(_ sender: Any) {
        
        if let yi = textFieldDetay.text, let y = yapilacak {
            yapilacakDetayPresenterNesnesi?.guncelle(yapilacak_id: y.yapilacak_id!, yapilacak_is: yi)
        }
    }
}
