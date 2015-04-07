//
//  SecondViewController.swift
//  ToDoApp
//


import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var textName:UITextField!
    @IBOutlet var textDesc:UITextField!
    @IBOutlet var UrgentSwitch:UISwitch!
    
    @IBAction func AddTask_touch(sender:UIButton){
        if(!textName.text.isEmpty && !textDesc.text.isEmpty ){
            taskManager.addTask(textName.text, Description: textDesc.text, Urgent: UrgentSwitch.on);
            UrgentSwitch.setOn(false, animated: true)
            textName.text = ""
            textDesc.text = ""
        }else{
            //alert to fill out all fields
            let alert = UIAlertController(title: "Error", message: "Please fill out all fields", preferredStyle: UIAlertControllerStyle.Alert)
            //button
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
          //  textName.select(self)
        }
      /*  println("-------------------------");
        for(var i=0;i<taskManager.count();i++){
            println(taskManager.getTask(i).getName());
            
        }
*/
       
    }
    
    
    
    
    //textfield delegate 
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    //override touch
  override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    self.view.endEditing(true);
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

