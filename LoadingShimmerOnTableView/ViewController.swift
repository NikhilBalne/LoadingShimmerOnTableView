//
//  ViewController.swift
//  LoadingShimmerOnTableView
//
//  Created by Nikhil Balne on 10/05/20.
//  Copyright © 2020 Nikhil Balne. All rights reserved.
//

import UIKit
import LoadingShimmer

class ViewController: UIViewController {

    @IBOutlet weak var namesTableView: UITableView!
    private var numberOfSections: Int = 0
    private var numberOfRows: Int = 0
    var coverableCellsIds = [String]()
    
    var names = ["Nikhil","Naresh","Charan"]
    var ages = [20,21,22]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.numberOfSections = 0
        self.numberOfRows = 0
        namesTableView.separatorColor = .clear
    }

//    override func viewDidAppear(_ animated: Bool) {
//        LoadingShimmer.startCovering(namesTableView, with: coverableCellsIds)
//    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        self.numberOfSections = 0
        self.numberOfRows = 0
        
        coverableCellsIds = ["CustomTableViewCell","CustomTableViewCell","CustomTableViewCell","CustomTableViewCell","CustomTableViewCell"]
        LoadingShimmer.startCovering(namesTableView, with: coverableCellsIds)
        namesTableView.reloadData()
    }
    
    @IBAction func stopButtonTapped(_ sender: Any) {
        self.numberOfSections = 1
        self.numberOfRows = 3
        
        coverableCellsIds.removeAll()
        LoadingShimmer.stopCovering(namesTableView)
        namesTableView.reloadData()
    }
}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
        cell.userNameLabel.text = names[indexPath.row]
        cell.userAgeLabel.text = String(ages[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
}
