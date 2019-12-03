//
//  ViewController.swift
//  18-UITableView
//
//  Created by 何强 on 2019/12/3.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataArray:Array<String>?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tableView: UITableView = UITableView.init(frame: self.view.frame , style: .grouped)
        self.view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        dataArray = ["1", "2", "3", "4", "5"]
        tableView.isEditing = true
        tableView.bounces = true
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .insert
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataArray?.remove(at: indexPath.row)
        } else {
            dataArray?.append("new")
        }
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let str = dataArray?[sourceIndexPath.row]
        //        let str2 = dataArray?[destinationIndexPath.row]
        //
        //        dataArray?[sourceIndexPath.row] = str2!
        //        dataArray?[destinationIndexPath.row] = str!
        dataArray?.remove(at: sourceIndexPath.row)
        dataArray?.insert(str!, at: destinationIndexPath.row)
    }
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cellId")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cellId")
            cell?.selectionStyle = .none
        }
        cell?.textLabel?.text = dataArray?[indexPath.row]
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section ,indexPath.row)
    }
    
    
    //    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    //        print("2")
    //    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view:UIView = UIView.init(frame: .init(x: 0, y: 0, width: 300, height: 100))
        view.backgroundColor = .red
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view: UIView = UIView.init(frame: .init(x: 0, y: 0, width: 300, height: 100))
        view.backgroundColor = .yellow
        return view
    }
}

