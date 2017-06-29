//
//  ViewController.swift
//  ChiselCut
//
//  Created by Chetan Chauhan on 20/06/17.
//  Copyright © 2017 Chetan Chauhan. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var videoDataArray:NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.reloadData()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib.init(nibName: "VideoTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "cell")
        self.configureTableView()   
    }
    
    func configureTableView() {
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    
    func reloadData()   {
        let networkManager = NetworkManager()
        networkManager.urlApiString = "58/videos.json?page=1"
        
        networkManager.getVideoItems { (modelArray, error) in
            self.videoDataArray = modelArray
            self.tableView.reloadData()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
       // var videoModel = VideoModel?
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = (self.videoDataArray?.count)  else {
            return 0
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier:String = "cell"
        let cell:VideoTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! VideoTableViewCell
        let videoModelInstance:VideoModel = videoDataArray?.object(at: indexPath.row) as! VideoModel
        cell .configureCell(videoModel: videoModelInstance)
        return cell
    }
    
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160.00;
    }
}

