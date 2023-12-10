//
//  ViewController.swift
//  WeatherAPI
//
//  Created by Jiaqi Li on 12/9/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cityVaules: [CityClass] = [CityClass]()
    var cityNames = ["Seattle","San Francisco","Portland","New York","Miami"]

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addCity(_ sender: Any) {
        
        var cities = ""
        for city in cityNames {
            cities.append("\(city),")
        }
        
        let url = "\(baseURL)"
        SwiftSpinner.show("Getting Data")
        
        AF.request(url).responseJSON{ response in
            SwiftSpinner.hide()
            if response.error != nil {
                print(response.error?.localizedDescription ?? "Error")
                return
            }
            
            guard let rawData = response.data else {return}
            guard let jsonArray = JSON(rawData).array else {return}
            
            self.cityVaules = [CityClass]()
            for cityJSON in jsonArray {
                print("City : \(cityJSON)")
                let city = cityJSON["city"].stringValue
                let temperature = cityJSON["temperature"].intValue
                let conditions = cityJSON["conditions"].stringValue
                
                let cityClass = CityClass()
                cityClass.city = city
                cityClass.temperature = temperature
                cityClass.conditions = conditions
                self.cityVaules.append(cityClass)
            }
            self.tblView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cityVaules.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let city = cityVaules[indexPath.row].city
        let temperature = cityVaules[indexPath.row].temperature
        let conditions = cityVaules[indexPath.row].conditions
        cell.textLabel?.text = "City: \(city) Temperature: \(temperature) Condition: \(conditions)"
        return cell
    }
    
    
}

