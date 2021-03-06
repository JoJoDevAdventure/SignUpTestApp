//
//  HomeController.swift
//  SignUp
//
//  Created by Youssef Bhl on 16/11/2021.
//

import UIKit
import FirebaseAuth

class HomeController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Mark : Var
    
    var Models = [ChillaxPost]()
    
    
    
    //Mark : Outlets
    
    @IBOutlet weak var TableFeed: UITableView!
    
    @IBOutlet weak var DisconnectView: UIView!
    
    @IBOutlet weak var DisconnectButton: UIBarButtonItem!
    
    @IBOutlet weak var NoButton: UIButton!
    @IBOutlet weak var YesButton: UIButton!
    
    
    override func viewDidLoad() {
        buttonSetup()
        super.viewDidLoad()
        TableFeed.register(FeedTableViewCell.nib(), forCellReuseIdentifier: FeedTableViewCell.identifier)
        TableFeed.delegate = self
        TableFeed.dataSource = self
        DisconnectView.isHidden = true
        
        Models.append(ChillaxPost(FeedNumberOfLikes: 150,
                                  FeedUserName: "Joseph",
                                  UserProfileIMGName: "image1",
                                  FeedIMGName: "Feed1"))
        
        Models.append(ChillaxPost(FeedNumberOfLikes: 200,
                                  FeedUserName: "Youssef",
                                  UserProfileIMGName: "image2",
                                  FeedIMGName: "Feed2"))
        
        Models.append(ChillaxPost(FeedNumberOfLikes: 14346,
                                  FeedUserName: "Yousssef",
                                  UserProfileIMGName: "image3",
                                  FeedIMGName: "Feed3"))
        
        Models.append(ChillaxPost(FeedNumberOfLikes: 1523,
                                  FeedUserName: "Youssef",
                                  UserProfileIMGName: "image1",
                                  FeedIMGName: "Feed4"))
        
        Models.append(ChillaxPost(FeedNumberOfLikes: 153,
                                  FeedUserName: "Youssef",
                                  UserProfileIMGName: "image1",
                                  FeedIMGName: "Feed5"))
        
        Models.append(ChillaxPost(FeedNumberOfLikes: 142,
                                  FeedUserName: "Youssef Bhl",
                                  UserProfileIMGName: "image1",
                                  FeedIMGName: "Feed6"))
        
        Models.append(ChillaxPost(FeedNumberOfLikes: 18232,
                                  FeedUserName: "Youssef",
                                  UserProfileIMGName: "image1",
                                  FeedIMGName: "Feed7"))
        
    }
    
    //Mark : Actions
    
    
    func buttonSetup(){
        YesButton.backgroundColor = .clear
        YesButton.layer.cornerRadius = 5
        YesButton.layer.borderWidth = 1
        YesButton.layer.borderColor = UIColor.red.cgColor
        
        NoButton.backgroundColor = .clear
        NoButton.layer.cornerRadius = 5
        NoButton.layer.borderWidth = 1
        NoButton.layer.borderColor = UIColor.systemBlue.cgColor
    }
    
    @IBAction func ShowSignOutMessage(_ sender: Any) {
        DisconnectView.isHidden = false
    }
    
    @IBAction func YesDisconnect(_ sender: Any) {
        performSegue(withIdentifier: "Disconnect", sender: self)
    }
    
    
    @IBAction func NoDont(_ sender: Any) {
        DisconnectView.isHidden = true
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Models.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier, for: indexPath) as! FeedTableViewCell
        cell.configure(with: Models[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120+140+view.frame.size.width
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

//Mark : Extensions

    

struct ChillaxPost {
    let FeedNumberOfLikes : Int
    let FeedUserName : String
    let UserProfileIMGName : String
    let FeedIMGName : String
}
