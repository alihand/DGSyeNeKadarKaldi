//
//  TableViewController.swift
//  Timer
//
//  Created by Alihan Demir on 11.02.2019.
//  Copyright © 2019 Alihan Demir. All rights reserved.
//

import UIKit

class TurkishTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    let TurkishQuestions = ["Sözcükte Anlam","Anlatım Biçimleri","Sözel Mantık","Cümlede Anlam","Paragraf"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TurkishQuestions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "turkishList", for: indexPath)
        cell.textLabel?.text = TurkishQuestions[indexPath.row]
        return cell
    }
}
