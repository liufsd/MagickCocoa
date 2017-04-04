//
//  AppDelegate.m
//  MagickCocoa
//
//  Created by liupeng on 05/04/2017.
//  Copyright © 2017 liupeng. All rights reserved.
//

#import "AppDelegate.h"

#include <iostream>
#include <Magick++.h>
using namespace Magick;

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    InitializeMagick("");
    
//    libc++abi.dylib: terminating with uncaught exception of type Magick::WarningConfigure: MagickCocoa: UnableToOpenConfigureFile `colors.xml' @ warning/configure.c/GetConfigureOptions/715
    Image image( "100x100", "white" );
    image.pixelColor( 49, 49, "red" );
    image.write("/Users/liupeng/red_pixel.png" );
    
//    libc++abi.dylib: terminating with uncaught exception of type Magick::ErrorModule: MagickCocoa: UnableToLoadModule '/usr/local/Cellar/imagemagick/7.0.5-4/lib/ImageMagick//modules-Q16HDRI/coders/png.la': file not found @ error/module.c/OpenModule/1279
    Image targetImage("/Users/liupeng/red_pixel.png");
    //    size_t compressionFactor = targetImage.quality(); // 0..100
    float compressionFactor = float(targetImage.quality()) / 100.0;
    std::cout << compressionFactor << " \n Finish \n";
    targetImage.compressType(JPEG2000Compression);
    targetImage.quality(50);
    targetImage.write("/Users/liupeng/red_pixel_2.png");

}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
