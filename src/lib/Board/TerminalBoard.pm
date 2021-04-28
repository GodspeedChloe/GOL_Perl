package Board::TerminalBoard;

use strict;
use warnings;
use feature 'unicode_strings';
binmode(STDOUT, ":utf8");

my $empty_rectangle = "\N{U+25AF}";
my $full_rectangle = "\N{U+25AE}";

sub new {
  my $class = shift;
  my $self = {
    width => 79,
    iteration => 0
  }
  bless $self, $class;
  return $self;
}


sub getIteration {
  my ($self) = @_;
  return $self->{iteration};
}

sub increment {
  my ($self) = @_;
  $self->{iteration}++;
  return $self->{iteration};
}
1;
