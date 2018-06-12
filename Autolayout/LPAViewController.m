//
//  LPAViewController.m
//  Autolayout
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPAViewController.h"

@interface LPAViewController ()

@property (nonatomic, weak) UIButton *squareButton;
@property (nonatomic, weak) UIButton *portraitButton;
@property (nonatomic, weak) UIButton *landscapeButton;

@property (nonatomic, weak) UIView *framingView;
@property (nonatomic, weak) NSLayoutConstraint *framingViewHeightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *framingViewWidthConstraint;

@end

@implementation LPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;
    
    NSString *buttonsHorizontalConstraintsFormat = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    NSArray *buttonsHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraintsFormat
                                                                                    options:NSLayoutFormatAlignAllCenterY
                                                                                    metrics:nil
                                                                                      views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)];
    [NSLayoutConstraint activateConstraints:buttonsHorizontalConstraints];
    
    NSLayoutConstraint *squareButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:squareButton
                                                                                    attribute:NSLayoutAttributeBottom
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.view
                                                                                    attribute:NSLayoutAttributeBottom
                                                                                   multiplier:1.0
                                                                                     constant:-50.0];
    squareButtonBottomConstraint.active = YES;
    
    NSLayoutConstraint *framingViewCenterXConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.view
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                   multiplier:1.0
                                                                                     constant:0.0];
    framingViewCenterXConstraint.active = YES;
    
    NSLayoutConstraint *framingViewCenterY = [NSLayoutConstraint constraintWithItem:framingView
                                                                          attribute:NSLayoutAttributeCenterY
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.view
                                                                          attribute:NSLayoutAttributeCenterY
                                                                         multiplier:1.0
                                                                           constant:-50.0];
    framingViewCenterY.active = YES;
    
    self.framingViewHeightConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:nil
                                                                    attribute:NSLayoutAttributeNotAnAttribute
                                                                   multiplier:1.0
                                                                     constant:500.0];
    self.framingViewHeightConstraint.active = YES;
    
    self.framingViewWidthConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                   attribute:NSLayoutAttributeWidth
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:nil
                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                  multiplier:1.0
                                                                    constant:500.0];
    self.framingViewWidthConstraint.active = YES;
    
    
    // Set up your views and constraints here
    
    // Purple Rectangle right, buttom, width, and height
    
    UIView *purpleRectangle = [[UIView alloc] initWithFrame:CGRectZero];
    purpleRectangle.translatesAutoresizingMaskIntoConstraints = NO;
    purpleRectangle.backgroundColor = UIColor.purpleColor;
    [framingView addSubview:purpleRectangle];
    
    [NSLayoutConstraint
     constraintWithItem:purpleRectangle
     attribute:NSLayoutAttributeRight
     relatedBy:NSLayoutRelationEqual
     toItem:framingView
     attribute:NSLayoutAttributeRight
     multiplier:1.0
     constant:-20].active = YES;
    
    [NSLayoutConstraint
     constraintWithItem:purpleRectangle
     attribute:NSLayoutAttributeBottom
     relatedBy:NSLayoutRelationEqual
     toItem:framingView
     attribute:NSLayoutAttributeBottom
     multiplier:1.0
     constant:-20].active = YES;
    
    [NSLayoutConstraint
     constraintWithItem:purpleRectangle
     attribute:NSLayoutAttributeWidth
     relatedBy:NSLayoutRelationEqual
     toItem:framingView
     attribute:NSLayoutAttributeWidth
     multiplier:305.0/500.0
     constant:1].active = YES;
    
    [NSLayoutConstraint
     constraintWithItem:purpleRectangle
     attribute:NSLayoutAttributeHeight
     relatedBy:NSLayoutRelationEqual
     toItem:nil
     attribute:NSLayoutAttributeNotAnAttribute
     multiplier:1.0
     constant:50].active = YES;
    
    // Red box top, right, width, height
    
    UIView *redRectangle = [[UIView alloc] init];
    redRectangle.translatesAutoresizingMaskIntoConstraints = NO;
    redRectangle.backgroundColor = UIColor.redColor;
    [framingView addSubview:redRectangle];
    
    [NSLayoutConstraint constraintWithItem:redRectangle
                                 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeTop multiplier:1.0 constant:20].active = YES;
    
    [NSLayoutConstraint constraintWithItem:redRectangle
                                 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20].active = YES;
    
    [NSLayoutConstraint constraintWithItem:redRectangle attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:140].active = YES;    // Calculated first width + second width + 10
    
    [NSLayoutConstraint constraintWithItem:redRectangle
                                 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:40].active = YES;  // Calculated width + 10
    
    // Orange Rectangle Right the top, right, width, height
    
    UIView *orangeRectangleRight = [[UIView alloc] initWithFrame:CGRectZero];
    orangeRectangleRight.translatesAutoresizingMaskIntoConstraints = NO;
    orangeRectangleRight.backgroundColor = UIColor.orangeColor;
    [framingView addSubview:orangeRectangleRight];
    
    
    [NSLayoutConstraint constraintWithItem:(orangeRectangleRight)
                                 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:redRectangle attribute:NSLayoutAttributeTop multiplier:1.0 constant:5].active = YES;
    
    [NSLayoutConstraint constraintWithItem:(orangeRectangleRight)
                                 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:redRectangle attribute:NSLayoutAttributeRight multiplier:1.0 constant:-5].active = YES;
    
    [NSLayoutConstraint constraintWithItem:(orangeRectangleRight)
                                 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50].active = YES;
    
    [NSLayoutConstraint constraintWithItem:(orangeRectangleRight)
                                 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30].active = YES;
    
    //  Rectangle Left the top, right, width, height
    
    UIView *orangeRectangleLeft = [[UIView alloc] initWithFrame:CGRectZero];
    orangeRectangleLeft.translatesAutoresizingMaskIntoConstraints = NO;
    orangeRectangleLeft.backgroundColor = UIColor.orangeColor;
    [framingView addSubview:orangeRectangleLeft];
    
    // Why did we we have the positive value for top here while we had to set it to minus for the purple rectangle?
    
    [NSLayoutConstraint constraintWithItem:(orangeRectangleLeft)
                                 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:redRectangle attribute:NSLayoutAttributeTop multiplier:1.0 constant:5].active = YES;
    
    [NSLayoutConstraint constraintWithItem:(orangeRectangleLeft)
                                 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:redRectangle attribute:NSLayoutAttributeLeft multiplier:1.0 constant:5].active = YES;
    
    [NSLayoutConstraint constraintWithItem:(orangeRectangleLeft)
                                 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:70].active = YES;
    
    [NSLayoutConstraint constraintWithItem:(orangeRectangleLeft)
                                 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30].active = YES;
    
    // Center blue box position, height and width
    
    UIView *blueBoxCenter = [[UIView alloc] initWithFrame:CGRectZero];
    blueBoxCenter.translatesAutoresizingMaskIntoConstraints = NO;
    blueBoxCenter.backgroundColor = UIColor.blueColor;
    [framingView addSubview:blueBoxCenter];
    
//    [NSLayoutConstraint constraintWithItem:blueBoxCenter
//                                 attribute:(NSLayoutAttributeCenterX) relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0].active = YES;
//
//    [NSLayoutConstraint constraintWithItem:blueBoxCenter
//                                 attribute:(NSLayoutAttributeCenterY) relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0].active = YES;
    
    [blueBoxCenter.centerXAnchor constraintEqualToAnchor:framingView.centerXAnchor].active = YES;
    [blueBoxCenter.centerYAnchor constraintEqualToAnchor:framingView.centerYAnchor].active = YES;
    
    [NSLayoutConstraint constraintWithItem:blueBoxCenter
                                 attribute:(NSLayoutAttributeHeight) relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:50].active = YES;
    
    [NSLayoutConstraint constraintWithItem:blueBoxCenter
                                 attribute:(NSLayoutAttributeWidth) relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:50].active = YES;
    
    
    // Top blue box height and width
    
    UIView *blueBoxTop = [[UIView alloc] initWithFrame:CGRectZero];
    blueBoxTop.translatesAutoresizingMaskIntoConstraints = NO;
    blueBoxTop.backgroundColor = UIColor.blueColor;
    [framingView addSubview:blueBoxTop];
    
    [blueBoxTop.centerXAnchor constraintEqualToAnchor:framingView.centerXAnchor].active = YES;
    [blueBoxTop.centerYAnchor constraintEqualToAnchor:framingView.centerYAnchor constant:100].active = YES;
    
    [NSLayoutConstraint constraintWithItem:blueBoxTop
                                 attribute:(NSLayoutAttributeHeight) relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:50].active = YES;
    
    [NSLayoutConstraint constraintWithItem:blueBoxTop
                                 attribute:(NSLayoutAttributeWidth) relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:50].active = YES;
    
    // Bottom blue box height and width
    
    UIView *blueBoxBottom = [[UIView alloc] initWithFrame:CGRectZero];
    blueBoxBottom.translatesAutoresizingMaskIntoConstraints = NO;
    blueBoxBottom.backgroundColor = UIColor.blueColor;
    [framingView addSubview:blueBoxBottom];
    
    [blueBoxBottom.centerXAnchor constraintEqualToAnchor:framingView.centerXAnchor].active = YES;
    [blueBoxBottom.centerYAnchor constraintEqualToAnchor:framingView.centerYAnchor constant: -100].active = YES;
    
    [NSLayoutConstraint constraintWithItem:blueBoxBottom
                                 attribute:(NSLayoutAttributeHeight) relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:50].active = YES;
    
    [NSLayoutConstraint constraintWithItem:blueBoxBottom
                                 attribute:(NSLayoutAttributeWidth) relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:50].active = YES;
}


/**
 Resize the frame of the framing view depending on which button was pressed.
 */
- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:2.0 animations:^(){
        self.framingViewHeightConstraint.constant = newHeight;
        self.framingViewWidthConstraint.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
}

@end
