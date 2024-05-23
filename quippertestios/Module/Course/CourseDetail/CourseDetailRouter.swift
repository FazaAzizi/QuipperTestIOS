// 
//  CourseDetailRouter.swift
//  quippertestios
//
//  Created by Faza Azizi on 23/05/24.
//

import UIKit

class CourseDetailRouter {
    
    func showView(courseData: CourseEntity) -> CourseDetailView {
        let interactor = CourseDetailInteractor()
        let presenter = CourseDetailPresenter(interactor: interactor, courseData: courseData)
        let view = CourseDetailView(nibName: String(describing: CourseDetailView.self), bundle: nil)
        view.presenter = presenter
        return view
    }
    
    func goBackToList(nav: UINavigationController) {
        nav.popViewController(animated: false)
    }
}
