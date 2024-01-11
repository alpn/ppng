#import <Cocoa/Cocoa.h>

int main (int argc, char * const argv[]){

    if(argc != 2)
        return 1;

    NSPasteboard *pb = [NSPasteboard generalPasteboard];
    NSImage *image = [[NSImage alloc] initWithPasteboard:pb];

    if (!image)
        return 1;

    NSData *data = [NSBitmapImageRep representationOfImageRepsInArray:[image representations]
                            usingType:NSBitmapImageFileTypePNG properties:@{}];
    [image release];

    if(![data writeToFile:[NSString stringWithUTF8String:argv[1]] atomically:YES])
        return 1;

    return 0;
}
