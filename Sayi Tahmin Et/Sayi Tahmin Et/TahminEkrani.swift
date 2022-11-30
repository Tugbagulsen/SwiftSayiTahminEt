//
//  TahminEkrani.swift
//  Sayi Tahmin Et
//
//  Created by Nazan Korkmaz on 11/30/22.
//

import UIKit

class TahminEkrani: UIViewController {

    @IBOutlet weak var kalanHak: UILabel!
    @IBOutlet weak var yardim: UILabel!
    @IBOutlet weak var textFieldGirdi: UITextField!
    
    var rastgeleSayi:Int?
    var kalan = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rastgeleSayi = Int(arc4random_uniform(100))//0-100
        
        print("Rastgelen Sayı: \(rastgeleSayi!)")

   }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let gelenVeri = sender as? Bool {
            
            let gidilecekVC = segue.destination as! SonucEkrani
            
            gidilecekVC.sonuc = gelenVeri
        }

    }
 
    @IBAction func tahminEt(_ sender: Any) {
        
        yardim.isHidden = false
        kalan-=1//Her tahminde bir azalacak
        
        if let veri = textFieldGirdi.text {//Textfield üzerinden veri kontrol edilerek alınır
            
            if let tahmin = Int(veri) {//String ifadeyi kontrol ederek int ifadeye dönüştürürüz.
                
                if tahmin == rastgeleSayi! {//Tahmin rasgele sayıya eşitse kazanılır.
                    let sonuc = true
                    performSegue(withIdentifier: "tahminTosonuc", sender: sonuc)//Kazanılırsa sayfa geçişi ve veri transferi
                    return//Kazandıktan işlem yapmaması için return kullandık.
                    //return buttonun çalışmasını durdurur ve return ifadesinin yer aldığı satırdan sonraki kodlamalar çalışmaz.
                }
                
                if tahmin > rastgeleSayi! {//Tahmin edilen sayı büyük ise
                    yardim.text = "Azalt"
                    kalanHak.text = "Kalan Hak : \(kalan)"
                }
               
                if tahmin < rastgeleSayi! {//Tahmin edilen sayı küçük ise
                    yardim.text = "Arttır"
                    kalanHak.text = "Kalan Hak : \(kalan)"
                }
                
                if(kalan == 0){//Tahmin hakkı kalmaz ise
                    let sonuc = false
                    performSegue(withIdentifier: "tahminTosonuc", sender: sonuc)
                    //Haklar bitince sayfa geçişi ve veri transferi
                }
                
                textFieldGirdi.text = ""
            }
        }
        
    }
    
}
