//
//  SectionCollectionView.swift
//  iOS5-HW14-CollectionFoto
//
//  Created by Дарья Кретюк on 30.03.2022.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingsOptionType]
}

enum SettingsOptionType {
    case myAlbumCell(model: FotoMYAlbum)
    case commonAlbumCell(model: FotoCommonAlbums)
    case peoplePlaceCell(model: FotoPeopleAndPlace)
    case typeMediaCell(model: FotoTypeMedia)
    case othersCell(model: FotoOthers)
}

struct FotoMYAlbum {
    let title: String
    let icon: UIImage?
    let countFoto: String
}

struct FotoCommonAlbums {
    let title: String
    let icon: UIImage?
    let who: String
}

struct FotoPeopleAndPlace {
    let title: String
    let icon: UIImage?
    let countFoto: String
}

struct FotoTypeMedia {
    let title: String
    let icon: UIImage?
    let countFoto: String
}

struct FotoOthers {
    let title: String
    let icon: UIImage?
    let countFoto: String
}

extension Section {
    static func getSections() -> [Section] {
        return [
            Section(title: "Мои альбомы", options: [
                .myAlbumCell(model: FotoMYAlbum(title: "Недавние", icon: UIImage(named: "myAlbum1"), countFoto: "13 698")),
                .myAlbumCell(model: FotoMYAlbum(title: "Избранное", icon: UIImage(named: "myAlbum2"), countFoto: "896")),
                .myAlbumCell(model: FotoMYAlbum(title: "Готовые стикеры", icon: UIImage(named: "myAlbum3"), countFoto: "30")),
                .myAlbumCell(model: FotoMYAlbum(title: "Стикеры", icon: UIImage(named: "myAlbum4"), countFoto: "50")),
                .myAlbumCell(model: FotoMYAlbum(title: "Селфи", icon: UIImage(named: "myAlbum5"), countFoto: "6")),
                .myAlbumCell(model: FotoMYAlbum(title: "Работа", icon: UIImage(named: "myAlbum6"), countFoto: "23")),
                .myAlbumCell(model: FotoMYAlbum(title: "финка", icon: UIImage(named: "myAlbum7"), countFoto: "153")),
                .myAlbumCell(model: FotoMYAlbum(title: "Lightroom", icon: UIImage(named: "myAlbum8"), countFoto: "229")),
                .myAlbumCell(model: FotoMYAlbum(title: "WhatsApp", icon: UIImage(named: "myAlbum9"), countFoto: "964")),
                .myAlbumCell(model: FotoMYAlbum(title: "Instagram", icon: UIImage(named: "myAlbum10"), countFoto: "93"))
            ]),
            Section(title: "Общие альбомы", options: [
                .commonAlbumCell(model: FotoCommonAlbums(title: "Семья", icon: UIImage(named: "commonAlbum1"), who: "От Вас"))
            ]),
            Section(title: "Люди и места", options: [
                .peoplePlaceCell(model: FotoPeopleAndPlace(title: "Люди", icon: UIImage(named: "peopleAlbum"), countFoto: "13")),
                .peoplePlaceCell(model: FotoPeopleAndPlace(title: "Места", icon: UIImage(named: "placeAlbum"), countFoto: "10 297"))
            ]),
            Section(title: "Типы медиафайлов", options: [
                .typeMediaCell(model: FotoTypeMedia(title: "Видео", icon: UIImage(systemName: "video"), countFoto: "1 025")),
                .typeMediaCell(model: FotoTypeMedia(title: "Селфи", icon: UIImage(systemName: "person.crop.square"), countFoto: "1 375")),
                .typeMediaCell(model: FotoTypeMedia(title: "Фото Live Photos", icon: UIImage(systemName: "livephoto"), countFoto: "254")),
                .typeMediaCell(model: FotoTypeMedia(title: "Портреты", icon: UIImage(systemName: "cube"), countFoto: "15")),
                .typeMediaCell(model: FotoTypeMedia(title: "Панорамы", icon: UIImage(systemName: "pano"), countFoto: "8")),
                .typeMediaCell(model: FotoTypeMedia(title: "Таймлапс", icon: UIImage(systemName: "aqi.medium"), countFoto: "6")),
                .typeMediaCell(model: FotoTypeMedia(title: "Замедленно", icon: UIImage(systemName: "aqi.low"), countFoto: "52")),
                .typeMediaCell(model: FotoTypeMedia(title: "Серии", icon: UIImage(systemName: "square.stack.3d.down.right"), countFoto: "15")),
                .typeMediaCell(model: FotoTypeMedia(title: "Снимки экрана", icon: UIImage(systemName: "camera.viewfinder"), countFoto: "1 228")),
                .typeMediaCell(model: FotoTypeMedia(title: "Записи экрана", icon: UIImage(systemName: "smallcircle.filled.circle"), countFoto: "17")),
                .typeMediaCell(model: FotoTypeMedia(title: "Анимированные", icon: UIImage(systemName: "square.stack.3d.forward.dottedline"), countFoto: "7")),
            ]),
            Section(title: "Другое", options: [
                .othersCell(model: FotoOthers(title: "Импортированные", icon: UIImage(systemName: "square.and.arrow.down"), countFoto: "224")),
                .othersCell(model: FotoOthers(title: "Не удается выгрузить", icon: UIImage(systemName: "exclamationmark.icloud"), countFoto: "9")),
                .othersCell(model: FotoOthers(title: "Скрытые", icon: UIImage(systemName: "eye.slash"), countFoto: "0")),
                .othersCell(model: FotoOthers(title: "Недавно удаленные", icon: UIImage(systemName: "trash"), countFoto: "23")),
            ])
        ]
    }
}
