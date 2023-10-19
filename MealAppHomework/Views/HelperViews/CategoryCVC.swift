//
//  CategoryCVC.swift
//  MealAppHomework
//
//  Created by Macbook Air on 15.10.2023.
//

import UIKit
import Kingfisher


class CategoryCVC: UICollectionViewCell {
    
    private lazy var categoryImage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        return image
    }()
    
    private lazy var categoryLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame : CGRect) {
        super.init(frame: frame)

        addCellComponents()
        setCellConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addCellComponents(){
        contentView.addSubviews([categoryImage,categoryLabel])
    }
    
    func configure(with category : Category) {
        
        DispatchQueue.main.async {
            self.categoryImage.kf.setImage(with: URL(string: category.strCategoryThumb))
            self.categoryLabel.text = category.strCategory
        }
    }
    

    func setCellConstraints(){
        NSLayoutConstraint.activate([
            categoryImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            categoryImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            categoryImage.heightAnchor.constraint(equalToConstant: contentView.frame.height * 0.7),
            
            
            categoryLabel.topAnchor.constraint(equalTo: categoryImage.bottomAnchor,constant: 10),
            categoryLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            categoryLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
    }
    
    
}
