//
//  BuyViewController.swift
//  Brello
//
//  Created by Zach Chandler on 7/24/17.
//  Copyright © 2017 Mad Men Software. All rights reserved.
//

//
//  landingViewController.swift
//  Brello
//
//  Created by Zach Chandler on 7/15/17.
//  Copyright © 2017 Mad Men Software. All rights reserved.
//

import UIKit
import Hero


class BuyViewConroller: UIViewController {
    
    var selectedIndex: IndexPath!
    var cities: [City] = City.buyPass
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layoutIfNeeded()
        collectionView.reloadData()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        cities = City.buyPass
        collectionView.scrollToItem(at: selectedIndex, at: .centeredHorizontally, animated: true)
        collectionView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let currentCell = sender as? CityCell,
            let vc = segue.destination as? SelectPurchaseViewController,
            let currentCellIndex = collectionView.indexPath(for: currentCell) {
            vc.selectedIndex = currentCellIndex
        }
    }
    @IBAction func viewPages(_ sender: Any) {
        let vc = viewController(forStoryboardName: "Menu")
        
        DispatchQueue.main.async {
            self.present(vc, animated: true, completion: nil)
        }
    }
    
}

extension BuyViewConroller: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            selectedIndex = indexPath
        }
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as? CityCell)!
        cell.useShortDescription = false
        cell.city = cities[indexPath.item]
        return cell
    }
    
}
