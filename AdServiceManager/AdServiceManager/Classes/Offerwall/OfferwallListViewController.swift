//
//  OfferwallListViewController.swift
//  AdFramework
//
//  Created by Murf on 2022/11/23.
//

import UIKit
import Alamofire

class OfferwallListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var array: [String] = ["1", "2", "3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }
}

extension OfferwallListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AF.request("https://api.bithumb.com/public/ticker/ALL_KRW", method: .get)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { res in
                print(res)
            }
    }
    
}
