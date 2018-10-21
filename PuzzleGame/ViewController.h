//
//  ViewController.h
//  PuzzleGame
//
//  Created by Samuel Bowman on 6/24/17.
//  Copyright © 2017 Samuel Bowman. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SBPuzzleGameEngine;

@interface ViewController : UIViewController

//@property (weak, nonatomic) IBOutlet UISegmentedControl *modeSelector;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UILabel *movesCounter;
@property (weak, nonatomic) IBOutlet UILabel *difficultyLabel;
@property (weak, nonatomic) IBOutlet UIStepper *difficultySelector;
@property (weak, nonatomic) IBOutlet UILabel *difficultyNotifier;
@property (weak, nonatomic) IBOutlet UIView *gameBoard;
//@property (weak, nonatomic) IBOutlet UILabel *winLabel;

@property (strong, atomic) SBPuzzleGameEngine *engine;

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *difficultySetterVisibilityToggler;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *rightSwipeRecognizer;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *leftSwipeRecognizer;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *downSwipeRecognizer;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *upSwipeRecognizer;


- (IBAction)startGame:(id)sender;
- (IBAction)setDifficultySetterVisibility:(id)sender;
- (IBAction)setDisplayedDifficulty:(id)sender;
- (IBAction)move:(id)sender;

@end
