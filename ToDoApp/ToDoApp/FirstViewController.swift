//
//  FirstViewController.swift
//  ToDoApp
//


import UIKit
import CoreData
class FirstViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tblView:UITableView!
   
    var startPress:Int!
    var stopPress:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      /*  taskManager.addTask("test1", Description: "test2", Urgent: false)
         taskManager.addTask("test2", Description: "test2", Urgent: false)
         taskManager.addTask("test3", Description: "test2", Urgent: false)
         taskManager.addTask("test4", Description: "test2", Urgent: false)
        taskManager.addTask("test5", Description: "test2", Urgent: false)
         taskManager.addTask("test6", Description: "test2", Urgent: false)*/
        
        // Do any additional setup after loading the view, typically from a nib.
/**/
//  tblView.setEditing(true, animated: true)
        
    let longpress = UILongPressGestureRecognizer(target:self, action:"LongPress:")
    
        tblView.addGestureRecognizer(longpress);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        tblView.reloadData();
    }
    
    func LongPress(gesterRec: UIGestureRecognizer){
       var index=tblView.indexPathForRowAtPoint(gesterRec.locationInView(tblView));
       
       // println("Long Press")
      switch(gesterRec.state)
        {
        case UIGestureRecognizerState.Began:
            startPress = index?.row;
            //println(index);
        break;
        case UIGestureRecognizerState.Ended:
        //println(index);
        stopPress = index?.row
       // println("source: \(startPress) dest \(stopPress)");
        if(!(startPress==nil) ){
            if(stopPress==nil){
                taskManager.move(startPress, destination: taskManager.count()-1)
            }else{
                 taskManager.move(startPress, destination: stopPress)
            }
            
        }
        startPress=nil
        stopPress=nil
        tblView.reloadData()
        break;
            
        default: break;
            
        }
   
    }
    
    
    //Number of cells
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return taskManager.count()
    }
    
    //Cells for tablebiew
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "none:")
        
     
        cell.textLabel?.text = taskManager.getTask(indexPath.row).getName()
        cell.detailTextLabel?.text = taskManager.getTask(indexPath.row).getDesc()
        //if urgent task set color to red
        if(taskManager.getTask(indexPath.row).isUrgent()){
        cell.textLabel?.textColor = UIColor.redColor()
        
        }
        return cell;
    }
    
    //-- required tableView to be editable
//allows rows to me moved?
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool{
        return true
    }
    //reorder - tableview has to be editable
 func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath){
       // taskManager.move(sourceIndexPath.row, destination: destinationIndexPath.row)
        tblView.reloadData();
      //  println("swaping");
    }

    //edit Delete Delegate
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if(editingStyle==UITableViewCellEditingStyle.Delete){
            
            taskManager.removeTask(indexPath.row);
         tblView.beginUpdates()
            
            tblView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:UITableViewRowAnimation.Fade);
          // tblView.reloadData();// seems to cause crashing
            tblView.endUpdates()
                     
        }
        
    }
    
    
    

    }
    
    
    
    


