//
//  RestaurantCVC.swift
//  MealAppHomework
//
//  Created by Macbook Air on 16.10.2023.
//

import UIKit

class RestaurantCVC: UICollectionViewCell {
    
    private var restaurantImage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.clear.cgColor
        image.layer.masksToBounds = true
        return image
    }()
    
    private var restaurantName : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16,weight: .bold)
        return label
    }()
    
    private var restaurantType : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12,weight: .medium)
        return label
    }()
    
    private var restaurantFoodType : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12,weight: .medium)
        return label
    }()
    
    private var restaurantRatingLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12,weight: .medium)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addComponents(){
        contentView.addSubviews([restaurantImage,restaurantName,restaurantType,restaurantFoodType,restaurantRatingLabel])
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            restaurantImage.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 15),
            restaurantImage.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 15),
            restaurantImage.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: 15),
            restaurantImage.heightAnchor.constraint(equalToConstant: contentView.frame.height * 0.65),
            restaurantImage.widthAnchor.constraint(equalToConstant: contentView.frame.width * 0.8),

            
            restaurantName.topAnchor.constraint(equalTo: restaurantImage.bottomAnchor , constant: 15),
            restaurantName.leftAnchor.constraint(equalTo: restaurantImage.leftAnchor),
            restaurantName.widthAnchor.constraint(equalToConstant: contentView.frame.height * 0.75),
            
            restaurantType.topAnchor.constraint(equalTo: restaurantName.bottomAnchor,constant: 8),
            restaurantType.leftAnchor.constraint(equalTo: restaurantName.leftAnchor),
            restaurantType.widthAnchor.constraint(equalToConstant: contentView.frame.width * 0.15),
            
            restaurantFoodType.topAnchor.constraint(equalTo: restaurantType.topAnchor),
            restaurantFoodType.leftAnchor.constraint(equalTo: restaurantType.rightAnchor , constant: 10),
            restaurantFoodType.widthAnchor.constraint(equalToConstant: contentView.frame.width * 0.5),
            
            restaurantRatingLabel.topAnchor.constraint(equalTo: restaurantFoodType.topAnchor),
            restaurantRatingLabel.leftAnchor.constraint(equalTo: restaurantFoodType.rightAnchor , constant: 10),
            restaurantRatingLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width * 0.25)
        ])
    }
    
    func configure(with restaurant : Restaurent) {
        
        self.restaurantImage.image = UIImage(named: restaurant.restaurentImagePath!)
        self.restaurantType.text = restaurant.restaurentType
        self.restaurantFoodType.text = restaurant.restaurentPopularFoodCategory
        self.restaurantRatingLabel.text = "⭐ \(restaurant.restaurentRating!)"
        self.restaurantName.text = restaurant.restaurentName
        
    }
    
}
