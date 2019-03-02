//
//  ViewController.swift
//  WebServices
//
//  Created by apple on 27/02/19.
//  Copyright © 2019 iOSProofs. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var commnetsViewModel: CommentsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commnetsViewModel = CommentsViewModel()
    }

    @IBAction func getComments(_ sender: Any) {
        commnetsViewModel?.getComments(result: { (isSuccess) in
            if isSuccess {
                DispatchQueue.main.async {
                 self.tableView.reloadData()
                }
            }
        })
    }
}


extension CommentsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commnetsViewModel?.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        let aCommnet = commnetsViewModel?.comments?[indexPath.row]
        
        cell?.textLabel?.text = aCommnet?.name
        return cell ?? UITableViewCell()
    }
    
  
}
