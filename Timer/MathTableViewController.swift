//
//  MathTableViewController.swift
//  Timer
//
//  Created by Alihan Demir on 11.02.2019.
//  Copyright © 2019 Alihan Demir. All rights reserved.
//

import UIKit

class MathTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let MathQuestions = ["Temel Kavramlar",
        "Sayı Basamakları,Sayı Sistemleri",
        "Bölme-Bölünebilme",
        "Asal Çarpanlara Ayırma EBOK-EKOK",
        "Rasyonel Sayılar",
        "Özdeşlikler ve Çarpanlara Ayırma",
        "Denklemler",
        "Basit eşitsizlikler ve Mutlak Değer",
        "Üslü Sayılar",
        "Köklü İfadeler",
        "Oran-Orantı",
        "Problemler",
        "Kümeler",
        "İşlem,Fonksiyon ve Modüler Aritmetik",
        "Permütasyon-Kombinasyon-Olasılık",
        "Tablo ve Grafikler",
        "Sayısal Mantık"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MathQuestions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MathList", for: indexPath)
        cell.textLabel?.text = MathQuestions[indexPath.row]
        return cell
    }
}
