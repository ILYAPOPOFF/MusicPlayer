//
//  UIAutoLayot.swift
//  UISlider(06-ДЗ.2)
//
//  Created by ILYA POPOV on 04.11.2022.
//

import UIKit

extension UIView {
    
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
        buttonPause.bottomAnchor.constraint(equalTo: sliderMusic.bottomAnchor, constant: 90).isActive = true
        buttonPause.widthAnchor.constraint(equalToConstant: 40).isActive = true
        buttonPause.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setButtonPlayConstraints() {
        buttonPlay.translatesAutoresizingMaskIntoConstraints = false
        buttonPlay.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonPlay.bottomAnchor.constraint(equalTo: sliderMusic.bottomAnchor, constant: 90).isActive = true
        buttonPlay.widthAnchor.constraint(equalToConstant: 40).isActive = true
        buttonPlay.heightAnchor.constraint(equalToConstant: 40).isActive = true
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
}
