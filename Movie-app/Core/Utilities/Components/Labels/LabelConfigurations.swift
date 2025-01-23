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

struct ServicesLabelConfigurations: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .medium) }
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .center }
}

struct MovieDescriptionLabelConfigurations: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .medium) }
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .left }
}

struct MovieDetailsLabelConfiguration: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .bold) }
    var textColor: UIColor { CustomColors.textColor  ?? .white}
    var textAlignment: NSTextAlignment { .left }
}

struct MovieDetailsInfoLabelConfiguration: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .regular) }
    var textColor: UIColor { CustomColors.subHeadingColor  ?? .white }
    var textAlignment: NSTextAlignment { .left }
}

struct MovieDetailsNameLabelConfiguration: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 24, weight: .bold) }
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .left }
}

struct MovieDetailsRow: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .regular) }
    var textColor: UIColor { CustomColors.grayShadeColor ?? .white }
    var textAlignment: NSTextAlignment { .left }
}

struct MovieStoryLineLabelConfiguration: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .regular) }
    var textColor: UIColor { .white }
    var textAlignment: NSTextAlignment { .left }
}

struct MovieDirectorNameLabelConfiguration: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 14, weight: .regular) }
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .left }
}

struct CinemaNameLabelConfiguration: LabelConfigurable {
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .left }
    var font: UIFont { .systemFont(ofSize: 20, weight: .bold) }
}

struct AppBarLabelConfiguration: LabelConfigurable {
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .left }
    var font: UIFont { .systemFont(ofSize: 28, weight: .bold) }
}

struct PriceLabelConfiguration: LabelConfigurable {
    var textColor: UIColor {
        CustomColors.yellowColor?.withAlphaComponent(0.8) ?? .yellow.withAlphaComponent(0.8)
    }
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

struct ServicesLabelConfigurations: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .medium) }
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .center }
}

struct MovieDescriptionLabelConfigurations: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .medium) }
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .left }
}

struct MovieDetailsLabelConfiguration: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .bold) }
    var textColor: UIColor { CustomColors.textColor  ?? .white}
    var textAlignment: NSTextAlignment { .left }
}

struct MovieDetailsInfoLabelConfiguration: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .regular) }
    var textColor: UIColor { CustomColors.subHeadingColor  ?? .white }
    var textAlignment: NSTextAlignment { .left }
}

struct MovieDetailsNameLabelConfiguration: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 24, weight: .bold) }
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .left }
}

struct MovieDetailsRow: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .regular) }
    var textColor: UIColor { CustomColors.grayShadeColor ?? .white }
    var textAlignment: NSTextAlignment { .left }
}

struct MovieStoryLineLabelConfiguration: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .regular) }
    var textColor: UIColor { .white }
    var textAlignment: NSTextAlignment { .left }
}

struct MovieDirectorNameLabelConfiguration: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 14, weight: .regular) }
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .left }
}

struct CinemaNameLabelConfiguration: LabelConfigurable {
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .left }
    var font: UIFont { .systemFont(ofSize: 20, weight: .bold) }
}

struct AppBarLabelConfiguration: LabelConfigurable {
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .left }
    var font: UIFont { .systemFont(ofSize: 28, weight: .bold) }
}

struct PriceLabelConfiguration: LabelConfigurable {
    var textColor: UIColor {
        CustomColors.yellowColor?.withAlphaComponent(0.8) ?? .yellow.withAlphaComponent(0.8)
    }
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

struct ServicesLabelConfigurations: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .medium) }
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .center }
}

struct MovieDescriptionLabelConfigurations: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .medium) }
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .left }
}

struct MovieDetailsLabelConfiguration: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .bold) }
    var textColor: UIColor { CustomColors.textColor  ?? .white}
    var textAlignment: NSTextAlignment { .left }
}

struct MovieDetailsInfoLabelConfiguration: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .regular) }
    var textColor: UIColor { CustomColors.subHeadingColor  ?? .white }
    var textAlignment: NSTextAlignment { .left }
}

struct MovieDetailsNameLabelConfiguration: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 24, weight: .bold) }
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .left }
}

struct MovieDetailsRow: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .regular) }
    var textColor: UIColor { CustomColors.grayShadeColor ?? .white }
    var textAlignment: NSTextAlignment { .left }
}

struct MovieStoryLineLabelConfiguration: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .regular) }
    var textColor: UIColor { .white }
    var textAlignment: NSTextAlignment { .left }
}

struct MovieDirectorNameLabelConfiguration: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 14, weight: .regular) }
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .left }
}

struct CinemaNameLabelConfiguration: LabelConfigurable {
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .left }
    var font: UIFont { .systemFont(ofSize: 20, weight: .bold) }
}

struct AppBarLabelConfiguration: LabelConfigurable {
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .left }
    var font: UIFont { .systemFont(ofSize: 28, weight: .bold) }
}

struct PriceLabelConfiguration: LabelConfigurable {
    var textColor: UIColor {
        CustomColors.yellowColor?.withAlphaComponent(0.8) ?? .yellow.withAlphaComponent(0.8)
    }
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

struct ServicesLabelConfigurations: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .medium) }
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .center }
}

struct MovieDescriptionLabelConfigurations: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .medium) }
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .left }
}

struct MovieDetailsLabelConfiguration: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .bold) }
    var textColor: UIColor { CustomColors.textColor  ?? .white}
    var textAlignment: NSTextAlignment { .left }
}

struct MovieDetailsInfoLabelConfiguration: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .regular) }
    var textColor: UIColor { CustomColors.subHeadingColor  ?? .white }
    var textAlignment: NSTextAlignment { .left }
}

struct MovieDetailsNameLabelConfiguration: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 24, weight: .bold) }
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .left }
}

struct MovieDetailsRow: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .regular) }
    var textColor: UIColor { CustomColors.grayShadeColor ?? .white }
    var textAlignment: NSTextAlignment { .left }
}

struct MovieStoryLineLabelConfiguration: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .regular) }
    var textColor: UIColor { .white }
    var textAlignment: NSTextAlignment { .left }
}

struct MovieDirectorNameLabelConfiguration: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 14, weight: .regular) }
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .left }
}

struct CinemaNameLabelConfiguration: LabelConfigurable {
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .left }
    var font: UIFont { .systemFont(ofSize: 20, weight: .bold) }
}

struct AppBarLabelConfiguration: LabelConfigurable {
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .left }
    var font: UIFont { .systemFont(ofSize: 28, weight: .bold) }
}

struct PriceLabelConfiguration: LabelConfigurable {
    var textColor: UIColor {
        CustomColors.yellowColor?.withAlphaComponent(0.8) ?? .yellow.withAlphaComponent(0.8)
    }
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

struct ServicesLabelConfigurations: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .medium) }
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .center }
}

struct MovieDescriptionLabelConfigurations: LabelConfigurable {
    var font: UIFont { .systemFont(ofSize: 16, weight: .medium) }
    var textColor: UIColor { CustomColors.textColor ?? .white }
    var textAlignment: NSTextAlignment { .left }
}
