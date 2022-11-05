//
//  TableViewCell.swift
//  UISlider(06-ДЗ.2)
//
//  Created by ILYA POPOV on 30.10.2022.
//

import UIKit
import AVFoundation

class TableViewCell: UITableViewCell {
    
    var myImageView = UIImageView()
    var nameMusic = UILabel()
    var nameArtist = UILabel()
    var timeMusic = UILabel()
    var addMusic = AVAudioPlayer()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(myImageView)
        addSubview(nameMusic)
        addSubview(nameArtist)
        addSubview(timeMusic)
        
        configureImageView()
        configureNameMusic()
        configureNameArtist()
        configureTimeMusic()
        
        setImageConstraints()
        setNameMusicConstraints()
        setNameArtistConstraints()
        setTimeMusicConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(music: Music) {
        myImageView.image = music.image
        nameMusic.text = music.name
        nameArtist.text = music.artist
        timeMusic.text = music.time
        //songPath = music.songPath
    }
    
    func configureImageView() {
        myImageView.layer.cornerRadius = 10
        myImageView.clipsToBounds = true
    }
    
    func configureNameMusic() {
        //количество строк
        nameMusic.numberOfLines = 1
        //nameMusic.adjustsFontSizeToFitWidth = true
        nameMusic.font = UIFont.systemFont(ofSize: 14)
        nameMusic.textColor = #colorLiteral(red: 0.4988793731, green: 0.4988793731, blue: 0.4988793731, alpha: 1)
    }
    
    func configureNameArtist() {
        nameArtist.numberOfLines = 0
        nameArtist.adjustsFontSizeToFitWidth = true
        nameArtist.font = UIFont.systemFont(ofSize: 16)
    }
    
    func configureTimeMusic() {
        timeMusic.numberOfLines = 0
        timeMusic.adjustsFontSizeToFitWidth = true
        timeMusic.font = UIFont.systemFont(ofSize: 16)
        timeMusic.textColor = #colorLiteral(red: 0.4988793731, green: 0.4988793731, blue: 0.4988793731, alpha: 1)
    }
    
    func setImageConstraints() {
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        myImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        myImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        myImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        myImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setNameMusicConstraints() {
        nameMusic.translatesAutoresizingMaskIntoConstraints = false
        //nameMusic.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nameMusic.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 16).isActive = true
        nameMusic.heightAnchor.constraint(equalToConstant: 80).isActive = true
        nameMusic.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        nameMusic.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
    }
    
    func setNameArtistConstraints() {
        nameArtist.translatesAutoresizingMaskIntoConstraints = false
        nameArtist.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 92).isActive = true
        nameArtist.topAnchor.constraint(equalTo: nameMusic.topAnchor, constant: 4).isActive = true
        nameArtist.widthAnchor.constraint(equalTo: widthAnchor, constant: 10).isActive = true
    }
    
    func setTimeMusicConstraints() {
        timeMusic.translatesAutoresizingMaskIntoConstraints = false
        timeMusic.centerXAnchor.constraint(equalTo: nameArtist.centerXAnchor).isActive = true
        timeMusic.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        timeMusic.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
    }
}
