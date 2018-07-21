//
//  WXHBillboardNode.m
//  WXH3DText
//
//  Created by 伍小华 on 2018/7/21.
//  Copyright © 2018年 伍小华. All rights reserved.
//

#import "WXHBillboardNode.h"

static const CGFloat WXHArrowWidth = 10;
static const CGFloat WXHArrowHeight = 20;

@interface WXHBillboardNode ()
@property (nonatomic, strong) WXH3DView *view;
@property (nonatomic, strong) SCNPlane *arrow;
@end
@implementation WXHBillboardNode
- (instancetype)initWith3DView:(WXH3DView *)view
{
    self = [super init];
    if (self) {
        self.view = view;
        [self addChildNode:self.view];
        self.constraints = @[self.billboardConstraint];
        [self updateViewPlace];
    }
    return self;
}

- (void)updateViewPlace
{
    self.view.position = SCNVector3Make(-self.view.frame.size.width*self.view.scale.x/2.0 + self.viewOffset.x,
                                        self.view.frame.size.height*self.view.scale.y + self.distance + self.viewOffset.y,
                                        0);
    self.arrowNode.position = SCNVector3Make(self.arrowOffset.x, self.arrow.height/2.0 + self.arrowOffset.y, 0);
}

#pragma mark - Setter / Getter
- (void)setDistance:(CGFloat)distance
{
    _distance = distance;
    self.arrow.height = distance;
    self.arrow.width = WXHArrowWidth * distance / WXHArrowHeight;
    [self updateViewPlace];
}
- (SCNBillboardConstraint *)billboardConstraint
{
    if (!_billboardConstraint) {
        _billboardConstraint = [SCNBillboardConstraint billboardConstraint];
        _billboardConstraint.freeAxes = SCNBillboardAxisY;
    }
    return _billboardConstraint;
}
- (void)setArrowOffset:(CGPoint)arrowOffset
{
    _arrowOffset = arrowOffset;
    [self updateViewPlace];
}
- (void)setViewOffset:(CGPoint)viewOffset
{
    _viewOffset = viewOffset;
    [self updateViewPlace];
}
- (SCNNode *)arrowNode
{
    if (!_arrowNode) {
        _arrowNode = [SCNNode node];
        _arrowNode.geometry = self.arrow;
        [self addChildNode:_arrowNode];
    }
    return _arrowNode;
}
- (SCNPlane *)arrow
{
    if (!_arrow) {
        _arrow = [SCNPlane planeWithWidth:WXHArrowWidth height:WXHArrowHeight];
        _arrow.firstMaterial.lightingModelName = SCNLightingModelConstant;
//        _arrow.firstMaterial.diffuse.contents = [UIImage imageNamed:@""];
        _arrow.firstMaterial.diffuse.contents = [UIColor yellowColor];
    }
    return _arrow;
}
- (void)setArrowInvert:(BOOL)arrowInvert
{
    _arrowInvert = arrowInvert;
    if (arrowInvert) {
        self.arrowNode.eulerAngles = SCNVector3Make(0, M_PI_2, 0);
    } else {
        self.arrowNode.eulerAngles = SCNVector3Make(0, 0, 0);
    }
}
- (void)setArrowContents:(id)arrowContents
{
    _arrowContents = arrowContents;
    self.arrow.firstMaterial.diffuse.contents = arrowContents;
}
- (void)setScale:(SCNVector3)scale
{
    self.view.scale = scale;
}
@end
