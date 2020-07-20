use v6;
use Red;
use App::Hootboxes::Schema;

my $*RED-DB = database "SQLite", :database<./hootboxes.db>;


Reward.^create-table;
Student.^create-table;
Claim.^create-table;
Hootbox.^create-table;
