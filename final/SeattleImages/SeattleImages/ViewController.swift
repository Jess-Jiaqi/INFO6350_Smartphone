//
//  ViewController.swift
//  SeattleImages
//
//  Created by Jiaqi Li on 12/9/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblView: UITableView!
    let cities = ["Seattle1","Seattle2","Seattle3","Seattle4","Seattle5","Seattle6","Seattle7","Seattle8","Seattle9","Seattle10"]


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  Bundle.main.loadNibNamed("SeattleImageTableViewCell", owner: self)?.first as! SeattleImageTableViewCell
        cell.img.image = UIImage(named: "Seattle\(indexPath.row)")
        cell.lbl.text = cities[indexPath.row]
        return cell
    }

}

