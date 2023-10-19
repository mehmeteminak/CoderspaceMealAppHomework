//
//  ViewController.swift
//  MealAppHomework
//
//  Created by Macbook Air on 15.10.2023.
//

import UIKit

class HomeVC : UIViewController {
    
    lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: view.frame.width, height: 2300)
        return scrollView
        
    }()
    

    let greetingLabel : UILabel = {
        let label = UILabel()
        let greetingString = "Good morning Akila!"
        
        let attr : [NSAttributedString.Key : Any ] = [
            .font : UIFont.systemFont(ofSize: 18, weight: .bold),
            .strokeColor : UIColor.black
        ]
        

        label.attributedText = NSAttributedString(string: greetingString,attributes: attr)
        return label
    }()
    
    var deliveringLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        var firstLine = NSAttributedString(string: "Delivering to",attributes: [
            .font : UIFont.systemFont(ofSize: 14, weight: .medium),
            .foregroundColor : UIColor.lightGray
        ])
        
        label.attributedText = firstLine
        return label
    }()
    
    lazy var deliverLocationLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        let mutableString = NSMutableAttributedString(string: "Current Location  ", attributes: [
            .font : UIFont.systemFont(ofSize: 16, weight: .semibold),
            .foregroundColor : UIColor.lightGray
        ])
        

        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named : "arrow-down")
        imageAttachment.bounds = CGRect(x: 0, y: -4, width: 15, height: 15)
        
        let dotString = NSAttributedString(attachment: imageAttachment)

        mutableString.append(dotString)
        label.attributedText = mutableString
        
        label.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(currentLocationTouched))
        label.addGestureRecognizer(gesture)
        return label
    }()
    
    var searchBar : UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Search Food"
        searchBar.layer.cornerRadius = 10
        searchBar.tintColor = .white
        searchBar.searchBarStyle = .minimal
        searchBar.layer.masksToBounds = true
        return searchBar
    }()
    
    
    lazy var categoriesCV : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: Constants.deviceWidth * 0.35, height: 150)
        

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.tag = 1
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = true
        collectionView.isUserInteractionEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
        
        return collectionView
    }()
    
    let popularRestaurentsLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Popular Restaurents"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    lazy var viewAllMostPopular : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("View all", for: .normal)
        button.tag = 501
        button.setTitleColor(.orange, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        button.addTarget(self, action: #selector(viewAllButtonClicked(_:)), for: .touchUpInside)
        return button
    }()
    
     lazy var viewAllPopular : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("View all", for: .normal)
         button.tag = 502
        button.setTitleColor(.orange, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        button.addTarget(self, action: #selector(viewAllButtonClicked(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var viewAllRecentItems : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("View all", for: .normal)
        button.tag = 503
        button.setTitleColor(.orange, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        button.addTarget(self, action: #selector(viewAllButtonClicked(_:)), for: .touchUpInside)
        return button
    }()
    
    
    var restaurentTable : UITableView = {
        let table = UITableView()
        table.tag = 201
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        table.register(RestaurentTVC.self, forCellReuseIdentifier: "restaurentTVC")
        return table
    }()
    
    let mostPopularRestaurentsLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Most Popular"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    lazy var mostPopularRestaurantCV : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: Constants.deviceWidth * 0.5, height: 250)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.tag = 2
        collectionView.backgroundColor = .white
    
        collectionView.isScrollEnabled = true
        collectionView.isUserInteractionEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
        
        return collectionView
    }()
    
    
    let recentItemsLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Recent Items"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
     let recentItemsTableView : UITableView = {
        let tableView = UITableView()
        tableView.tag = 202
         tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RecentRestaurantTVC.self, forCellReuseIdentifier: "recentResturantTVC")
        return tableView
    }()
    
    let viewModel = HomeVM()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialConfig()
        configureCategoriesCollection()
        configureMostPopularRestaurantsCollection()
        viewModel.fetchCategorys()
        
    }
    
    override func viewDidLayoutSubviews() {
        setConstraints()
    }


}

