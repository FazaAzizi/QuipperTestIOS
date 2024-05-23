//
//  CourseListView.swift
//  quippertestios
//
//  Created by Faza Azizi on 23/05/24.
//

import UIKit
import Combine
import Foundation

class CourseListView: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var courseTableView: UITableView!
    
    var presenter: CourseListPresenter?
    var anyCancellable = Set<AnyCancellable>()
    var courseList: [CourseEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBody()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

extension CourseListView {
    private func setupBody() {
        presenter?.fetchCourseList()
        setupView()
        bindingData()
        setupTableView()
        self.courseTableView.reloadData()
    }
    
    private func setupView() {
        searchView.layer.shadowColor = UIColor.black.cgColor
        searchView.layer.cornerRadius = 20
        searchView.layer.borderColor = UIColor.systemGray6.cgColor
        searchView.layer.borderWidth = 1
    }
    
    private func setupTableView() {
        self.courseTableView.dataSource = self
        self.courseTableView.delegate = self
        self.courseTableView.register(CourseListTVC.nib, forCellReuseIdentifier: CourseListTVC.identifier)
    }
    
    private func bindingData() {
        guard let presenter = self.presenter else { return }
        presenter.$courseList
            .sink { [weak self] data in
                guard let self else { return }
                self.courseList = data
                self.courseTableView.reloadData()
            }
            .store(in: &anyCancellable)
    }
}

extension CourseListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseListTVC.identifier, for: indexPath) as? CourseListTVC
        else {
            return UITableViewCell()
        }
        
        cell.configure(data: courseList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let navigation = self.navigationController,
              let presenter
        else {return}
        
        let data = courseList[indexPath.row]
        presenter.goToDetail(courseData: data, nav: navigation)
    }
}
