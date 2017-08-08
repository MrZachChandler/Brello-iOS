//
//  PassesViewController.swift
//  Brello
//
//  Created by Zach Chandler on 7/16/17.
//  Copyright © 2017 Mad Men Software. All rights reserved.
//


import UIKit
import Hero

class PassesViewController: UIViewController {
    var selectedIndex: IndexPath!
    var cities: [City] = City.passes
    var index = 0
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layoutIfNeeded()
        collectionView.reloadData()
        collectionView.scrollToItem(at: selectedIndex, at: .centeredHorizontally, animated: false)
        index = selectedIndex.row
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let currentCell = sender as? CityCell,
            let vc = segue.destination as? QRDetailViewController,
            let currentCellIndex = collectionView.indexPath(for: currentCell) {
            vc.name = cities[currentCellIndex.row].name
            vc.desc = cities[currentCellIndex.row].description
            if City.passes[currentCellIndex.row].type == 1 {
                vc.color = Colours.brelloRed()
            }
            if City.passes[currentCellIndex.row].type == 2 {
                vc.color = Colours.brelloBlue()
            }
            if City.passes[currentCellIndex.row].type == 3 {
                vc.color = Colours.brelloGreen()
            }
            if City.passes[currentCellIndex.row].type == 4 {
                vc.color = Colours.brelloGold()
            }
            if City.passes[currentCellIndex.row].type == 5 {
                vc.color = Colours.brelloOrange()
            }
            if City.passes[currentCellIndex.row].type == 6 {
                vc.color = Colours.brelloPink()
            }
        }
        else {
            if let vc = segue.destination as? PassInfoViewController {
                let pass = cities[index]
                vc.index = index
                vc.passType = pass.type
                vc.myPass = pass
            }
            
        }
        
    }
    @IBAction func viewInfo(_ sender: Any) {
        
        performSegue(withIdentifier: "informationSeque", sender: nil)
        
//        let vc = viewController(forStoryboardName: "PassInfo") as! PassInfoViewController
//        let pass = cities[index]
//        vc.index = index
//        vc.passType = pass.type
//        vc.myPass = pass.icon
//        DispatchQueue.main.async {
//            self.present(vc, animated: true, completion: nil)
//        }
    }

}

extension PassesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return view.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as? CityCell)!
        cell.useShortDescription = false
        cell.city = cities[indexPath.item]
        return cell
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()
        
        visibleRect.origin = collectionView.contentOffset
        visibleRect.size = collectionView.bounds.size
        
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        
        let visibleIndexPath: IndexPath = collectionView.indexPathForItem(at: visiblePoint)!
        index = visibleIndexPath.row
        print(visibleIndexPath)
    }
}
