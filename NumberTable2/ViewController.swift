//
//  ViewController.swift
//  NumberTable2
//
//  Created by IMCS on 8/9/19.
//  Copyright © 2019 IMCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var numberArray : [String] = []
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var numberSlider: UISlider!
    @IBAction func numberSliderAction(_ sender: Any) {
        
        let number = Int(numberSlider.value*100)
        label.text = String(number)
        
        numberArray = []
        for range in 0...49 {
            let product = number*range
            let string = "\(range)*"+String(number)+"=\(product)"
            numberArray.append(string)
        }
     
        embeddedTableView.reloadData()

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        
        cell.label.text = numberArray[indexPath.row]
        
        return cell
        
    }
    
    

    @IBOutlet weak var embeddedTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

class CustomTableViewCell: UITableViewCell {
    @IBOutlet var label: UILabel!
    
}
