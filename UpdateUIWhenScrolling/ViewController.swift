//
//  ViewController.swift
//  UpdateUIWhenScrolling
//
//  Created by pham.the.hung on 3/5/20.
//  Copyright © 2020 pham.the.hung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var timer: Timer?
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(callAfterSomeTime), userInfo: nil, repeats: true)
        if let timer = timer {
            RunLoop.current.add(timer, forMode: .common)
        }
    }

    @objc func callAfterSomeTime() {
        if count == 100 {
            self.timer?.invalidate()
        }
        count += 1
        label.text = String(count)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        return cell
    }
}
