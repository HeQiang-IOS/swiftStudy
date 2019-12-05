//
//  ListTableViewController.swift
//  28-Demo
//
//  Created by 何强 on 2019/12/4.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var personList = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()

        loadData { (list) in
            print(list)
            self.personList = list
            self.tableView.reloadData()
        }
    }
    
    typealias completionBlock = ([Person]) -> ()
    
    private func loadData(completion: @escaping completionBlock) -> () {
        DispatchQueue.global().async {
            
            
            print("正在努力加载中")
            Thread.sleep(forTimeInterval: 1)
            
            var arrayM = [Person]()
            
            for i in 0..<20 {
                let p = Person()
                p.name = "zhangsan - \(i)"
                p.phone = "186**" + String.init(format: "%06d", arc4random_uniform(1000000))
                p.title = "boss"
                arrayM.append(p)
            }
            
            
            DispatchQueue.main.async {
                completion(arrayM)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.personList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = personList[indexPath.row].name
        cell.detailTextLabel?.text = personList[indexPath.row].phone
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "list2", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DetailTableViewController
        if let indexPath = sender as? IndexPath {
            vc.person = personList[indexPath.row]
            
            vc.completCallBack = {
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
    }

}
