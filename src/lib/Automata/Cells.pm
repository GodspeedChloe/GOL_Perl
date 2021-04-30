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
  my %new_cells = ();
  my %dead_cells = ();
  my $href = $self->{all};
  # rule 1+3 (process live cells): any cell with 2 or 3 live 
  #                                neighbors remains alive
  # rule 2: any dead cell with 3 living neighbors becomes alive
  for my $alive_cell (keys %$href) {
    my ($x_str, $y_str) = split /,/, $alive_cell;
    my $x = int($x_str);
    my $y = int($y_str); 
    my $count_alive = 0;
    for (my $i = ($x - 1); $i <= ($x + 1); $i++) {
      for (my $j = ($y - 1); $j <= ($y + 1); $j++) {
        if (exists $self->{all}->{$i.",".$j}) {
          if (($i != $x) || ($j != $y)) {
            $count_alive++;
          }
          next;
        }
        my $count_dead = 0;
        my @potential_neighbors = 
            (($i-1).",".($j-1),($i-1).",".($j),($i-1).",".($j+1),($i).",".($j-1),
            ($i).",".($j+1),($i+1).",".($j-1),($i+1).",".($j),($i+1).",".($j+1));
        foreach my $potential (@potential_neighbors) {
          if (exists $self->{all}->{$potential}) {
            $count_dead++;
          }
        }
        if ($count_dead == 3) {
          $new_cells{$i.",".$j} = "1";
        }
      }
    }
    if (($count_alive != 2) && ($count_alive != 3)) {
      $dead_cells{$x.",".$y} = "1";
    }
  }  
  # add the new cells,     
  for my $new_cell (keys %new_cells) {
    $self->{all}->{$new_cell} = "1";
  }
  # remove the dead cells
  for my $dead_cell (keys %dead_cells) {
    delete $self->{all}->{$dead_cell};
  }
  return 1;
}

sub isCellAlive {
  my ($self, $x, $y) = @_;
  return (exists $self->{all}->{$x.",".$y}) ? 1 : 0;
}

1;
