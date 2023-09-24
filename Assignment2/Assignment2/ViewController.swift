//
//  ViewController.swift
//  Assignment2
//
//  Created by Jiaqi Li on 9/23/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let imageNames = ["AvocadoToast","IceCream","Ceviche","Waffle","PadThai"]
    let foodDescription = ["Sliced or mashed avocado spread on toasted bread, often seasoned and topped with various ingredients.",
                           "A sweet, creamy frozen dessert made primarily from milk, cream, sugar, and flavorings.",
    "A Latin American dish of raw fish or seafood marinated in citrus juices, typically with onions, herbs, and spices.",
    "A leavened batter cooked between two patterned plates, resulting in a crisp, grid-patterned surface.",
    "A classic Thai stir-fried noodle dish with eggs, tofu or shrimp, bean sprouts, peanuts, lime, and tamarind sauce."]
  
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell
        
        cell.imgView.image = UIImage(named: imageNames[indexPath.row] )
        cell.foodName.text = imageNames[indexPath.row]
        cell.foodDescription.text = foodDescription[indexPath.row]
        
        return cell
    }

}

