//
//  ViewController.swift
//  twitterClone
//
//  Created by 이진하 on 2020/03/25.
//  Copyright © 2020 이진하. All rights reserved.
//

import UIKit

struct Tweet{
    var Id: String!
    var content: String!
    var profile: UIImage?
    var test: Int!
    
    init(Id: String!, content: String!, profile: UIImage?, test: Int!){
        self.Id = Id
        self.content = content
        self.profile = profile
        self.test = test
    }
}

class ViewController: UIViewController {
    
//
//      Swift thread ==> DispatchQueue
//

    private var refreshControl = UIRefreshControl()
    
    var test: Int! = 0
    var test2: Int = 0
    
    
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var TweetTable: UITableView!
    var tweetList: [Tweet] = [
        Tweet(Id: "농담곰", content: "ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ", profile: UIImage(named: "농담곰"), test: nil)
//        Tweet(Id: "무민", content: "안녕하세요 무민 입니다", profile: UIImage(named: "무민")),
//        Tweet(Id: "커비", content: "안녕하세요 커비 입니다", profile: UIImage(named: "커비")),
//        Tweet(Id: "스누피", content: "ddd", profile: UIImage(named: "스누피")),
//        Tweet(Id: "스펀지밥", content: "eee", profile: UIImage(named: "스펀지밥")),
//        Tweet(Id: "뚱이", content: "ㅎㅎㅎㅎ", profile: UIImage(named: "뚱이")),
//        Tweet(Id: "하리보", content: "ggg", profile: UIImage(named: "하리보"))
    
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
        self.TweetTable.rowHeight = UITableView.automaticDimension
        self.TweetTable.estimatedRowHeight = 660.0

    }

}


extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    //왼쪽으로 스와이프할 때 액션
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.tweetList.remove(at: self.tweetList[indexPath.row].test)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
   }
    
    //왼쪽으로 스와이프할 떄 액션
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let share = UIContextualAction(style: .normal, title: "공유"){action,view,completion in completion(true)
        }
        return UISwipeActionsConfiguration(actions: [share])
    }
    //cell 이동
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {

        let Tweet = self.tweetList[sourceIndexPath.row]
        self.tweetList.remove(at: sourceIndexPath.row)
        self.tweetList.insert(Tweet, at: destinationIndexPath.row)
    }
    //delete 버튼 안보이게 함
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }

    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    
    //cell개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tweetList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as? TweetCell else { return UITableViewCell() }
        //identifier가 "TweetCell"이란 cell을 재사용, cell에서 등록한 id,content,profile을 현재 tableViewlist에 있는것들을 각각 연결시켜줘야 함
        cell.Id.text = self.tweetList[indexPath.row].Id
        cell.content.text = self.tweetList[indexPath.row].content
        cell.profile.image = self.tweetList[indexPath.row].profile
        cell.content.numberOfLines = 0
        cell.content.preferredMaxLayoutWidth = 200
        cell.Id.font = .boldSystemFont(ofSize: 16)
        return cell
    }
    
}
