//
//  MasterViewController.swift
//  CGPathSample
//
//  Created by Kuze Masanori on 2015/06/10.
//  Copyright (c) 2015年 Kuze Masanori. All rights reserved.
//

import UIKit



class MasterViewController: UITableViewController {

    var objects = [AnyObject]()
    var Items : NSArray =
    [
        "CGPathCreateWithEllipseInRect",
        "CGPathCreateWithRect",
        "CGPathCreateWithRoundedRect",
        "CGPathAddArc",
        "CGPathAddRelativeArc",
        "CGPathAddArcToPoint",
        "CGPathAddCurveToPoint",
        "CGPathAddQuadCurveToPoint"
    ]

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.navigationItem.leftBarButtonItem = self.editButtonItem()

//        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
//        self.navigationItem.rightBarButtonItem = addButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(sender: AnyObject) {
        objects.insert(NSDate(), atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "rect" {
//            if let indexPath = self.tableView.indexPathForSelectedRow() {
//                let object = Items[indexPath.row] as! NSString
//                (segue.destinationViewController as! DetailViewController).detailItem = object
//            }
//        } else {
//            if let indexPath = self.tableView.indexPathForSelectedRow() {
//                let object = Items[indexPath.row] as! NSString
//                (segue.destinationViewController as! DetailViewController).detailItem = object
//            }
//        }
        
        
        if let indexPath = self.tableView.indexPathForSelectedRow() {
            let object = Items[indexPath.row] as! NSString
            (segue.destinationViewController as! DetailViewController).detailItem = object
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

        //let object = objects[indexPath.row] as! NSDate
        let object = Items[indexPath.row] as! NSString
        
        cell.textLabel!.text = object.description
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selected = Items[indexPath.row] as! NSString
        
        
        switch selected {
        case "CGPathAddArc","CGPathAddRelativeArc" :
            performSegueWithIdentifier("arc", sender: nil)
        case "CGPathAddArcToPoint" :
            performSegueWithIdentifier("arcPoint", sender: nil)
        case "CGPathAddCurveToPoint" , "CGPathAddQuadCurveToPoint" :
            performSegueWithIdentifier("curve", sender: nil)
        default :
            performSegueWithIdentifier("rect", sender: nil)
        }
    }
}

