//
//  SZDealsTopMenu.h
//  SZTuan
//
//  Created by sunze on 15/8/19.
//  Copyright (c) 2015年 sunze. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SZDealsTopMenu : UIView

@property (weak, nonatomic) IBOutlet UIButton *imageButton;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *subtitleView;


+(instancetype)menu;

- (void)addTarget:(id)target action:(SEL)action;

@end
