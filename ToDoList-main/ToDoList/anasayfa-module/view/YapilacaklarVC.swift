//
//  ViewController.swift
//  ToDoList
//
//  Created by Burak Özkan on 09.09.2022.
//

import UIKit

class YapilacaklarVC : UIViewController{

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var yapilacaklarTableView: UITableView!
    
    //boş bir liste ve yapılacaklar sınıfından nesnelerimiz olacak
    var yapilacaklarListe = [Yapilacaklar]()
    
    var yapilacaklarPresenterNesnesi:ViewToPresenterYapilacaklarProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //search bar func için yetki verilmesi - bir protocol varsa yetkilendirmek zorundayız sonuc alabilmek için
        searchBar.delegate = self
        yapilacaklarTableView.delegate = self
        yapilacaklarTableView.dataSource = self
        
        veritabaniKopyala()
        
        YapilacaklarRouter.createModule(ref: self)

    }
    
        override func viewWillAppear(_ animated: Bool) {
            yapilacaklarPresenterNesnesi?.tumYapilacaklariYukle()
        }

    
    //geçişi dinlemek için
    //filtreleme yapılıcak
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetay" {
            if let yapilacak = sender as? Yapilacaklar {
                let gidilecekVC = segue.destination as! YapilacaklarDetayVC
                gidilecekVC.yapilacak = yapilacak
            }
        }
    }
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "todoliste", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("todoliste.sqlite")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("veritabanı var")
        }else{
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch{ print(error.localizedDescription) }
        }
    }
}

extension YapilacaklarVC : PresenterToViewYapilacaklarProtocol {
    func vieweVeriGonder(yapilacaklarListesi: Array<Yapilacaklar>) {
        self.yapilacaklarListe = yapilacaklarListesi
        //veri geldiğinde sayfaya yüklenmesi için
        self.yapilacaklarTableView.reloadData()
    }
}

extension YapilacaklarVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        yapilacaklarPresenterNesnesi?.ara(aramaKelimesi: searchText)
    }
}

extension YapilacaklarVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yapilacaklarListe.count
    }
    
    //hücrelerin kopyalanması, çoğaltılması bu hücrede çalışır
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //sıralı olarak kişi nesnesi gelecek
        let yapilacaklar = yapilacaklarListe[indexPath.row]
        
        //Tableviewcell e erişmek istiyor (yapilacaklarHucre class(TableViewCell) ve identifier(yapilacaklarHucre))
        let hucre = tableView.dequeueReusableCell(withIdentifier: "yapilacaklarHucre", for: indexPath) as! TableViewCell
        
        hucre.yapilacaklarBilgiLabel.text = "\(yapilacaklar.yapilacak_is!)"
        
        
        return hucre
    }
    
    //Sil adımı
    //swipe yaptığımızda hangi adımda yaptığımızı anlayabiliriz
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //destructive - kırmızı, normal-gri
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ (action,view,bool) in
            
            //dinamik olarak yazsın diye
            let yapilacak = self.yapilacaklarListe[indexPath.row] //anasayfadan alınsın diye self ekledik
            
            
            //alert
            let alert = UIAlertController(title: "Silme işlemi", message: "\(yapilacak.yapilacak_is!) silinsin mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel) {action in}
            
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive) { [self]action in
                self.yapilacaklarPresenterNesnesi?.sil(yapilacak_id: yapilacak.yapilacak_id!)
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yapilacak = yapilacaklarListe[indexPath.row] //seçtiğimiz satırın kişi nesnesi
        //print("\(yapilacak.yapilacak_is!) seçildi")
        performSegue(withIdentifier: "toDetay", sender: yapilacak)
        tableView.deselectRow(at: indexPath, animated: true) //seçili kalmasın diye
    }
    
}
