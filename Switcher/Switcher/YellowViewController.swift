//
//  YellowViewController.swift
//  Switcher
//
//  Created by w0427115 on 2020-02-26.
//  Copyright © 2020 w0427115. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Yellow Button Pressed", message: "You are on the yellow screen", preferredStyle: .alert);
        let action = UIAlertAction(title: "Yes I am!", style: .default, handler: nil);
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

}
