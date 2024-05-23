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
    
    //Navigate to other xib-based router
    /*
    func navigateToOtherView(from navigation: UINavigationController, with data: Any) {
        let otherView = OtherViewRouter().showView(with: data)
        navigation.pushViewController(otherView, animated: true)
    }
    */
    
    //Navigate to other storyboard-based router
    /*
    func navigateToOtherView(from navigation: UINavigationController, with data: Any) {
        let otherView = OtherViewRouter().showView(with: data)
        navigation.pushViewController(otherView, animated: true)
    }
     */
    
}
