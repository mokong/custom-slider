//
//  MKFlightTimeSection.h
//  MKCustomSlider
//
//  Created by moyekong on 15/8/13.
//  Copyright (c) 2015年 wiwide. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NMRangeSlider;

@interface MKFlightPeriodTime : UIView

@property (weak, nonatomic) IBOutlet UILabel *showPeriodTimeLabel;
@property (weak, nonatomic) IBOutlet NMRangeSlider *rangeSlider;

@end
