//
//  SelectPurchaseViewController.swift
//  Brello
//
//  Created by Zach Chandler on 7/24/17.
//  Copyright © 2017 Mad Men Software. All rights reserved.
//


import UIKit
import Hero

class SelectPurchaseViewController: UIViewController {
    var selectedIndex: IndexPath!
    var cities: [City] = City.buyPass
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
            let vc = segue.destination as? ConfirmViewController,
            let currentCellIndex = collectionView.indexPath(for: currentCell) {
            vc.name = cities[currentCellIndex.row].name
            vc.desc = cities[currentCellIndex.row].description
            vc.city = City.buyPass[currentCellIndex.row]
            if City.buyPass[currentCellIndex.row].type == 1 {
                vc.color = Colours.brelloRed()
                vc.price = "$6.00"
                vc.image = #imageLiteral(resourceName: "brelloLogo")
            }
            if City.buyPass[currentCellIndex.row].type == 2 {
                vc.color = Colours.brelloBlue()
                vc.price = "$11.00"
                vc.image = #imageLiteral(resourceName: "BlueLogo")


            }
            if City.buyPass[currentCellIndex.row].type == 3 {
                vc.color = Colours.brelloGreen()
                vc.price = "$16.00"
                vc.image = #imageLiteral(resourceName: "GreenLogo")


            }
            if City.buyPass[currentCellIndex.row].type == 4 {
                vc.color = Colours.brelloGold()
                vc.price = "$21.00"
                vc.image = #imageLiteral(resourceName: "GoldLogo")


            }
            if City.buyPass[currentCellIndex.row].type == 5 {
                vc.color = Colours.brelloOrange()
                vc.price = "$26.00"
                vc.image = #imageLiteral(resourceName: "OrangeLogo")


            }
            if City.buyPass[currentCellIndex.row].type == 6 {
               vc.color = Colours.brelloPink()
                vc.price = "$31.00"
                vc.image = #imageLiteral(resourceName: "PinkLogo")
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

extension SelectPurchaseViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
