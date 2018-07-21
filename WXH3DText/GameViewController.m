//
//  GameViewController.m
//  WXH3DText
//
//  Created by 伍小华 on 2018/7/19.
//  Copyright © 2018年 伍小华. All rights reserved.
//

#import "GameViewController.h"
#import <YYKit/NSString+YYAdd.h>
#import "WXH3DText.h"
#import "WXHBillboardNode.h"

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    SCNView *scnView = (SCNView *)self.view;
    SCNScene *scene = [SCNScene scene];
    scnView.scene = scene;
    scnView.antialiasingMode = SCNAntialiasingModeMultisampling4X;
    scnView.allowsCameraControl = YES;
    scnView.showsStatistics = YES;
    scnView.backgroundColor = [UIColor blackColor];
    
    scnView.scene.lightingEnvironment.contents = [UIImage imageNamed:@"tropical_beach.hdr"];
    scnView.scene.background.contents = [UIImage imageNamed:@"tropical_beach.hdr"];
    
    // create and add a camera to the scene
    SCNNode *cameraNode = [SCNNode node];
    cameraNode.camera = [SCNCamera camera];
    cameraNode.position = SCNVector3Make(0, 0, 500);
    cameraNode.camera.zNear = 0.1;
    cameraNode.camera.zFar = 1000;
    [scene.rootNode addChildNode:cameraNode];
    
//    // create and add a light to the scene
//    SCNNode *lightNode = [SCNNode node];
//    lightNode.light = [SCNLight light];
//    lightNode.light.type = SCNLightTypeOmni;
//    lightNode.position = SCNVector3Make(0, 10, 10);
//    [scene.rootNode addChildNode:lightNode];
//
//    // create and add an ambient light to the scene
//    SCNNode *ambientLightNode = [SCNNode node];
//    ambientLightNode.light = [SCNLight light];
//    ambientLightNode.light.type = SCNLightTypeAmbient;
//    ambientLightNode.light.color = [UIColor darkGrayColor];
//    [scene.rootNode addChildNode:ambientLightNode];
//
//    SCNNode *ship = [scene.rootNode childNodeWithName:@"ship" recursively:YES];
//    [ship runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:0 y:2 z:0 duration:1]]];
//
//
//
//    // add a tap gesture recognizer
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
//    NSMutableArray *gestureRecognizers = [NSMutableArray array];
//    [gestureRecognizers addObject:tapGesture];
//    [gestureRecognizers addObjectsFromArray:scnView.gestureRecognizers];
//    scnView.gestureRecognizers = gestureRecognizers;
    
//    CGFloat width = 300;
//    CGFloat height = 500;
//
//    NSString *string = @"测试测试测试测试测试测试";
//    SCNNode *planeNode = [SCNNode node];
//    planeNode.geometry = [SCNPlane planeWithWidth:width height:height];
//    planeNode.geometry.firstMaterial.diffuse.contents = [UIColor brownColor];
//    planeNode.geometry.firstMaterial.lightingModelName = SCNLightingModelConstant;
//    [scnView.scene.rootNode addChildNode:planeNode];
//    planeNode.position = SCNVector3Make(0, -10, 0);
////    planeNode.scale = SCNVector3Make(1, 1, 0.001);
//
//    SCNNode *textNode = [SCNNode node];
//
//    SCNText *text = [SCNText textWithString:string extrusionDepth:1];
//    text.font = [UIFont systemFontOfSize:20];
//    text.firstMaterial.diffuse.contents = [UIColor whiteColor];
//    text.firstMaterial.lightingModelName = SCNLightingModelConstant;
//    CGFloat textHeight = [string heightForFont:text.font width:width];
//    textHeight += 1;
//
//    text.containerFrame = CGRectMake(0, 0, width, textHeight);
////    text.alignmentMode = kCAAlignmentLeft;
////    text.truncationMode = kCATruncationEnd;
//    text.wrapped = YES;
//    text.flatness = 0;
//    textNode.geometry = text;
//
////    textNode.scale = SCNVector3Make(0.01, 0.01, 0.01);
//    [planeNode addChildNode:textNode];
//    textNode.position = SCNVector3Make(-width/2.0, height/2.0-textHeight, 0.8);
    
//    textNode.renderingOrder = 1;
//    textNode.geometry.firstMaterial.readsFromDepthBuffer = NO;
//    planeNode.geometry.firstMaterial.readsFromDepthBuffer = NO;
    
    SCNNode *boxNode = [SCNNode node];
    boxNode.geometry = [SCNBox boxWithWidth:20 height:20 length:20 chamferRadius:0];
    boxNode.geometry.firstMaterial.diffuse.contents = [UIColor brownColor];
    [scnView.scene.rootNode addChildNode:boxNode];
    boxNode.position = SCNVector3Make(0, 0, 0);
    
    
    WXH3DView *view = [[WXH3DView alloc] initWithFrame:CGRectMake(0, 0, 280, 150)];
    view.background = [UIImage imageNamed:@"index_update_bg"];
    
    NSString *title = @"标  题：》》>";
    CGFloat width = [title widthForFont:[UIFont systemFontOfSize:20]] * 1.5;
    WXH3DText *text1 = [[WXH3DText alloc] initWithFrame:CGRectMake(0, 70, width, 100)];
    text1.string = title;
    text1.font = [UIFont systemFontOfSize:20];
    text1.color = [UIColor redColor];
    [view addSubview:text1];
    
    WXH3DText *text2 = [[WXH3DText alloc] initWithFrame:CGRectMake(text1.frame.size.width, 70, 280-text1.frame.size.width, 100)];
    text2.string = @"这是一段测试文字这是一段测试文字这是一段测试文字";
    text2.font = [UIFont systemFontOfSize:20];
    text2.color = [UIColor redColor];
    [view addSubview:text2];
    
    WXHBillboardNode *billboard = [[WXHBillboardNode alloc] initWith3DView:view];
    billboard.distance = 50.0;
    billboard.hasArrow = YES;
    billboard.position = SCNVector3Make(100, 0, 0);
    billboard.arrowOffset = CGPointMake(20, 10);
    billboard.viewOffset = CGPointMake(20, 10);
    
    [scnView.scene.rootNode addChildNode:billboard];
    
    
    SCNNode *boxNode2 = [SCNNode node];
    boxNode2.geometry = [SCNBox boxWithWidth:20 height:20 length:20 chamferRadius:0];
    boxNode2.geometry.firstMaterial.diffuse.contents = [UIColor redColor];
    [scnView.scene.rootNode addChildNode:boxNode2];
    boxNode2.position = SCNVector3Make(100, 0, 0);
    
//    [scnView.scene.rootNode addChildNode:view];
}

- (void) handleTap:(UIGestureRecognizer*)gestureRecognize
{
    // retrieve the SCNView
    SCNView *scnView = (SCNView *)self.view;
    
    // check what nodes are tapped
    CGPoint p = [gestureRecognize locationInView:scnView];
    NSArray *hitResults = [scnView hitTest:p options:nil];
    
    // check that we clicked on at least one object
    if([hitResults count] > 0){
        // retrieved the first clicked object
        SCNHitTestResult *result = [hitResults objectAtIndex:0];
        
        SCNNode *node = result.node;
        // get its material
        SCNMaterial *material = result.node.geometry.firstMaterial;
        
        // highlight it
        [SCNTransaction begin];
        [SCNTransaction setAnimationDuration:0.5];
        
        // on completion - unhighlight
        [SCNTransaction setCompletionBlock:^{
            [SCNTransaction begin];
            [SCNTransaction setAnimationDuration:0.5];
            
            material.emission.contents = [UIColor blackColor];
            
            [SCNTransaction commit];
        }];
        
        material.emission.contents = [UIColor redColor];
        
        [SCNTransaction commit];
    }
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
