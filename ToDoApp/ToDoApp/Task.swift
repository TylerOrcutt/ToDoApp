//
//  Task.swift
//  ToDoApp
//


import Foundation
import UIKit



class Task  {
    //data members
    private var name:String
    private var description:String
    private var Urgent:Bool
    
    //convenice constructor
    convenience init(){
        self.init(name:"none",desc:"none",isUrgent:false)
    }
    
    //constructor
    init(name:String, desc:String, isUrgent:Bool){
        self.name=name
        self.description=desc
        self.Urgent=isUrgent
    }
    //accessors
    func setDesc(desc:String){
        self.description=desc;
        
    }
    func setName(name:String){
        self.name=name;
    }
    
    func setUrgent(isUrgent:Bool){
        self.Urgent=isUrgent
    }
    
    //mutators
    func getName()->String{
        return self.name
    }
    func getDesc()->String{
        return self.description
    }
    
    func isUrgent()->Bool{
        return self.Urgent;
    }
    
    
    
}



