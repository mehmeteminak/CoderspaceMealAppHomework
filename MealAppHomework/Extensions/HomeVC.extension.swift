//
//  HomeVC.extension.swift
//  MealAppHomework
//
//  Created by Macbook Air on 15.10.2023.
//

import Foundation
import UIKit

extension HomeVC {
    func initialConfig(){
        
        viewModel.delegate = self
        navigationController?.navigationBar.backgroundColor = .white
        view.backgroundColor = .white
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(customView: greetingLabel)
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "basket")?.withTintColor(.orange, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(myBasketClicked))
        
        
        
        restaurentTable.dataSource = self
        restaurentTable.delegate = self
        
        
        recentItemsTableView.delegate = self
        recentItemsTableView.dataSource = self
        
        
        scrollView.addSubviews([deliveringLabel,deliverLocationLabel,searchBar,categoriesCV,popularRestaurentsLabel,restaurentTable,mostPopularRestaurantCV,mostPopularRestaurentsLabel,mostPopularRestaurantCV,recentItemsLabel,recentItemsTableView,viewAllPopular,viewAllMostPopular,viewAllRecentItems])
        
        view.addSubview(scrollView)
    }
    
    
    @objc
    func myBasketClicked(){
        //TODO: Handle the basket clicked operation
    }
    
    @objc
    func currentLocationTouched(){
        presentAlert(title: "Select Location", message: "Please select location", type: .actionSheet)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.navigationController!.navigationBar.bottomAnchor),
            scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.tabBarController!.tabBar.topAnchor),
            
            
            deliveringLabel.topAnchor.constraint(equalTo: scrollView.topAnchor , constant: 20),
            deliveringLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor , constant: 15),
            deliveringLabel.widthAnchor.constraint(equalToConstant: Constants.deviceWidth * 0.6),
            
            
            deliverLocationLabel.topAnchor.constraint(equalTo: deliveringLabel.topAnchor , constant: 20),
            deliverLocationLabel.leftAnchor.constraint(equalTo: deliveringLabel.leftAnchor),
            deliverLocationLabel.widthAnchor.constraint(equalToConstant: Constants.deviceWidth * 0.6),
            
            
            
            searchBar.topAnchor.constraint(equalTo: deliverLocationLabel.bottomAnchor,constant: 20),
            searchBar.leftAnchor.constraint(equalTo: deliverLocationLabel.leftAnchor,constant: 5),
            searchBar.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -15),
            
            
            categoriesCV.topAnchor.constraint(equalTo: searchBar.bottomAnchor,constant: 20),
            categoriesCV.leftAnchor.constraint(equalTo: view.leftAnchor),
            categoriesCV.rightAnchor.constraint(equalTo: view.rightAnchor),
            categoriesCV.heightAnchor.constraint(equalToConstant: 160),
            
            
            popularRestaurentsLabel.topAnchor.constraint(equalTo: categoriesCV.bottomAnchor,constant: 30),
            popularRestaurentsLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 15),
            popularRestaurentsLabel.widthAnchor.constraint(equalToConstant: view.frame.width * 0.5),
            
            viewAllPopular.topAnchor.constraint(equalTo: popularRestaurentsLabel.topAnchor),
            viewAllPopular.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
            viewAllPopular.widthAnchor.constraint(equalToConstant: 50),
            
            
            restaurentTable.topAnchor.constraint(equalTo: popularRestaurentsLabel.bottomAnchor,constant: 30),
            restaurentTable.leftAnchor.constraint(equalTo: categoriesCV.leftAnchor),
            restaurentTable.rightAnchor.constraint(equalTo: categoriesCV.rightAnchor),
            restaurentTable.heightAnchor.constraint(equalToConstant: view.frame.height * 1.05),
             

            mostPopularRestaurentsLabel.topAnchor.constraint(equalTo: restaurentTable.bottomAnchor,constant: 30),
            mostPopularRestaurentsLabel.leftAnchor.constraint(equalTo: restaurentTable.leftAnchor,constant: 15),
            mostPopularRestaurentsLabel.widthAnchor.constraint(equalToConstant: view.frame.width * 0.5),
            
            viewAllMostPopular.topAnchor.constraint(equalTo: mostPopularRestaurentsLabel.topAnchor),
            viewAllMostPopular.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
            viewAllMostPopular.widthAnchor.constraint(equalToConstant: 50),
            
            
            mostPopularRestaurantCV.topAnchor.constraint(equalTo: mostPopularRestaurentsLabel.bottomAnchor,constant: 30),
            mostPopularRestaurantCV.leftAnchor.constraint(equalTo: mostPopularRestaurentsLabel.leftAnchor , constant: -15),
            mostPopularRestaurantCV.heightAnchor.constraint(equalToConstant: 300),
            mostPopularRestaurantCV.widthAnchor.constraint(equalToConstant: Constants.deviceWidth),
            
            
            recentItemsLabel.topAnchor.constraint(equalTo: mostPopularRestaurantCV.bottomAnchor,constant: 30),
            recentItemsLabel.leftAnchor.constraint(equalTo: mostPopularRestaurantCV.leftAnchor,constant: 15),
            recentItemsLabel.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8),
            
            viewAllRecentItems.topAnchor.constraint(equalTo: recentItemsLabel.topAnchor),
            viewAllRecentItems.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
            viewAllRecentItems.widthAnchor.constraint(equalToConstant: 50),
            
            recentItemsTableView.topAnchor.constraint(equalTo: recentItemsLabel.bottomAnchor,constant: 30),
            recentItemsTableView.leftAnchor.constraint(equalTo: recentItemsLabel.leftAnchor,constant: -15),
            recentItemsTableView.widthAnchor.constraint(equalToConstant: view.frame.width),
            recentItemsTableView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.6),
        ])
    }
    
}

extension HomeVC : UICollectionViewDelegate , UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return viewModel.categorys.count
        }else if collectionView.tag == 2 {
            return viewModel.restaurantsForCV.count
        }else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView.tag == 1 {
            
            let category = viewModel.categorys[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCVC", for: indexPath) as! CategoryCVC
            cell.configure(with: category)
            
            return cell
        }
        
        else if collectionView.tag == 2 {
            let restaurant = viewModel.restaurantsForCV[indexPath.row]
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "restaurantCVC", for: indexPath) as! RestaurantCVC
            cell.configure(with: restaurant)
            return cell
        }
        else {
            return UICollectionViewCell()
        }
    }
    
    
    
    func configureCategoriesCollection(){
        categoriesCV.dataSource = self
        categoriesCV.delegate = self
        categoriesCV.register(CategoryCVC.self, forCellWithReuseIdentifier: "categoryCVC")
    }
    
    
    func configureMostPopularRestaurantsCollection(){
        mostPopularRestaurantCV.register(RestaurantCVC.self, forCellWithReuseIdentifier: "restaurantCVC")
        mostPopularRestaurantCV.delegate = self
        mostPopularRestaurantCV.dataSource = self
    }
}


extension HomeVC : HomeDelegate {
    
    func updateCategorysCV() {
        
        DispatchQueue.main.async {
            self.categoriesCV.contentSize = CGSize(width: 800, height: self.categoriesCV.frame.height)
            self.categoriesCV.reloadData()
        }
    }
    
    func presentAlert(err: Error) {
        let alert = UIAlertController(title: "Hata!", message: err.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "TAMAM", style: .cancel))
        present(alert, animated: true)
    }
    
    @objc
    func viewAllButtonClicked(_ sender : Any){
        if (sender as AnyObject).tag == 502 {
            let popularRestaurantsVC = PopularRestaurantsVC()
            self.navigationController?.pushViewController(popularRestaurantsVC, animated: true)
        }else if (sender as AnyObject).tag == 501 {
            let mostPopularVC = MostPopularRestaurantsVC()
            self.navigationController?.pushViewController(mostPopularVC, animated: true)
        }else if (sender as AnyObject).tag == 503 {
            let recentRestaurantVC = RecentRestaurantVC()
            self.navigationController?.pushViewController(recentRestaurantVC, animated: true)
        }
    }
}

extension HomeVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView.tag == 201 {
            return viewModel.restaurents.count
        }
        else {
            return viewModel.recentRestaurants.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView.tag == 201 {
            
            let restaurent = viewModel.restaurents[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "restaurentTVC", for: indexPath) as! RestaurentTVC
            cell.configure(with: restaurent)
            return cell
            
        }else  {
            let restaurent = viewModel.recentRestaurants[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "recentResturantTVC", for: indexPath) as! RecentRestaurantTVC
            cell.configure(with: restaurent)
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView.tag == 201 {
            return view.frame.height * 0.35
        }
        else {
            return view.frame.height * 0.2
        }
    }
}
