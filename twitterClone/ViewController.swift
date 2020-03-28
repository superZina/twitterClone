//
//  ViewController.swift
//  twitterClone
//
//  Created by 이진하 on 2020/03/25.
//  Copyright © 2020 이진하. All rights reserved.
//

import UIKit

struct Tweet{
    var Id: String?
    var content: String?
    var profile: UIImage?
    init(Id: String, content: String, profile: UIImage?){
        self.Id = Id
        self.content = content
        self.profile = profile
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var TweetTable: UITableView!
    let tweetList: [Tweet] = [
        Tweet(Id: "a", content: "aaa", profile: UIImage(named: "농담곰")),
        Tweet(Id: "b", content: "bbb", profile: UIImage(named: "무민")),
        Tweet(Id: "c", content: "ccc", profile: UIImage(named: "커비")),
        Tweet(Id: "d", content: "ddd", profile: UIImage(named: "스누피")),
        Tweet(Id: "e", content: "eee", profile: UIImage(named: "")),
        Tweet(Id: "f", content: "fff", profile: UIImage(named: "")),
        Tweet(Id: "g", content: "ggg", profile: UIImage(named: ""))
    
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
        cell.Id.layer.borderWidth = 50
        cell.Id.text = self.tweetList[indexPath.row].Id
        cell.content.text = self.tweetList[indexPath.row].content
        cell.profile.image = self.tweetList[indexPath.row].profile
        cell.Id.font = .boldSystemFont(ofSize: 16)
        return cell
    }
    
}
