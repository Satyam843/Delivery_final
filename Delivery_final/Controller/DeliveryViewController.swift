//
//  DeliveryViewController.swift
//  Delivery_final
//
//  Created by soc-admin on 7/30/20.
//  Copyright © 2020 soc-admin. All rights reserved.
//

import UIKit

class DeliveryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    

    @IBOutlet weak var deliveryTableView: UITableView!
    var deliveryData = ["Client Name","Phone","Email","order Id","Address","Deliver Before","Description","Barcode"]
   
    var imageData = [UIImage(named: "name"),
                     UIImage(named: "call"),
                     UIImage(named: "gmail"),
                     UIImage(named: "OrderId"),
                     UIImage(named: "address"),
                     UIImage(named: "Date"),
                     UIImage(named: "Description"),
                     UIImage(named: "BarCoad")
        
    ]
    // var imageData = ["name","call","gmail","OrderId","address","Date","Description","Barcoad"]
     let datePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
 deliveryTableView.rowHeight = 75
        deliveryTableView.reloadData()
        donePressed()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deliveryData.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = deliveryTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DeliveryViewCell
        if(indexPath.row == 8)
        {
            cell.cellTextField.placeholder = "Image"
return cell        }
            else if(indexPath.row == 5)
        {
             let cell = deliveryTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DeliveryViewCell
            let toolBar = UIToolbar()
            toolBar.sizeToFit()
            let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
            cell.cellTextField.inputAccessoryView = toolBar
            cell.cellTextField.inputView = datePicker
            //cell.cellTextField.text = "\(datePicker.date)"
            cell.cellTextField.placeholder = deliveryData[5]
            cell.cellImageView.image = imageData[5]
            toolBar.setItems([doneBtn], animated: true)
           return cell
        }
        else
        {
            cell.cellTextField.placeholder = deliveryData[indexPath.row]
            cell.cellImageView.image = imageData[indexPath.row]
            return cell
        }
       
        
    }
    @objc func donePressed() {
        let cell = deliveryTableView.cellForRow(at: IndexPath(row: 5, section: 0)) as! DeliveryViewCell
        cell.cellTextField.text = "\(datePicker.date)"
        print(cell.cellTextField.text!)
        self.view.endEditing(true)
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
