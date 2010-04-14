NYOBetterZoom (NYOBetterUIScrollView example project)
=====================================================

Summary
-------

This little example project stemmed from the fact that by default UIScrollView chucks small images to the top left corner of it's frame. I (and a lot of other people) would prefer it centred in the view (like Photos.app). Having spent far too long trying to find a solution without any strange issues I finally got it to behave. To save other people some time going round the houses (like I initially did) I'm uploading this example solution.

Feel free to fork and use/improve this (and push back improvements!). It's a start but the code could certainly be improved upon.

How it works
------------

The solution I finally settled on is quite simple really (getting to this solution wasn't though...). I subclass UIScrollView and override it's setContentOffset: so that it returns a CGPoint that will result in the image being centred in it's UIScrollView superview if it's smaller than the UIScrollView.

How to use it
-------------

 1. Include NYOBetterUIScrollView in your project
 2. #import the .h and switch you [[UIScrollView alloc] init...] out for [[NYOBetterUIScrollView alloc] init...]
 3. Once the ScrollView is setup with the image subview make sure you tag the subview with ZOOM_VIEW_TAG so that setContentOffset: can find it.
 4. Call [yourScrollView setContentOffset:CGPointZero] once your views are setup to make sure the image doesn't initially appear at contentOffset {0,0}.

Example project
---------------

The included example project has all the setup required to get a functioning ScrollView that centres small images (and large images when they're zoomed out).

It also shows how to be a bit smarter in regard to device rotation too (recalculating the view's aspect ratio & new minimum zoom when it's rotated).

The project also includes a variety of test images to ensure it works correctly with images of different dimensions (you can switch which image is used in the top of NYOBetterZoomViewController.m's viewDidLoad()):

 * small.png (100x100) - Always smaller than the ScrollView frame, even when zoomed in 2x (maximumZoom).
 * big.png (1000x1000)
 * fit-portrait.png (320x460) - Same size as the portrait ScrollView's frame
 * fit-landscape.png (480x300) - Same size as the landscape ScrollView's frame
 * tall.png (500x1000)
 * wide.png (1000x500)