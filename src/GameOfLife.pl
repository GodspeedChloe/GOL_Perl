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


my %starting_cells = (
  "20,27"=>"1",
  "20,28"=>"1",
  "20,29"=>"1",
  "21,28"=>"1",
  "19,29"=>"1"
);
my $ref_cells = \%starting_cells;
my $cells = new Automata::Cells($ref_cells);
my $board = new Board::TerminalBoard(40,55,0,new Curses, $cells);
# Use string description of coordinates, perl does not support array as key

do {
  sleep(1);
  $board->showBoard();
  $cells->applyRules();
  $board->increment();
} while $board->getIteration() < 500 && $cells->hasAlive();  
