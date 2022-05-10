use 5.032001;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'SPVM::IO::Socket',
    VERSION_FROM      => 'lib/SPVM/IO/Socket.pm', # finds $VERSION, requires EU::MM from perl >= 5.5
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ABSTRACT_FROM     => 'lib/SPVM/IO/Socket.pm', # retrieve abstract from module
    AUTHOR            => 'A. U. Thor <kimoto@vs.sakura.ne.jp>',
    #LICENSE           => 'perl',
    #Value must be from legacy list of licenses here
    #https://metacpan.org/pod/Module::Build::API
);
sub MY::postamble {
  
  use SPVM::Builder::Util::API;
  
  my $make_rule = "";
  
  # Native compile make rule
  $make_rule .= SPVM::Builder::Util::API::create_make_rule_native("IO::Socket::INET");

  # Native compile make rule
  $make_rule .= SPVM::Builder::Util::API::create_make_rule_precompile("IO::Socket::INET");
  
  return $make_rule;
}
