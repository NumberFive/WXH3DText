//
//  WXH3DView.m
//  WXH3DText
//
//  Created by 伍小华 on 2018/7/20.
//  Copyright © 2018年 伍小华. All rights reserved.
//

#import "WXH3DView.h"
@interface WXH3DView ()
@property (nonatomic, strong) SCNNode *planeNode;
@property (nonatomic, strong) NSMutableArray *subviews;
@end
@implementation WXH3DView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super init];
    if (self) {
        _frame = frame;
    }
    return self;
}
- (void)addSubview:(WXH3DView *)view
{
    [self.subviews addObject:view];
    [self addChildNode:view];
    view.position = SCNVector3Make(view.frame.origin.x,
                                   -view.frame.origin.y,
                                   zSpace);
}

#pragma mark - Setter / Getter
- (void)setBackground:(id)background
{
    _background = background;
    self.planeNode.geometry.firstMaterial.diffuse.contents = background;
}
- (SCNNode *)planeNode
{
    if (!_planeNode) {
        _planeNode = [SCNNode node];
        _planeNode.geometry = [SCNPlane planeWithWidth:self.frame.size.width height:self.frame.size.height];
        _planeNode.geometry.firstMaterial.lightingModelName = SCNLightingModelConstant;
        [self addChildNode:_planeNode];
        _planeNode.position = SCNVector3Make(self.frame.size.width/2.0, -self.frame.size.height/2.0, 0);
    }
    return _planeNode;
}
- (NSMutableArray *)subviews
{
    if (!_subviews) {
        _subviews = [NSMutableArray array];
    }
    return _subviews;
}
- (void)setScale:(SCNVector3)scale
{
    [super setScale:SCNVector3Make(scale.x, scale.y, 1.0)];
}
@end
