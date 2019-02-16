//
//  GeometryTableViewController.swift
//  Timer
//
//  Created by Alihan Demir on 11.02.2019.
//  Copyright © 2019 Alihan Demir. All rights reserved.
//

import UIKit

class GeometryTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    let GeometryQuestions = ["Açılar ve Üçgenler","Çokgenler","Çember ve Daire","Katı Cisimler","Analitik Geometri"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GeometryQuestions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GeometryList", for: indexPath)
        cell.textLabel?.text = GeometryQuestions[indexPath.row]
        return cell
    }
}
