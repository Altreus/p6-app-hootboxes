unit package App::Hootboxes::Resource::Hootbox;

use Cro::HTTP::Router;

sub routes($model) {
    route {
        get -> 'box', Int $box-id {
            my $box = $model.get-box(:id($box-id));
        }
    }
}
