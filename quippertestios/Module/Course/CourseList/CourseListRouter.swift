// 
//  CourseListRouter.swift
//  quippertestios
//
//  Created by Faza Azizi on 23/05/24.
//

import UIKit

class CourseListRouter {
    
    func showView() -> CourseListView {
        let interactor = CourseListInteractor()
        let presenter = CourseListPresenter(interactor: interactor)
        let view = CourseListView(nibName: String(describing: CourseListView.self), bundle: nil)
        view.presenter = presenter
        return view
    }
    
    func goToDetail(courseData: CourseEntity, nav: UINavigationController) {
        let vc = CourseDetailRouter().showView(courseData: courseData)
        nav.pushViewController(vc, animated: true)
    }
}
