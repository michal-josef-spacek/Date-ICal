use strict;
use warnings;

use ExtUtils::MakeMaker;

my $EUMM_VERSION = eval($ExtUtils::MakeMaker::VERSION);

print q(
Please note that this module is long-since abandoned. While I do accept
patches, and occasionally apply them, for the most part it is
recommended that you move off of this module and use the various modules
developed by the datetime project. You can find out more about the
datetime project at https://github.com/houseabsolute/DateTime.pm/wiki

Rich Bowen - RBOW@CPAN.ORG
);

WriteMakefile(
  'ABSTRACT_FROM' => 'lib/Date/ICal.pm',
  'AUTHOR'       => 'Rich Bowen <rbow@cpan.org>',
  'NAME'         => 'Date::ICal',
  'LICENSE'      => 'perl',
  ($EUMM_VERSION >= 6.48) ? ('MIN_PERL_VERSION' => 5.006000) : (),
  'VERSION_FROM' => 'lib/Date/ICal.pm',    # finds $VERSION
  'PREREQ_PM'    => {
      'Test::Harness' => '2.25',
      'Test::More'    => '0.45',
      #     'Test::Inline' => 0,
      'Date::Leapyear' => '1.03',
      'Time::Local'    => 0,
      'Time::HiRes'    => 0,
      'Storable'       => 0,
  },    # e.g., 'Module::Name' => 1.1
  META_MERGE => {
      'meta-spec' => { version => 2 },
       resources => {
           repository => {
               type => 'git',
               url  => 'https://github.com/michal-josef-spacek/Date-ICal.git',
               web  => 'https://github.com/michal-josef-spacek/Date-ICal',
           },
           bugtracker => {
               web => 'https://github.com/michal-josef-spacek/Date-ICal/issues'
           },
       },
  },
);

# Don't currently have any inline tests
# open(MANIFEST, "MANIFEST");
# foreach my $file (grep /\.pm$/, <MANIFEST>) {
#    chomp $file;
#    my($module) = $file =~ m|^(.*)\.pm$|;
#    $module =~ s|/|-|g;
#    system("pod2test $file t/embedded-$module.t");
#}

sub MY::postamble {
    package MY;
    "\npredist: all\n" .
    "\tcvs2cl -r -b -t -f Changes\n".
    "\techo '# vim: filetype=changelog' >> Changes\n".
    "\tpod2text lib/Date/ICal.pm >! README\n".
    "\techo '------------------------------------------------' >> README\n".
    "\tpod2text lib/Date/ICal/Duration.pm >> README\n"
}

