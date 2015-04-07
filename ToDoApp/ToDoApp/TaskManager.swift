//
//  TaskManager.swift
//  ToDoApp
//

import Foundation

var taskManager:TaskManager = TaskManager();
class TaskManager{
    private var Tasks = [Task]()
    //add a task to the array
    func addTask(TaskName:String,Description:String,Urgent:Bool){
        if(!Urgent){
            Tasks.append(Task(name:TaskName,desc:Description,isUrgent:Urgent))
        }else{
            Tasks.insert(Task(name:TaskName,desc:Description,isUrgent:Urgent), atIndex: 0)
        }
    }
    
    //remove a task at specified index
    func removeTask(Index:Int){
        if(Index<Tasks.count){
        Tasks.removeAtIndex(Index);
        }
    }
    
    //return a task at specified index
    func getTask(Index:Int)->Task{
        
        return Tasks[Index];
    }
    
    
    func swap(source:Int, destination:Int){
        var temp:Task
        temp=Tasks[destination]
        Tasks[destination] = Tasks[source]
        Tasks[source] = temp
        
    }
    
    func move(source:Int, destination:Int){
        var temp:Task = Tasks[source]
       Tasks.removeAtIndex(source)
        Tasks.insert(temp, atIndex: destination)
        
    }
    //return the array of tasks
    func getTasks()->[Task]{
        return Tasks
    }
    
    func count()->Int{
        return Tasks.count;
    }
 
    
}