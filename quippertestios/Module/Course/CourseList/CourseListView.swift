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
    @IBOutlet weak var notFoundLbl: UILabel!
    @IBOutlet weak var courseTableView: UITableView!
    
    var presenter: CourseListPresenter?
    var anyCancellable = Set<AnyCancellable>()
    var courseList: [CourseEntity] = []
    var filteredCourseList: [CourseEntity] = []
    
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
        searchView.layer.borderColor = UIColor.systemGray4.cgColor
        searchView.layer.borderWidth = 1
        
        searchTextField.delegate = self
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
                self.filteredCourseList = data
                self.courseTableView.reloadData()
            }
            .store(in: &anyCancellable)
    }
}

extension CourseListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCourseList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseListTVC.identifier, for: indexPath) as? CourseListTVC
        else {
            return UITableViewCell()
        }
        
        cell.configure(data: filteredCourseList[indexPath.row])
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

extension CourseListView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let searchText = textField.text, !searchText.isEmpty else {
            notFoundLbl.isHidden = true
            filteredCourseList = courseList
            courseTableView.reloadData()
            return
        }

        filteredCourseList = courseList.filter { course in
            course.title.lowercased().contains(searchText.lowercased()) ||
            course.presenterName.lowercased().contains(searchText.lowercased())

        }
        
        notFoundLbl.isHidden = filteredCourseList.count != 0 ? true : false
        
        
        courseTableView.reloadData()
    }
}
