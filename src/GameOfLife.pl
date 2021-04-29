# Conway's game of life, but in Perl :)
#
# Written by Y.T. Chloe

use Curses;
use strict;
use warnings;
use diagnostics;

use feature "say";
use feature "switch";
use lib "lib";

use Board::TerminalBoard;
use Automata::Cells;


our %starting_cells = (
  "20,20"=>"1",
  "20,21"=>"1",
  "20,22"=>"1"
);
my $cells = new Automata::Cells(\%starting_cells, my %ds);
if ($cells->isCellAlive(20,21)){
  print("HOLY SMOKES");
}
else {
  print("OHNO");
}
my $board = new Board::TerminalBoard(50,50,0,new Curses, $cells);
# Use string description of coordinates, perl does not support array as key

do {
  sleep(1);
  $board->showBoard();
  $cells->applyRules();
  $board->increment();
} while $board->getIteration() < 500 && $cells->hasAlive();  
