use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

$CC =  'g++';

WriteMakefile(
    'NAME'		=> 'Device::QuickCam',
    'VERSION_FROM'	=> 'QuickCam.pm', # finds $VERSION
    'PREREQ_PM'		=> {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM    => 'QuickCam.pm', # retrieve abstract from module
       AUTHOR           => 'Hendrik Van Belleghem <beatnik@quickndirty.org>') : ()),
    'LIBS'		=> ['-lm -lcqcam -ljpeg'], # e.g., '-lm'
    'DEFINE'		=> '-DLINUX -DJPEG -DLOCKING', # e.g., '-DHAVE_SOMETHING'
	# Insert -I. if you add *.h files later:
    'CC'                => $CC,
    'LD'                => '$(CC)',
    # Now, this part is tricky, because you should have about 5 headers files
    # in the current directory when building.
    # camera.h config.h imager.h port.h rcfile.h
    # These files are part of libcqcam
    'INC'		=> '-I. -L/usr/lib', # e.g., '-I/usr/include/other'
    # 'OBJECT'		=> '$(O_FILES)', # link all the C files too
    'XSOPT'             => '-C++',
    'TYPEMAPS'          => ['perlobject.map'],
    'dist' => {COMPRESS=>'gzip',SUFFIX=>'gz'},
);
