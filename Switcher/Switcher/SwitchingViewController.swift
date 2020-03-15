//
//  SwitchingViewController.swift
//  Switcher
//
//  Created by w0427115 on 2020-02-26.
//  Copyright © 2020 w0427115. All rights reserved.
//

import UIKit

class SwitchingViewController: UIViewController {
    
    private var blueViewController: BlueViewController!;
    private var yellowViewController: YellowViewController!;
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Load the blue view as the initial View.
        blueViewController = storyboard?.instantiateViewController(withIdentifier: "Blue") as! BlueViewController;
        blueViewController.view.frame = view.frame;
        switchViewController(from: nil, to:blueViewController);
    }
    @IBAction func switchViews(sender:UIBarButtonItem){
        
        //create the new view controller if required
        if (yellowViewController?.view.superview == nil){
            if (yellowViewController == nil) {
                
                yellowViewController = storyboard?.instantiateViewController(withIdentifier: "Yellow") as? YellowViewController;
                
                
            }
            
            
        }else if (blueViewController?.view.superview == nil){
            if (blueViewController == nil){
                blueViewController = (storyboard?.instantiateViewController(withIdentifier: "Blue") as! BlueViewController);
                         
            }
            
            
            
        }
        
        //switcj the view controllers
        if (blueViewController != nil && blueViewController?.view.superview != nil) {
            //blue is currently loaded switch from blue to  yellow
            yellowViewController.view.frame = view.frame;
            switchViewController(from: blueViewController, to: yellowViewController);
        } else {
            //yellow is currently loaded, switch from yellow to blue
            
            blueViewController.view.frame = view.frame;
            switchViewController(from: yellowViewController, to: blueViewController);
        }
        
    }
    
    private func switchViewController(from fromVC:UIViewController?, to toVC:UIViewController?){
        
        if (fromVC != nil){
            fromVC!.willMove(toParent: nil);
            fromVC!.view.removeFromSuperview();
            fromVC!.removeFromParent()
        }
        if (toVC != nil){
            self.addChild(toVC!);
            self.view.insertSubview(toVC!.view, at: 0);
            toVC!.didMove(toParent: self);
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        if (blueViewController != nil && blueViewController!.view.superview == nil) {
            blueViewController = nil;
        }
        if (yellowViewController != nil && yellowViewController!.view.superview == nil) {
            
            
            yellowViewController = nil;
        }
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
