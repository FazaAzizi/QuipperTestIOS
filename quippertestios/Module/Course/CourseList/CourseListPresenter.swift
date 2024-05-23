// 
//  CourseListPresenter.swift
//  quippertestios
//
//  Created by Faza Azizi on 23/05/24.
//

import Foundation
import Combine
import UIKit

class CourseListPresenter {
    
    private let interactor: CourseListInteractor
    private let router = CourseListRouter()
    var anyCancellable = Set<AnyCancellable>()
    @Published public var errorMessage: String = ""
    @Published public var isLoading: Bool = false
    @Published public var isError: Bool = false

    @Published public var courseList: [CourseEntity] = []
    
    init(interactor: CourseListInteractor) {
        self.interactor = interactor
    }
    
    func fetchCourseList() {
        interactor.getCourseList()
            .eraseToAnyPublisher()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.isLoading = false
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.isError = true
                    self.isLoading = false
                }
            }, receiveValue: { courseData in
                DispatchQueue.main.async {
                    print("success")
                    print(courseData)
                    self.courseList = courseData
                }
            })
            .store(in: &anyCancellable)
    }
    
    func goToDetail(courseData: CourseEntity, nav: UINavigationController) {
        self.router.goToDetail(courseData: courseData, nav: nav)
    }
}
