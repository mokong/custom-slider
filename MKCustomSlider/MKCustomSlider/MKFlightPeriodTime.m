//
//  MKFlightTimeSection.m
//  MKCustomSlider
//
//  Created by moyekong on 15/8/13.
//  Copyright (c) 2015年 wiwide. All rights reserved.
//

#import "MKFlightPeriodTime.h"
#import "NMRangeSlider.h"

@implementation MKFlightPeriodTime

#pragma mark - UI -
- (instancetype)initWithFrame:(CGRect)frame {
    self = [[[NSBundle mainBundle] loadNibNamed:@"MKFlightPeriodTime" owner:self options:nil] lastObject];
    self.frame = frame;
    if (self) {
        [self updateUI];
    }
    return self;
}

- (void)updateUI {
    UIColor *backColor = [UIColor colorWithRed:0.89 green:0.89 blue:0.89 alpha:1.0];
    self.backgroundColor = backColor;
    self.rangeSlider.backgroundColor = backColor;
    self.rangeSlider.minimumValue = 0.0; // 最小值
    self.rangeSlider.maximumValue = 24.0; // 最大值

    self.rangeSlider.minimumRange = 6.0; // 最大值和最小值的最小间隔
    self.rangeSlider.stepValue = 6.0;
        
    // 显示的大、小值
    self.rangeSlider.upperValue = 18; //
    self.rangeSlider.lowerValue = 0; // lowerValue设置必须在upperValue之后，是由于天生的Bug
    [self periodTimeWithLowerValue:self.rangeSlider.lowerValue UpperValue:self.rangeSlider.upperValue];

    [self.rangeSlider addTarget:self action:@selector(handleSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
}

#pragma mark - value changed -
- (void)handleSliderValueChanged:(NMRangeSlider *)slider {
    int lowerValue = slider.lowerValue;
    int upperValue = slider.upperValue;
    if ((lowerValue % 6 == 0) && (upperValue % 6 == 0)) {
        NSLog(@"slider miniValue: %d, maxiValue: %d", lowerValue, upperValue);
        [self periodTimeWithLowerValue:lowerValue UpperValue:upperValue];
    }
}

- (void)periodTimeWithLowerValue:(int)lowerValue
                      UpperValue:(int)upperValue {
    NSString *periodTimeString = [NSString stringWithFormat:@"起飞时间段：%.2d:00--%.2d:00", lowerValue, upperValue];
    self.showPeriodTimeLabel.text = periodTimeString;
    [self differentTextColorWithLabel: self.showPeriodTimeLabel];
}

// 同一个Label，字体不同颜色
- (void)differentTextColorWithLabel:(UILabel *)tempLabel {
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:tempLabel.text];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(6, tempLabel.text.length - 6)];
    tempLabel.attributedText = str;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

