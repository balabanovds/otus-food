import 'package:test/test.dart';
import 'package:otus_food/features/recipe/adapter/dto/favorite.dart';

void main() {
  Map<String, dynamic> incoming = {
    'id': 111,
    'recipe': {'id': 222},
    'user': {'id': 333}
  };

  FavoriteDto want = FavoriteDto(111, 222, 333);

  test('Parsing FavoriteDto', () {
    var got = FavoriteDto.fromJson(incoming);
    expect(
      got.id,
      want.id,
    );

    expect(got.recipeID, want.recipeID);
  });
}
