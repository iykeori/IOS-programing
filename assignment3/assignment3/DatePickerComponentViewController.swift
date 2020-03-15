//
//  DatePickerComponentViewController.swift
//  assignment3
//
//  Created by w0427115 on 2020-02-19.
//  Copyright © 2020 w0427115. All rights reserved.
//

import UIKit

class DatePickerComponentViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var show: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let date = NSDate();
        datePicker.timeZone = NSTimeZone.local;
        datePicker.setDate(date as Date, animated: false);
    }
    
    
    @IBAction func show(_ sender: UIButton) {
        let date2 = NSDate();
        datePicker.setDate(date2 as Date, animated: false);
        
        
        let date = datePicker.date;
        let message = "The date and time selected is \(date)";
        
        
        
        let controller = UIAlertController(title: "Date and Time Selected", message: message, preferredStyle: .actionSheet);

        let yesAction = UIAlertAction(title: "EXIT", style: .cancel, handler: {action
            in

      });
       controller.addAction(yesAction);

        
        if let ppc = controller.popoverPresentationController{
            ppc.sourceView = sender;
            ppc.sourceRect = sender.bounds;
            
        }
        present(controller, animated: true, completion: nil);
        
        
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
