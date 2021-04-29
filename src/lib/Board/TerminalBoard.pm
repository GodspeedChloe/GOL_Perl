package Board::TerminalBoard;

use Curses;
use strict;
use warnings;
use feature "say";
use feature 'unicode_strings';
binmode(STDOUT, ":utf8");

my $empty_rectangle = "\N{U+25AF}";
my $full_rectangle = "\N{U+25AE}";

sub new {
  my $class = shift;
  my $self = {
    width => shift,
    height => shift,
    iteration => shift,
    win => shift,
    cells => shift
  };
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

sub showBoard {
  my ($self) = @_;
  $self->{win}->addstr(0,0,"Game iteration: ".$self->{iteration});
  my $i = 0;
  my $j = 0;
  while($i < $self->{width} ){
    $j = 0;
    while( $j < $self->{height} ){
      if ($self->{cells}->isCellAlive($i,$j)){
        $self->{win}->addstr($i+2,$j+1,"O");
      }
      else {
        $self->{win}->addstr($i+2,$j+1," ");
      }
      $j++;
    }
    $i++;
  }
  $self->{win}->refresh;
}
  
1;
