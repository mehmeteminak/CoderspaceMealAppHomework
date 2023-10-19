//
//  RecentRestaurantTVC.swift
//  MealAppHomework
//
//  Created by Macbook Air on 17.10.2023.
//

import UIKit

class RecentRestaurantTVC: UITableViewCell {
    
    private var restaurantImage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.borderWidth = 1
        image.layer.cornerRadius = 20
        image.layer.borderColor = UIColor.clear.cgColor
        image.layer.masksToBounds = true
        return image
    }()

    private var restaurantName : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16,weight: .bold)
        return label
    }()
    
    private var restaurantType : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var restaurantFoodType : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private var restaurantRating : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .orange
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addComponents()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addComponents(){
        contentView.addSubviews([restaurantImage,restaurantName,restaurantType,restaurantRating,restaurantFoodType])
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            restaurantImage.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 15),
            restaurantImage.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 15),
            restaurantImage.widthAnchor.constraint(equalToConstant: contentView.frame.width * 0.5),
            restaurantImage.heightAnchor.constraint(equalToConstant: contentView.frame.height * 3),

            restaurantName.topAnchor.constraint(equalTo: restaurantImage.topAnchor,constant: 30),
            restaurantName.leftAnchor.constraint(equalTo: restaurantImage.rightAnchor,constant: 20),
            restaurantName.widthAnchor.constraint(equalToConstant: contentView.frame.width * 0.7),
            
            restaurantRating.topAnchor.constraint(equalTo: restaurantType.bottomAnchor,constant: 8),
            restaurantRating.leftAnchor.constraint(equalTo: restaurantType.leftAnchor),
            restaurantRating.widthAnchor.constraint(equalToConstant: contentView.frame.width * 0.3),
            
            restaurantType.topAnchor.constraint(equalTo: restaurantName.bottomAnchor,constant: 20),
            restaurantType.leftAnchor.constraint(equalTo: restaurantName.leftAnchor),
            restaurantType.widthAnchor.constraint(equalToConstant: contentView.frame.width * 0.15),
            
            restaurantFoodType.topAnchor.constraint(equalTo: restaurantType.centerYAnchor,constant: -3),
            restaurantFoodType.leftAnchor.constraint(equalTo: restaurantType.rightAnchor),
            restaurantFoodType.widthAnchor.constraint(equalToConstant: contentView.frame.width * 0.4),
        ])
    }
    
    func configure(with restaurant : Restaurent) {
        
        let attrString = NSMutableAttributedString(string: "\(restaurant.restaurentType!)  ",attributes: [.foregroundColor : UIColor.lightGray,.font : UIFont.systemFont(ofSize: 12,weight: .medium)])
        
        let dotString = NSAttributedString(string: ".",attributes: [.baselineOffset : 3,.foregroundColor : UIColor.orange])
        
        attrString.append(dotString)
        
        restaurantImage.image = UIImage(named: restaurant.restaurentImagePath!)
        restaurantName.text = restaurant.restaurentName
        restaurantType.attributedText = attrString
        restaurantFoodType.text = restaurant.restaurentPopularFoodCategory
        restaurantRating.text = "⭐ \(restaurant.restaurentRating!)"
    }
    
}
