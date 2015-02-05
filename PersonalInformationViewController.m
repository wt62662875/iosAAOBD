//
//  PersonalInformationViewController.m
//  AAOBD
//
//  Created by wt on 15/1/5.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "PersonalInformationViewController.h"
#import "public.h"

@interface PersonalInformationViewController ()
@property (strong, nonatomic) IBOutlet UIButton *HeadPortraitBtn;
@property (strong, nonatomic) IBOutlet UIButton *NextBtn;
@property (strong, nonatomic) IBOutlet UILabel *PhoneNumberLab;
@property (strong, nonatomic) IBOutlet UITextField *NickNameTextField;

@end

@implementation PersonalInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _HeadPortraitBtn.layer.masksToBounds = YES;
    _HeadPortraitBtn.layer.cornerRadius = _HeadPortraitBtn.frame.size.width/2;
    [_NextBtn setBackgroundImage:[self createImageWithColor:RGBCOLORA(204, 0, 0, 1)] forState:UIControlStateNormal];
    [_NextBtn setBackgroundImage:[self createImageWithColor:RGBCOLORA(153, 0, 0, 1)] forState:UIControlStateHighlighted];
    _NextBtn.layer.masksToBounds=YES;
    _NextBtn.layer.cornerRadius = 3;
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *UserPhoneNomber = [userDefaults stringForKey:@"UserPhoneNomber"];
    NSString *Nicename = [userDefaults stringForKey:@"Nicename"];
    _PhoneNumberLab.text = UserPhoneNomber;
    _NickNameTextField.text = Nicename;
    
//    [self.navigationController setNavigationBarHidden:NO];
    // Do any additional setup after loading the view.
}
- (IBAction)ModifyPassWordBtnClick:(id)sender {
}
- (IBAction)LoginOutBtnClick:(id)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@"" forKey:@"UserPassword"];
}
- (IBAction)SaveDateBtn:(id)sender {

}
-(UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}
- (IBAction)HeadPortraitClick:(id)sender {
    UIActionSheet *actionsheet =[[UIActionSheet alloc]initWithTitle:@"修改头像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"相册", nil];
    actionsheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [actionsheet showInView:self.view];
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSUInteger sourceTape = 0;
    if (buttonIndex == 0) {
        NSLog(@"拍照");
        sourceTape = UIImagePickerControllerSourceTypeCamera;
    }else if (buttonIndex == 1) {
        NSLog(@"相册");
        sourceTape = UIImagePickerControllerSourceTypePhotoLibrary;
    }else if(buttonIndex == 2) {
        NSLog(@"取消");
        return;
    }
    //点击后打开相机或相册
    UIImagePickerController * imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    imagePickerController.sourceType = sourceTape;
    [self presentViewController:imagePickerController animated:YES completion:^{}];
}
//点击相册中的图片或照相机照完后点击use  后触发的方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self saveImage:image withName:@"currentImage.png"];
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"currentImage.png"];
    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
    [_HeadPortraitBtn setImage:savedImage forState:UIControlStateNormal];
}
//保存图片
- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
{
    
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);
    // 获取沙盒目录
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    // 将图片写入文件
    
    [imageData writeToFile:fullPath atomically:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
