//
//  PlayerCollectionViewController.swift
//  CollectionView
//
//  Created by 林祔利 on 2023/4/16.
//

import UIKit

private let reuseIdentifier = "Cell"

class PlayerCollectionViewController: UICollectionViewController {

    let players = [
        Player(name: "James", height: 206, imageName: "james"),
        Player(name: "Kobe", height: 198, imageName: "kobe"),
        Player(name: "Harden", height: 197, imageName: "哈登"),
        Player(name: "James1", height: 206, imageName: "james"),
        Player(name: "Kobe1", height: 198, imageName: "kobe"),
        Player(name: "Harden1", height: 197, imageName: "哈登"),
        Player(name: "James2", height: 206, imageName: "james"),
        Player(name: "Kobe2", height: 198, imageName: "kobe"),
        Player(name: "Harden3", height: 197, imageName: "哈登"),
        Player(name: "James4", height: 206, imageName: "james"),
        Player(name: "Kobe4", height: 198, imageName: "kobe"),
        Player(name: "Harden4", height: 197, imageName: "哈登")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return players.count
    }

    
    @IBSegueAction func showDetail(_ coder: NSCoder) -> ShowDetailViewController? {
        guard let item = collectionView.indexPathsForSelectedItems?.first?.item else { return nil}
        return ShowDetailViewController(coder: coder,player: players[item])
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(PlayersCollectionViewCell.self)", for: indexPath) as! PlayersCollectionViewCell
        
        let player = players[indexPath.item]
        cell.playerImage.image = UIImage(named: player.imageName)
        cell.nameLabel.text = player.name
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
