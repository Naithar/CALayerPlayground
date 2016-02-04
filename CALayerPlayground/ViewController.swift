//
//  ViewController.swift
//  CALayerPlayground
//
//  Created by Semen Matsepura on 04.02.16.
//  Copyright © 2016 Semen Matsepura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Property
    
    @IBOutlet weak var viewForLayer: UIView!
    @IBOutlet var someView: UIView!
    
    var tableView: UITableView = UITableView()
    var items: [String] = ["Hello", "world", "!"]
    
    // MARK: - Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
    }
    
    func setupTableView() {
        
        tableView.frame = CGRectMake(0, 0, 320, 640)
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = .None
        
        tableView.registerClass(MyTableViewCell.self, forCellReuseIdentifier: "myCell")
        tableView.registerClass(MyImageTableViewCell.self, forCellReuseIdentifier: "myImageCell")
        tableView.registerClass(SenderTableViewCell.self, forCellReuseIdentifier: "senderCell")
        tableView.registerClass(SenderImageTableViewCell.self, forCellReuseIdentifier: "senderImageCell")
        
        self.view.addSubview(tableView)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 100
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell 
        
        switch indexPath.row {
        case let i where i % 2 == 0:
            cell = tableView.dequeueReusableCellWithIdentifier("senderCell", forIndexPath: indexPath)
        default:
            cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        }
        cell.selectionStyle = .None
        return cell
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        if let cell = cell as? MyTableViewCell {
//        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }
    
    
    
}