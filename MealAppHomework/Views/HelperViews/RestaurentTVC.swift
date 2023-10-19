//
//  RestaurentTVC.swift
//  MealAppHomework
//
//  Created by Macbook Air on 16.10.2023.
//

import UIKit

class RestaurentTVC: UITableViewCell {

    private var restaurentImage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var restaurentName : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16,weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var restaurentRating : UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var restaurentType : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var restaurentPopularFoodCategory : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addRowComponents()
        setConstaints()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addRowComponents(){
        contentView.addSubviews([restaurentImage,restaurentName,restaurentRating,restaurentType,restaurentPopularFoodCategory])
    }
    
    func setConstaints(){
        NSLayoutConstraint.activate([
            restaurentImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            restaurentImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            restaurentImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            restaurentImage.heightAnchor.constraint(equalToConstant: contentView.frame.height * 5),

            
            restaurentName.topAnchor.constraint(equalTo: restaurentImage.bottomAnchor,constant: 20),
            restaurentName.leftAnchor.constraint(equalTo: contentView.leftAnchor , constant: 25),
            restaurentName.widthAnchor.constraint(equalToConstant: contentView.frame.width * 0.6),
            
            
            restaurentRating.topAnchor.constraint(equalTo: restaurentName.bottomAnchor,constant: 5),
            restaurentRating.leftAnchor.constraint(equalTo: restaurentName.leftAnchor),
            restaurentRating.widthAnchor.constraint(equalToConstant: 50),
            
            restaurentType.topAnchor.constraint(equalTo: restaurentRating.topAnchor),
            restaurentType.leftAnchor.constraint(equalTo: restaurentRating.rightAnchor,constant: 15),
            restaurentType.widthAnchor.constraint(equalToConstant: 40),
            
            restaurentPopularFoodCategory.topAnchor.constraint(equalTo: restaurentType.topAnchor),
            restaurentPopularFoodCategory.leftAnchor.constraint(equalTo: restaurentType.rightAnchor,constant: 15),
            restaurentPopularFoodCategory.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    func configure(with restaurent : Restaurent) {
        
        
            self.restaurentImage.image = UIImage(named: restaurent.restaurentImagePath!)
            self.restaurentPopularFoodCategory.text = restaurent.restaurentPopularFoodCategory!
            self.restaurentRating.text = "⭐ \(restaurent.restaurentRating!)"
            self.restaurentType.text = restaurent.restaurentType!
            self.restaurentName.text = restaurent.restaurentName!
        
        
        
        
    }

}
