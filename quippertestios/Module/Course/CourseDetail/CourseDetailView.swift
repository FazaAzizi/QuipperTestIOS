// 
//  CourseDetailView.swift
//  quippertestios
//
//  Created by Faza Azizi on 23/05/24.
//

import UIKit
import AVKit
import AVFoundation

class CourseDetailView: UIViewController {
    
    @IBOutlet weak var arrowBackImgView: UIImageView!
    @IBOutlet weak var videoContentView: UIView!
    @IBOutlet weak var tumbnailImgView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var presenterLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    
    var presenter: CourseDetailPresenter?
    var player: AVPlayer!
    var avpController = AVPlayerViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupBody()
    }
}

extension CourseDetailView {
    private func setupBody() {
        setupView()
        setupAction()
    }
    
    private func setupView() {
        guard let presenter,
              let courseData = presenter.courseData
        else {return}
        
        tumbnailImgView.loadImageUrl(courseData.thumbnailURL)
        titleLbl.text = courseData.title
        descLbl.text = courseData.description
        presenterLbl.text = courseData.presenterName
        durationLbl.text = "Duration = \(courseData.videoDuration.convertSecondsToTimeString())"
        
        guard let urlVideo = URL(string: courseData.videoURL) else {return}
        player = AVPlayer(url: urlVideo)
        avpController.player = player
        avpController.view.frame = videoContentView.frame
        self.videoContentView.addSubview(avpController.view)
        player.play()
    }
    
    private func setupAction() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(arrowBackTapped))
        arrowBackImgView.isUserInteractionEnabled = true
        arrowBackImgView.addGestureRecognizer(tapGestureRecognizer)
    }
}

extension CourseDetailView {
    @objc func arrowBackTapped() {
        guard let presenter,
              let navigation = self.navigationController
        else {return}
        
        presenter.goBackToList(nav: navigation)
    }
}

