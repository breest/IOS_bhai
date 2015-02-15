//
//  ViewCcntentController.m
//  bhai
//
//  Created by Chang Wei on 15/2/6.
//  Copyright (c) 2015年 Breeze Studio. All rights reserved.
//

#import "NaviSuperMainController.h"
#import "ViewContentController.h"

@interface ViewContentController () {
    NSString *sPicturePre, *dataFile;
    int iPagesTotal, iTotalCounts;
    UIImageView *imgBackground, *imgBackTitle, *imgContent, *imgPY;
    UILabel *lblPageNumber, *lblNumber, *lblTips;
    UIButton *btnShowLeft, *btnShowRight, *btnReturn, *btnAdd;
    NSMutableDictionary *dict;
    UIView *viewNumber;
    UIImageView *imgV1, *imgV2, *imgV3, *imgV4, *imgV5, *imgV6, *imgButton;
    BOOL bCanAddcounts;
}

@end

@implementation ViewContentController

-(instancetype)init {
    self = [super init];
    if (self != nil) {
        if (SCREEN_HEIGHT <= 480) {
            sPicturePre = @"iPhone5";
        }else if (SCREEN_HEIGHT <= 568) {
            sPicturePre = @"iPhone5";
        }else if(SCREEN_HEIGHT == 667) {
            sPicturePre = @"iPhone5";
        }else if(SCREEN_HEIGHT >= 736) {
            sPicturePre = @"iPhone5";
        }
        iPagesTotal = 44;
    }
    
    self.view.backgroundColor = [UIColor whiteColor];
    imgBackground = [[UIImageView alloc] initWithFrame:self.view.frame];
    imgBackground.contentMode = UIViewContentModeScaleToFill;
    imgBackground.image = [UIImage imageNamed:@"back.jpg"];
    [self.view addSubview:imgBackground];
    
    imgBackTitle = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 28)];
    imgBackTitle.contentMode = UIViewContentModeScaleToFill;
    imgBackTitle.image = [UIImage imageNamed:@"back_title"];
    imgBackTitle.hidden = TRUE;
    [self.view addSubview:imgBackTitle];
    
    lblPageNumber = [[UILabel alloc] initWithFrame:self.view.frame];
    lblPageNumber.textAlignment = NSTextAlignmentCenter;
    lblPageNumber.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.35];
    lblPageNumber.font = [UIFont fontWithName:@"Helvetica-Bold" size:120];
    [self.view addSubview:lblPageNumber];
    
    imgContent = [[UIImageView alloc] initWithFrame:self.view.frame];
    imgContent.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:imgContent];
    
    imgPY = [[UIImageView alloc] initWithFrame:self.view.frame];
    imgPY.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:imgPY];
    /*
    btnShowLeft = [[UIButton alloc] initWithFrame:CGRectMake(10, 30, 50, 50)];
    //[btnShowLeft setBackgroundImage:[UIImage imageNamed:@"49"] forState:UIControlStateNormal];
    btnShowLeft.layer.masksToBounds = YES;
    btnShowLeft.layer.cornerRadius = 25;
    btnShowLeft.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.35];
    [btnShowLeft addTarget:self action:@selector(showLeft) forControlEvents:UIControlEventTouchUpInside];
    btnShowLeft.hidden = TRUE;
    [self.view addSubview:btnShowLeft];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
    imgView.contentMode = UIViewContentModeScaleToFill;
    imgView.image = [UIImage imageNamed:@"00"];
    [btnShowLeft addSubview:imgView];

    
    btnShowRight = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 60, 30, 50, 50)];
    btnShowRight.layer.masksToBounds = YES;
    btnShowRight.layer.cornerRadius = 25;
    btnShowRight.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.35];
    [btnShowRight addTarget:self action:@selector(showRight) forControlEvents:UIControlEventTouchUpInside];
    btnShowRight.hidden = TRUE;
    [self.view addSubview:btnShowRight];
    
    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
    imgView.contentMode = UIViewContentModeScaleToFill;
    imgView.image = [UIImage imageNamed:@"51"];
    [btnShowRight addSubview:imgView];*/
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self createEditableCopyOfDatabaseIfNeeded];
    dataFile = [self applicationDocumentsDirectoryFile];
    //将属性列表文件内容读取到array变量中，也就是获取了属性列表文件中全部的数据集合
    //NSMutableArray *array=[[NSMutableArray alloc] initWithContentsOfFile:path];
    dict = [[NSMutableDictionary alloc] initWithContentsOfFile:dataFile];
    iTotalCounts = [[dict objectForKey:@"TotalCounts"] intValue];

        /*
    lblNumber = [[UILabel alloc] initWithFrame:CGRectMake(59, 250, 202, 44)];
    lblNumber.backgroundColor = [UIColor whiteColor];
    lblNumber.textColor = [UIColor brownColor];
    lblNumber.font = [UIFont fontWithName:@"Helvetica-Bold" size:52];
    lblNumber.textAlignment = NSTextAlignmentCenter;
    lblNumber.text = [NSString stringWithFormat:@"%06i", iTotalCounts];
    //lblNumber.hidden = FALSE;
    [self.view addSubview:lblNumber];
    */
    UISwipeGestureRecognizer *gesture_up, *gesture_down, *gesture_left, *gesture_right;
    gesture_up = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    gesture_up.numberOfTouchesRequired = 1;
    [gesture_up setDirection:UISwipeGestureRecognizerDirectionUp];
    [self.view addGestureRecognizer:gesture_up];
    gesture_down = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    gesture_down.numberOfTouchesRequired = 1;
    [gesture_down setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.view addGestureRecognizer:gesture_down];
    gesture_left = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    gesture_left.numberOfTouchesRequired = 1;
    [gesture_left setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:gesture_left];
    gesture_right = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    gesture_right.numberOfTouchesRequired = 1;
    [gesture_right setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:gesture_right];
}

- (void)viewDidAppear:(BOOL)animated {
    bCanAddcounts = TRUE;
    float r = SCREEN_WIDTH/320.0;
    
    btnReturn = [[UIButton alloc]initWithFrame:CGRectMake(46*r, 346*r, 52*r, 52*r)];
    btnReturn.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:0];
    [btnReturn addTarget:self action:@selector(btnReturnClicked) forControlEvents:UIControlEventTouchUpInside];
    btnReturn.hidden = TRUE;
    [self.view addSubview:btnReturn];
    
    btnAdd = [[UIButton alloc]initWithFrame:CGRectMake(220*r, 346*r, 52*r, 52*r)];
    btnAdd.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:0];
    [btnAdd addTarget:self action:@selector(btnAddClicked) forControlEvents:UIControlEventTouchUpInside];
    btnAdd.hidden = TRUE;
    [self.view addSubview:btnAdd];

    /*
    lblNumber = [[UILabel alloc] initWithFrame:CGRectMake(59, 250, 202, 44)];
    lblNumber.backgroundColor = [UIColor whiteColor];
    lblNumber.textColor = [UIColor brownColor];
    lblNumber.font = [UIFont fontWithName:@"Helvetica-Bold" size:52];
    lblNumber.textAlignment = NSTextAlignmentCenter;
    lblNumber.text = [NSString stringWithFormat:@"%06i", iTotalCounts];
    lblNumber.hidden = TRUE;
    //[self.view addSubview:lblNumber];*/
    
    
    viewNumber = [[UIView alloc] initWithFrame:CGRectMake(59*r, 250*r, 202*r, 44*r)];
    //viewNumber.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
    viewNumber.hidden = TRUE;
    [self.view addSubview:viewNumber];
    
    imgV1 = [[UIImageView alloc] initWithFrame:CGRectMake(170*r, 0, 32*r, 44*r)];
    imgV1.contentMode = UIViewContentModeScaleToFill;
    [viewNumber addSubview:imgV1];
    imgV2 = [[UIImageView alloc] initWithFrame:CGRectMake(136*r, 0, 32*r, 44*r)];
    imgV2.contentMode = UIViewContentModeScaleToFill;
    [viewNumber addSubview:imgV2];
    imgV3 = [[UIImageView alloc] initWithFrame:CGRectMake(102*r, 0, 32*r, 44*r)];
    imgV3.contentMode = UIViewContentModeScaleToFill;
    [viewNumber addSubview:imgV3];
    imgV4 = [[UIImageView alloc] initWithFrame:CGRectMake(68*r, 0, 32*r, 44*r)];
    imgV4.contentMode = UIViewContentModeScaleToFill;
    [viewNumber addSubview:imgV4];
    imgV5 = [[UIImageView alloc] initWithFrame:CGRectMake(34*r, 0, 32*r, 44*r)];
    imgV5.contentMode = UIViewContentModeScaleToFill;
    [viewNumber addSubview:imgV5];
    imgV6 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 32*r, 44*r)];
    imgV6.contentMode = UIViewContentModeScaleToFill;
    [viewNumber addSubview:imgV6];
    imgButton = [[UIImageView alloc] initWithFrame:CGRectMake(220*r, 346*r, 52*r, 49*r)];
    imgButton.contentMode = UIViewContentModeScaleToFill;
    imgButton.image = [UIImage imageNamed:@"button_add_disable"];
    imgButton.hidden = TRUE;
    [self.view addSubview:imgButton];
    
    [self showNumber:iTotalCounts];

    lblTips = [[UILabel alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 100, SCREEN_WIDTH - 40, 100)];
    lblTips.font = [UIFont fontWithName:@"Helvetica" size:17];
    lblTips.numberOfLines = 0;
    lblTips.hidden = TRUE;
    [self.view addSubview:lblTips];

    [self willShowMain];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)toggleTitle {
    self.navigationController.navigationBar.hidden = !self.navigationController.navigationBar.hidden;
    imgBackTitle.hidden = !imgBackTitle.hidden;
    btnShowLeft.hidden = !btnShowLeft.hidden;
    btnShowRight.hidden = !btnShowRight.hidden;
}

- (void)showLeft {
    [(NaviSuperMainController *)self.navigationController toggleSideView];
}

- (void)showRight {
    [(NaviSuperMainController *)self.navigationController showRightView];
}

- (void)willShowMain {
    if (!self.navigationController.navigationBar.hidden) {
        [self toggleTitle];
    }
    if (App.contentMode == ContentModeTypeFTPY) {
        imgPY.hidden = FALSE;
    }else{
        imgPY.hidden = TRUE;
    }
    [self showPage:App.iPageCurrent];
    if (App.bUseDrag) {
        btnShowLeft.hidden = TRUE;
        btnShowRight.hidden = TRUE;
    }else{
        btnShowLeft.hidden = FALSE;
        btnShowRight.hidden = FALSE;
    }
    if (App.bShowPageNumber) {
        lblPageNumber.hidden = FALSE;
    }else{
        lblPageNumber.hidden = TRUE;
    }
}

- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)gesture {
    if (iPagesTotal == App.iPageCurrent && btnAdd.enabled == FALSE) {
        return;
    }
    NSUInteger direction = gesture.direction;
    switch (direction) {
        case UISwipeGestureRecognizerDirectionUp:
            if (App.iPageCurrent < iPagesTotal) {
                App.iPageCurrent ++;
            }else{
                
            }
            break;
        case UISwipeGestureRecognizerDirectionLeft:
            if (App.iPageCurrent < iPagesTotal) {
                App.iPageCurrent ++;
            }else{
                
            }
            break;
        case UISwipeGestureRecognizerDirectionDown:
            if (App.iPageCurrent > 1) {
                App.iPageCurrent --;
            }else{
                
            }
            break;
        case UISwipeGestureRecognizerDirectionRight:
            if (App.iPageCurrent > 1) {
                App.iPageCurrent --;
            }else{
                
            }
            break;
        default:
            break;
    }
    
    [self showPage:App.iPageCurrent];
}

- (void)showPage:(int)pagenumber {
    if (pagenumber == iPagesTotal) {
        btnAdd.enabled = TRUE;
        btnReturn.hidden = FALSE;
        btnAdd.hidden = FALSE;
        //lblNumber.hidden = FALSE;
        viewNumber.hidden = FALSE;
        lblTips.hidden = FALSE;
        [self counter];
        [self showTips];
        return;
    }
    btnReturn.hidden = TRUE;
    btnAdd.hidden = TRUE;
    imgButton.hidden = TRUE;
    //lblNumber.hidden = TRUE;
    viewNumber.hidden = TRUE;
    lblTips.hidden = TRUE;
    NSString *contentFile, *pyFile;
    contentFile = [NSString stringWithFormat:@"%@_ft_%i", sPicturePre, pagenumber];
    imgContent.image = [UIImage imageNamed:contentFile];
    pyFile = [NSString stringWithFormat:@"%@_py_%i", sPicturePre, pagenumber];
    imgPY.image = [UIImage imageNamed:pyFile];
    lblPageNumber.text = [NSString stringWithFormat:@"%i", pagenumber];
}

- (void)counter {
    imgContent.image = [UIImage imageNamed:@"bg_timer"];
    imgPY.image = nil;
    
}

-(void)showTips{
    NSArray *arrayTips = [dict objectForKey:@"Tips"];
    NSInteger index = rand()%arrayTips.count;
    NSString *sTip = [arrayTips objectAtIndex:index];
    lblTips.hidden = FALSE;
    lblTips.text = [NSString stringWithFormat:@"Tips:%@", sTip];
}

- (void)btnReturnClicked {
    App.iPageCurrent = 1;
    [self showPage:1];
    btnAdd.enabled = TRUE;
}

- (void)btnAddClicked {
    iTotalCounts++;
    [dict setObject:[NSNumber numberWithInt:iTotalCounts] forKey:@"TotalCounts"];
    [dict writeToFile:dataFile atomically:YES];
    
    //lblNumber.text = [NSString stringWithFormat:@"%06i", iTotalCounts];
    [self showNumber:iTotalCounts];
    imgButton.hidden = FALSE;
    btnAdd.enabled = FALSE;
}

- (void)showNumber:(int)number {
    int n, counts = number;
    for (int i = 1; i < 7; i++) {
        n = counts%10;
        counts = counts/10;
        [self addNumber:n index:i];
    }
}

- (void)addNumber:(int)number index:(int)index {
    UIImageView *imgView;
    switch (index) {
        case 1:
            imgView = imgV1;
            break;
        case 2:
            imgView = imgV2;
            break;
        case 3:
            imgView = imgV3;
            break;
        case 4:
            imgView = imgV4;
            break;
        case 5:
            imgView = imgV5;
            break;
        case 6:
            imgView = imgV6;
            break;
        default:
            break;
    }
    imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"number_%i", number]];
}

//对文件进行预处理，判断在Documents目录下是否存在plist文件，如果不存在则从资源目录下复制一个。
-(void)createEditableCopyOfDatabaseIfNeeded
{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    NSString *writableDBPath=[self applicationDocumentsDirectoryFile];
    
    BOOL dbexits=[fileManager fileExistsAtPath:writableDBPath];
    if (!dbexits) {
        NSString *defaultDBPath=[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"bhai.plist"];
        NSError *error;
        BOOL success=[fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];        
        if (!success) {
            NSAssert1(0,@"错误写入文件：‘%@’",[error localizedDescription]);
        }
    }
}

//获取放置在沙箱Documents目录下的文件的完整路径
-(NSString *)applicationDocumentsDirectoryFile
{
    NSString *documentDirectory=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path=[documentDirectory stringByAppendingPathComponent:@"bhai.plist"];
    return path;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
