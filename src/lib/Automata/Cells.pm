package Automata::Cells;

use warnings;
use feature "say";

sub new {
  my $class = shift;
  my $self = {
    all => shift,
    dying => shift
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
  say $self->{all};
  for my $key (keys $self->{all}){
    say "Howdy";
  }
  return ((exists $cs{$x.','.$y}) ? 1 : 0);
}

1;
