//
//  DoubleComponentPickerViewController.swift
//  Pickers
//
//  Created by w0427115 on 2020-02-10.
//  Copyright © 2020 w0427115. All rights reserved.
//

import UIKit

class DoubleComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var doublePicker: UIPickerView!
    private let fillingComponent = 0;
    private let breadComponent = 1 ;
    
    private let fillingTypes = ["Ham", "Turkey", "Tuna", "Chicken", "veggie"];
    private let breadTypes = ["White", "whole wheat", "Rye", "Seven Grain", "Mouldy"];
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onNuttonPressed(_ sender: UIButton) {
        
        let fillingRow = doublePicker.selectedRow(inComponent: fillingComponent);
        let breadRow = doublePicker.selectedRow(inComponent: breadComponent);
        
        
        let filling = fillingTypes[fillingRow];
        let bread = breadTypes[breadRow];
        
        let title = "thank you for your order!";
        let message = "Your \(filling) on \(bread) bread will be right up!";
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        let action = UIAlertAction(title: "Great", style: .cancel, handler: nil);
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
    
    //Mark:-
    //Mark Picker Data Source Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (component == breadComponent) {
            return breadTypes.count;
        }else {
            return fillingTypes.count;
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (component == breadComponent) {
            return breadTypes[row];
        }else {
            return fillingTypes[row];
        }
    }

}
