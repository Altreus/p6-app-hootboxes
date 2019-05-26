unit package App::Hootboxes::Schema;
use App::Hootboxes::Schema::Hootbox;
use App::Hootboxes::Schema::Reward;
use App::Hootboxes::Schema::Student;
use App::Hootboxes::Schema::Claim;

sub deploy is export {
    Reward.^create-table;
    Student.^create-table;
    Claim.^create-table;
    Hootbox.^create-table;
}
