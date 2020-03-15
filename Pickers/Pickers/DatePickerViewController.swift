//
//  DatePickerViewController.swift
//  Pickers
//
//  Created by w0427115 on 2020-02-10.
//  Copyright © 2020 w0427115. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let date = NSDate();
        datePicker.timeZone = NSTimeZone.local;
        datePicker.setDate(date as Date, animated: false);
    }
    

    @IBAction func onButtonPressed(_ sender: UIButton) {
        let date2 = NSDate();
        datePicker.setDate(date2 as Date, animated: false);
        
        
        let date = datePicker.date;
        let message = "The date and time selected is \(date)";
        
        let alert = UIAlertController(title: "Date and Time Selected", message: message, preferredStyle: .alert);
        let dismissAction = UIAlertAction(title: "OK", style: .default, handler: nil);
        alert.addAction(dismissAction);
        present(alert, animated: true, completion: nil);
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
