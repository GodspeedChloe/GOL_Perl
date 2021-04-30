package Automata::Cells;

use warnings;
use feature "say";
use diagnostics;

sub new {
  my $class = shift;
  my $self = {
      all => shift
  };
  bless $self, $class;
  return $self;
}

sub hasAlive {
  my ($self) = @_;
  return 1;
}

sub applyRules {
  my ($self) = @_;
  return 1;
}

sub isCellAlive {
  my ($self, $x, $y) = @_;
  return (exists $self->{all}->{$x.",".$y}) ? 1 : 0;
}

1;
