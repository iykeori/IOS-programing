//
//  SingleComponentPickerViewController.swift
//  Pickers
//
//  Created by w0427115 on 2020-02-10.
//  Copyright © 2020 w0427115. All rights reserved.
//

import UIKit

class SingleComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var singlePicker: UIPickerView!
    
    private let characterNames = [
        "Luke", "Leia", "Han","Kermit", "R2D2", "Kirk", "Spock"
    ];
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        
        let row = singlePicker.selectedRow(inComponent: 0);
        
        let selected = characterNames[row];
        let title = "you selected \(selected)!";
        
        let alert = UIAlertController(title: title, message: "Thank you for choosing", preferredStyle: .alert);
        let action = UIAlertAction(title: "You are welcome", style: .cancel, handler: nil);
        alert.addAction(action);
        
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
    //MArk:-
    //Mark Picker Data Source Methods
    func numberOfComponents(in pickerview: UIPickerView) -> Int {
        return 1;
    }
   
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return characterNames.count;
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return characterNames[row];
    }

}
