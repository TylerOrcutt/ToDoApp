//
//  SettingsViewController.swift
//  ToDoApp
//

import UIKit

class SettingsViewController:UIViewController{
    @IBOutlet var lbl1:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl1.text="test";
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}