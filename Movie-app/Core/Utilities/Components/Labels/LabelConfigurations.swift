//
//  LabelConfigurations.swift
//  Movie-app
//
//  Created by Asif-emumba on 20/01/2025.
//

import UIKit

struct MovieNameLabelConfiguration: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 24, weight: .bold) }
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .center }
}

struct MovieDurationLabelConfiguration: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .regular) }
    var textColor: UIColor { CustomColors.subHeadingColor  ?? .white }
    var textAlignment: NSTextAlignment { .center }
}

struct MovieGenreLabelConfiguration: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .regular) }
    var textColor: UIColor { CustomColors.subHeadingColor  ?? .white}
    var textAlignment: NSTextAlignment { .center }
}

struct MovieRatingLabelConfiguration: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .medium) }
    var textColor: UIColor { CustomColors.textColor  ?? .white}
    var textAlignment: NSTextAlignment { .center }
}

struct UpcomingMovieHeaderLabelConfiguration: LabelConfigurable {
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .left }
    var font: UIFont { .systemFont(ofSize: 24, weight: .bold) }
}

struct UpComingMovieNameLabelConfiguration: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .bold) }
    var textColor: UIColor { CustomColors.yellowColor ?? .white }
    var textAlignment: NSTextAlignment { .left }
}

struct UpComingMovieLabelConfigurations: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 12, weight: .regular) }
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .left }
}
