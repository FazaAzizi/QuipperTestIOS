// 
//  CourseDetailPresenter.swift
//  quippertestios
//
//  Created by Faza Azizi on 23/05/24.
//

import Foundation
import UIKit

class CourseDetailPresenter {
    
    private let interactor: CourseDetailInteractor
    private let router = CourseDetailRouter()
    var courseData: CourseEntity?
    
    init(interactor: CourseDetailInteractor, courseData: CourseEntity) {
        self.interactor = interactor
        self.courseData = courseData
    }
    
    func goBackToList(nav: UINavigationController) {
        router.goBackToList(nav: nav)
    }
    
}
