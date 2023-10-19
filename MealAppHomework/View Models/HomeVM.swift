//
//  Network.swift
//  MealAppHomework
//
//  Created by Macbook Air on 15.10.2023.
//

import Foundation


protocol HomeDelegate : AnyObject {
    func updateCategorysCV()
    func presentAlert(err : Error)
}


class HomeVM {
    weak var delegate : HomeDelegate?
    
    var categorys : [Category] = []
    var restaurents : [Restaurent] = [
        Restaurent(restaurentImagePath: "cafe1",restaurentName: "Minute by tuk tuk",restaurentRating: 4.9,restaurentType: "Cafe",restaurentPopularFoodCategory: "Western Food"),
        Restaurent(restaurentImagePath: "cafe2",restaurentName: "Cafe de Noir",restaurentRating: 4.9,restaurentType: "Cafe",restaurentPopularFoodCategory: "Western Food"),
        Restaurent(restaurentImagePath: "cafe3",restaurentName: "Bakes by Tella",restaurentRating: 4.9,restaurentType: "Cafe",restaurentPopularFoodCategory: "Western Food"),
    ]
    
    var restaurantsForCV : [Restaurent] = [
        Restaurent(restaurentImagePath: "cafe4", restaurentName: "Cafe de Bambaa", restaurentRating: 4.9, restaurentType: "Cafe", restaurentPopularFoodCategory: "Western Food"),
        Restaurent(restaurentImagePath: "cafe5", restaurentName: "Cafe de Zaragoza", restaurentRating: 4.9, restaurentType: "Cafe", restaurentPopularFoodCategory: "Western Food"),
        Restaurent(restaurentImagePath: "cafe6", restaurentName: "Cafe de Berlin", restaurentRating: 4.9, restaurentType: "Cafe", restaurentPopularFoodCategory: "Western Food"),
        Restaurent(restaurentImagePath: "cafe7", restaurentName: "Cafe de Loure", restaurentRating: 4.9, restaurentType: "Cafe", restaurentPopularFoodCategory: "Western Food"),
        Restaurent(restaurentImagePath: "cafe8", restaurentName: "Cafe de Berlin", restaurentRating: 4.9, restaurentType: "Cafe", restaurentPopularFoodCategory: "Western Food")
    ]
    
    var recentRestaurants : [Restaurent] = [
        Restaurent(restaurentImagePath: "cafe9", restaurentName: "Mulberry Pizza by Josh", restaurentRating: 4.9, restaurentType: "Cafe", restaurentPopularFoodCategory: "Western Food"),
        Restaurent(restaurentImagePath: "cafe10", restaurentName: "Barita", restaurentRating: 4.9, restaurentType: "Cafe", restaurentPopularFoodCategory: "Western Food"),
        Restaurent(restaurentImagePath: "cafe11", restaurentName: "Pizza Rush Hour", restaurentRating: 4.9, restaurentType: "Cafe", restaurentPopularFoodCategory: "Western Food")
    ]
    
    func fetchCategorys(){
        
        let baseUrl = Constants.API_BASE_URL
        
        let urlString = baseUrl + "categories.php"
        let request = URLRequest(url: URL(string: urlString)!)
        
        Network.request(request: request, expectedType: AllCategorys.self) { result in
            switch result {
            case .success(let success):
                self.categorys = success.categories
                self.delegate?.updateCategorysCV()
                
                
            case .failure(let failure):
                self.delegate?.presentAlert(err: failure)
            }
        }
    }
}
