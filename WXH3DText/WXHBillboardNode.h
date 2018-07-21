//
//  WXHBillboardNode.h
//  WXH3DText
//
//  Created by 伍小华 on 2018/7/21.
//  Copyright © 2018年 伍小华. All rights reserved.
//

#import <SceneKit/SceneKit.h>
#import "WXH3DView.h"

@interface WXHBillboardNode : SCNNode
@property (nonatomic, assign) BOOL hasArrow;
@property (nonatomic, assign) CGFloat distance;
@property (nonatomic, strong) SCNBillboardConstraint *billboardConstraint;

@property (nonatomic, assign) CGPoint viewOffset;
@property (nonatomic, assign) CGPoint arrowOffset;

@property (nonatomic, assign) BOOL arrowInvert;
@property (nonatomic, strong) SCNNode *arrowNode;
@property (nonatomic, strong) id arrowContents;
- (instancetype)initWith3DView:(WXH3DView *)view;
@end
