//
//  DLRadioButton+Animater.h
//  Cowa
//
//  Created by MX on 16/8/16.
//  Copyright © 2016年 MX. All rights reserved.
//

#define maskLayerLineColor [UIColor whiteColor].CGColor
#define maskLayerDuration 3
#define maskLayerArcAngleStart 0
#define maskLayerArcAngleEnd M_PI/4.0

#import <DLRadioButton/DLRadioButton.h>

@interface DLRadioButton (Animater)

@property (nonatomic, assign) BOOL animate;

@end
