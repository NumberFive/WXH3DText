//
//  WXH3DView.h
//  WXH3DText
//
//  Created by 伍小华 on 2018/7/20.
//  Copyright © 2018年 伍小华. All rights reserved.
//

#import <SceneKit/SceneKit.h>
static const CGFloat zSpace = 1.0;
@interface WXH3DView : SCNNode
@property (nonatomic, strong) id background; //color or image
@property (nonatomic, assign, readonly) CGRect frame;

@property (nonatomic, assign) NSInteger tag;

- (instancetype)initWithFrame:(CGRect)frame;
- (void)addSubview:(WXH3DView *)view;
@end
