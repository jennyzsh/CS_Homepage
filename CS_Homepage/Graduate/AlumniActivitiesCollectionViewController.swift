//
//  AlumniActivitiesCollectionViewController.swift
//  CS_Homepage
//
//  Created by Jenny ZHANG on 2018/11/19.
//  Copyright © 2018年 Jenny ZHANG. All rights reserved.
//

import UIKit

private let cellIdentifier = "AlumniActivitiesCollectionViewCell"

class AlumniActivitiesCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var activities: [Dictionary<String, AnyObject>] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Alumni Activities"
        self.loadJson()

        // Register cell classes
        self.collectionView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)

    }
    
    func loadJson() {
        if let path = Bundle.main.path(forResource: "activities", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let activities = jsonResult["activities"] as? [Dictionary<String, AnyObject>] {
                    self.activities = activities
                }
            } catch {
                
            }
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.activities.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! AlumniActivitiesCollectionViewCell
        
        cell.lblTitle.text = self.activities[indexPath.row]["Title"] as! String
        cell.lblDate.text = self.activities[indexPath.row]["Date"] as! String
        cell.lblContent.text = self.activities[indexPath.row]["Content"] as! String
        
        if let url = URL(string: self.activities[indexPath.row]["cover_image"] as! String) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        cell.imageView.image = UIImage(data: data)
                    }
                }
            }
        }
    
        return cell
    }
    
    //MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let content = storyboard?.instantiateViewController(withIdentifier: "AlumniActivitiesDetailViewController") as! AlumniActivitiesDetailViewController
        content.url = self.activities[indexPath.row]["detail_url"] as! String
        self.navigationController?.present(content, animated: true, completion: nil)
    }
    
    //MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width-10)/2, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

}
