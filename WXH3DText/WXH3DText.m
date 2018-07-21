//
//  WXH3DText.m
//  WXH3DText
//
//  Created by 伍小华 on 2018/7/20.
//  Copyright © 2018年 伍小华. All rights reserved.
//

#import "WXH3DText.h"
@interface WXH3DText ()
@property (nonatomic, strong) SCNNode *textNode;
@property (nonatomic, strong) SCNText *text;
@end
@implementation WXH3DText
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _wrapped = YES;
        [self addChildNode:self.textNode];
        self.textNode.position = SCNVector3Make(0, -self.frame.size.height, 0);
    }
    return self;
}
#pragma mark - Setter / Getter
- (void)setBackground:(id)background
{
    [super setBackground:background];
    self.textNode.position = SCNVector3Make(self.textNode.position.x, self.textNode.position.y, zSpace);
}
- (void)setColor:(UIColor *)color
{
    _color = color;
    self.text.firstMaterial.diffuse.contents = color;
}
- (void)setString:(id)string
{
    _string = string;
    self.text.string = string;
}
- (void)setFont:(UIFont *)font
{
    _font = font;
    self.text.font = font;
}
- (SCNNode *)textNode
{
    if (!_textNode) {
        _textNode = [SCNNode node];
        _textNode.geometry = self.text;
    }
    return _textNode;
}
- (SCNText *)text
{
    if (!_text) {
        _text = [SCNText textWithString:nil extrusionDepth:0];
        _text.firstMaterial.lightingModelName = SCNLightingModelConstant;
        _text.wrapped = YES;
        _text.flatness = 0;
        _text.containerFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    }
    return _text;
}
- (void)setTruncationMode:(NSString *)truncationMode
{
    _truncationMode = truncationMode;
    self.text.truncationMode = truncationMode;
}
- (void)setAlignmentMode:(NSString *)alignmentMode
{
    _alignmentMode = alignmentMode;
    self.text.alignmentMode = alignmentMode;
}
- (void)setWrapped:(BOOL)wrapped
{
    _wrapped = wrapped;
    self.text.wrapped = wrapped;
}
@end
