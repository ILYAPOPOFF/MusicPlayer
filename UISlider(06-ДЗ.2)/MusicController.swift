//
//  MusicController.swift
//  UISlider(06-ДЗ.2)
//
//  Created by ILYA POPOV on 31.10.2022.
//

import UIKit
import AVFoundation

class MusicController: UIViewController {
    
    var position : Int = 0
    public var music: Music?
    var musics: [Music] = []
    var player = AVAudioPlayer()
    
    var holder = UIView()
    
    //MARK: - UI all elements
    //label "Playing from album"
    var playingFromAlbum : UILabel = {
        var label = UILabel()
        label.text = "Playing from album"
        label.frame = CGRect(x: 0, y: 0, width: 118, height: 17)
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.6571641564, green: 0.6571640372, blue: 0.6571640372, alpha: 1)
        return label
    }()
    
    //label "Heading Home"
    var headingHome : UILabel = {
       var label = UILabel()
        label.text = "Heading Home"
        label.frame = CGRect(x: 0, y: 0, width: 96, height: 17)
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    //icon "Chevron botton"
    var closeView : UIButton = {
        var name = UIButton()
        let normalImage = UIImage(named: "chevron.botton")
        name.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        name.setBackgroundImage(normalImage, for: .normal)
        name.addTarget(self, action: #selector(closeViewMusic), for: .touchUpInside)
        name.alpha = 0.7
        return name
    }()
    
    //icon "Share button"
    var shareMusic : UIButton = {
        var name = UIButton()
        let normalImage = UIImage(named: "share")
        name.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        name.setBackgroundImage(normalImage, for: .normal)
        name.alpha = 0.7
        name.addTarget(self, action: #selector(myShare(sender:)), for: .touchUpInside)
        return name
    }()
    
    //main image
    var myImageMusic : UIImageView = {
        var main = UIImageView()
        main.layer.cornerRadius = 24
        main.clipsToBounds = true
        main.frame = CGRect(x: 0, y: 0, width: 285, height: 285)
        return main
    }()
    
    //Title - name music
    var titleNameMusic : UILabel = {
        var title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 20)
        title.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return title
    }()
    
    //Title - name Artist
    var titleNameArtist : UILabel = {
        var title = UILabel()
        title.numberOfLines = 1
        title.font = UIFont.systemFont(ofSize: 14)
        title.textColor = #colorLiteral(red: 0.4988793731, green: 0.4988793731, blue: 0.4988793731, alpha: 1)
        return title
    }()
    
    //Button - plus
    var buttonPlusMusic : UIButton = {
        var button = UIButton()
        let normalImage = UIImage(named: "plus")
        button.setBackgroundImage(normalImage, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        button.alpha = 0.7
        return button
    }()
    
    //Button - more
    var buttonMore : UIButton = {
        var button = UIButton()
        let normalImage = UIImage(named: "more")
        button.setBackgroundImage(normalImage, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        button.alpha = 0.7
        return button
    }()
    
    //Slider
    var sliderMusic : UISlider = {
        var slider = UISlider()
        slider.frame = CGRect(x: 0, y: 0, width: 320, height: 20)
        slider.thumbTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        slider.tintColor = #colorLiteral(red: 0.4950980392, green: 0.5, blue: 0.5, alpha: 1)
        slider.minimumValue = 0.0
        return slider
    }()
    
    //Button - Play
    var buttonPlay : UIButton = {
        var button = UIButton()
        let normalImage = UIImage(named: "play")
        button.setBackgroundImage(normalImage, for: .normal)
        button.alpha = 0.7
        return button
    }()
    
    //Button - backward
    var buttonBackward : UIButton = {
        var button = UIButton()
        let normalImage = UIImage(named: "backward")
        button.setBackgroundImage(normalImage, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        button.alpha = 0.7
        button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        return button
    }()
    
    //Button - forward
    var buttonForward : UIButton = {
        var button = UIButton()
        let normalImage = UIImage(named: "forward")
        button.setBackgroundImage(normalImage, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        button.alpha = 0.7
        button.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        return button
    }()
    
    //Button - Pause
    var buttonPause : UIButton = {
        var button = UIButton()
        let normalImage = UIImage(named: "pause")
        button.setBackgroundImage(normalImage, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        button.alpha = 0.7
        button.addTarget(self, action: #selector(didTapPlayButton), for: .touchUpInside)
        return button
    }()
    
    //Time - Now Music
    var timeNow : UILabel = {
        var time = UILabel()
        time.font = UIFont.systemFont(ofSize: 14)
        time.frame = CGRect(x: 0, y: 0, width: 35, height: 17)
        time.textColor = #colorLiteral(red: 0.4980392157, green: 0.4980392157, blue: 0.4980392157, alpha: 1)
        return time
    }()
    
    // Time - left Music
    var timeLeft : UILabel = {
        var time = UILabel()
        time.font = UIFont.systemFont(ofSize: 14)
        time.frame = CGRect(x: 0, y: 0, width: 35, height: 17)
        time.textColor = #colorLiteral(red: 0.4980392157, green: 0.4980392157, blue: 0.4980392157, alpha: 1)
        return time
    }()
    
    var activityViewController : UIActivityViewController? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
 
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(trackAudio), userInfo: nil, repeats: true)
        self.sliderMusic.addTarget(self, action: #selector(changeSlider(sender:)), for: .valueChanged)
        
        view.addSubview(titleNameArtist)
        view.addSubview(myImageMusic)
        view.addSubview(closeView)
        view.addSubview(playingFromAlbum)
        view.addSubview(headingHome)
        view.addSubview(shareMusic)
        view.addSubview(titleNameMusic)
        view.addSubview(buttonPlusMusic)
        view.addSubview(buttonMore)
        view.addSubview(sliderMusic)
        view.addSubview(buttonPlay)
        view.addSubview(buttonBackward)
        view.addSubview(buttonForward)
        view.addSubview(buttonPause)
        view.addSubview(timeNow)
        view.addSubview(timeLeft)
        
        
        setCloseViewConstraints()
        setPlayingFromAlbumConstraints()
        setHeadinfHomeConstraints()
        setShareMusicConstraints()
        setMainImageConstarints()
        setTitleNameMusicConstartaints()
        setTitleNameArtistConstraints()
        setButtonPlusMusicConstraints()
        setButtonMoreConstraints()
        setSliderMusicConstraints()
        setButtonPauseConstraints()
        setButtonBackwardConstraints()
        setButtonForwardConstraints()
        setTimeNowConstraints()
        setTimeLeftConstraints()
        countMusic()
        configure()
        
    }
    
    //MARK: - Func
    
    @objc func trackAudio() {
        self.sliderMusic.value = Float(player.currentTime)
        self.timeNow.text = timePoint()
        self.timeLeft.text = minusTimePoint()
        self.sliderMusic.minimumValue = 0.0
        self.sliderMusic.maximumValue = Float(player.duration)
    }
    
    func timePoint() -> String {
        let temp: Int = Int(player.currentTime + 0.5)
        let mins: Int = temp / 60
        let secs: Int = temp % 60
        return String(format: "%02d:%02d", mins, secs)
    }
    
    func minusTimePoint() -> String {
        let temp: Int = Int(player.currentTime - player.duration + 0.5)
        let mins: Int = temp / 60
        let secs: Int = temp % 60
        return String(format: "%02d:%02d", mins, -secs)
    }
    
    @objc func changeSlider(sender: UISlider) {
        if sender == sliderMusic {
            player.currentTime = TimeInterval(sender.value)
        }
    }
    
    @objc func myShare(sender: Any) {
        self.activityViewController = UIActivityViewController(activityItems: [titleNameMusic], applicationActivities: nil)
        self.present(self.activityViewController!, animated: true)
    }
  
    func countMusic() {
        myImageMusic.image = music?.image
        titleNameMusic.text = music?.artist
        titleNameArtist.text = music?.name
    }
    
    @objc func didTapBackButton() {
        position += 1
        if position >= (music?.play.count)! {
            position = 0
        }
        configure()
    }
    
    @objc func didTapNextButton(_ sender: UIButton) {
        if position < (musics.count - 1) {
            position = position + 1
            player.stop()
            for subview in holder.subviews {
                subview.removeFromSuperview()
            }
        }
    }
    
    @objc func didTapPlayButton() {
        if player.isPlaying == true {
            player.pause()
            buttonPause.setBackgroundImage(UIImage(named: "play"), for: .normal)
        } else {
            player.play()
            buttonPause.setBackgroundImage(UIImage(named: "pause"), for: .normal)
        }
    }

    
    @objc func closeViewMusic(sender: UIButton) {
        self.dismiss(animated: true)
        self.player.stop()
    }
    
    func configure() {
        do {
            if let audioPath = Bundle.main.path(forResource: music?.play, ofType: "mp3") {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            }
        } catch  {
            print("Error")
        }
        self.player.play()
    }
    
    //MARK: - AutoLayout
    func setCloseViewConstraints() {
        closeView.translatesAutoresizingMaskIntoConstraints = false
        closeView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        closeView.topAnchor.constraint(equalTo: view.topAnchor, constant: 24).isActive = true
    }
    
    func setPlayingFromAlbumConstraints() {
        playingFromAlbum.translatesAutoresizingMaskIntoConstraints = false
        playingFromAlbum.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        playingFromAlbum.topAnchor.constraint(equalTo: view.topAnchor, constant: 12).isActive = true
    }
    
    func setHeadinfHomeConstraints() {
        headingHome.translatesAutoresizingMaskIntoConstraints = false
        headingHome.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        headingHome.heightAnchor.constraint(equalToConstant: 17).isActive = true
        headingHome.topAnchor.constraint(equalTo: playingFromAlbum.topAnchor, constant: 20).isActive = true
    }
    
    func setShareMusicConstraints() {
        shareMusic.translatesAutoresizingMaskIntoConstraints = false
        shareMusic.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        shareMusic.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
    }
   
    func setMainImageConstarints() {
        myImageMusic.translatesAutoresizingMaskIntoConstraints = false
        myImageMusic.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myImageMusic.topAnchor.constraint(equalTo: headingHome.topAnchor, constant: 64).isActive = true
        myImageMusic.widthAnchor.constraint(equalToConstant: 320).isActive = true
        myImageMusic.heightAnchor.constraint(equalToConstant: 320).isActive = true
    }
    
    func setTitleNameMusicConstartaints() {
        titleNameMusic.translatesAutoresizingMaskIntoConstraints = false
        titleNameMusic.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleNameMusic.bottomAnchor.constraint(equalTo: myImageMusic.bottomAnchor, constant: 58).isActive = true
    }
    
    func setTitleNameArtistConstraints() {
        titleNameArtist.translatesAutoresizingMaskIntoConstraints = false
        titleNameArtist.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleNameArtist.bottomAnchor.constraint(equalTo: titleNameMusic.bottomAnchor, constant: 22).isActive = true
    }
    
    func setButtonPlusMusicConstraints() {
        buttonPlusMusic.translatesAutoresizingMaskIntoConstraints = false
        buttonPlusMusic.centerYAnchor.constraint(equalTo: titleNameMusic.centerYAnchor).isActive = true
        buttonPlusMusic.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
    }
    
    func setButtonMoreConstraints() {
        buttonMore.translatesAutoresizingMaskIntoConstraints = false
        buttonMore.centerYAnchor.constraint(equalTo: titleNameMusic.centerYAnchor).isActive = true
        buttonMore.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
    }
    
    func setSliderMusicConstraints() {
        sliderMusic.translatesAutoresizingMaskIntoConstraints = false
        sliderMusic.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        sliderMusic.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        sliderMusic.topAnchor.constraint(equalTo: titleNameArtist.topAnchor, constant: 68).isActive = true
        //sliderMusic.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 20).isActive = true
    }
    
    func setButtonPauseConstraints() {
        buttonPause.translatesAutoresizingMaskIntoConstraints = false
        buttonPause.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonPause.bottomAnchor.constraint(equalTo: sliderMusic.bottomAnchor, constant: 100).isActive = true
        buttonPause.widthAnchor.constraint(equalToConstant: 40).isActive = true
        buttonPause.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setButtonBackwardConstraints() {
        buttonBackward.translatesAutoresizingMaskIntoConstraints = false
        buttonBackward.centerYAnchor.constraint(equalTo: buttonPause.centerYAnchor).isActive = true
        buttonBackward.rightAnchor.constraint(equalTo: buttonPause.rightAnchor, constant: -96).isActive = true
        buttonBackward.widthAnchor.constraint(equalToConstant: 36).isActive = true
        buttonBackward.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    func setButtonForwardConstraints() {
        buttonForward.translatesAutoresizingMaskIntoConstraints = false
        buttonForward.centerYAnchor.constraint(equalTo: buttonPause.centerYAnchor).isActive = true
        buttonForward.rightAnchor.constraint(equalTo: buttonPause.rightAnchor, constant: 96).isActive = true
        buttonForward.widthAnchor.constraint(equalToConstant: 36).isActive = true
        buttonForward.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    func setTimeNowConstraints() {
        timeNow.translatesAutoresizingMaskIntoConstraints = false
        timeNow.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        timeNow.bottomAnchor.constraint(equalTo: sliderMusic.bottomAnchor, constant: 10).isActive = true
    }
    
    func setTimeLeftConstraints() {
        timeLeft.translatesAutoresizingMaskIntoConstraints = false
        timeLeft.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        timeLeft.bottomAnchor.constraint(equalTo: sliderMusic.bottomAnchor, constant: 10).isActive = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
            player.stop()
    }
}



