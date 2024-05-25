// 
//  CourseListInteractor.swift
//  quippertestios
//
//  Created by Faza Azizi on 23/05/24.
//

import Foundation
import Combine

class CourseListInteractor {
    open var api = ApiManager()

    func getCourseList() -> AnyPublisher<[CourseEntity], Error> {
        return api.requestApiPublisher(.list)
    }
}
