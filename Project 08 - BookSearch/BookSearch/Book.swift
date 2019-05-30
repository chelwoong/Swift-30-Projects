//
//  Book.swift
//  BookSearch
//
//  Created by woong on 24/05/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class Book {
    
    var bookImage: UIImage?
    var title: String
    var author: String
    var date: String
    var category: String?
    
    init(bookTitle title: String, author: String, date: String, bookImageName: String?, category: String?) {
        self.title = title
        self.author = author
        self.date = date
        if let imageName = bookImageName, let image = UIImage(named: imageName) {
            self.bookImage = image
        }
        self.category = category
    }
}
