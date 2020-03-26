//
//  ViewController.swift
//  twitterClone
//
//  Created by 이진하 on 2020/03/25.
//  Copyright © 2020 이진하. All rights reserved.
//

import UIKit

struct Tweet{
    var Id: String
    var content: String
    var profile: String
    init(Id: String, content: String, profile: String){
        self.Id = Id
        self.content = content
        self.profile = profile
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var TweetTable: UITableView!
    let tweetList: [Tweet] = [
        Tweet(Id: "a", content: "aaa", profile: "A"),
        Tweet(Id: "b", content: "bbb", profile: "B"),
        Tweet(Id: "c", content: "ccc", profile: "C"),
        Tweet(Id: "d", content: "ddd", profile: "D"),
        Tweet(Id: "e", content: "eee", profile: "E"),
        Tweet(Id: "f", content: "fff", profile: "F"),
        Tweet(Id: "g", content: "ggg", profile: "G")
    
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let TweetCellNib = UINib(nibName: "TweetCell", bundle: nil)
        self.TweetTable.register(TweetCellNib, forCellReuseIdentifier: "TweetCell")
        //nib 등록
        self.TweetTable.delegate = self
        self.TweetTable.dataSource = self
        //위임
    }
    

}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tweetList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as? TweetCell else { return UITableViewCell() }
        //identifier가 "TweetCell"이란 cell을 재사용, cell에서 등록한 id,content,profile을 현재 tableViewlist에 있는것들을 각각 연결시켜줘야 함
        cell.Id.text = self.tweetList[indexPath.row].Id
        cell.content.text = self.tweetList[indexPath.row].content
        cell.profile.text = self.tweetList[indexPath.row].profile
        
        
        return cell
    }
    
}
