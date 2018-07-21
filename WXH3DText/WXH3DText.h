//
//  WXH3DText.h
//  WXH3DText
//
//  Created by 伍小华 on 2018/7/20.
//  Copyright © 2018年 伍小华. All rights reserved.
//

#import "WXH3DView.h"

@interface WXH3DText : WXH3DView
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) id string; //NSString or NSAttributedString
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, assign) BOOL wrapped;//是否自动换行，默认为YES

@property(nonatomic, copy) NSString *truncationMode; //kCATruncationNone
@property(nonatomic, copy) NSString *alignmentMode;  //kCAAlignmentNatural
@end
