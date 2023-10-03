import 'package:otus_food/features/recipe/adapter/dto/comment.dart';
import 'package:otus_food/features/recipe/adapter/dto/user.dart';
import 'package:test/test.dart';

void main() {
  Map<String, dynamic> incoming = {
    'id': 111,
    'login': 'user',
    'password': 'pass',
    'token': '',
    'avatar': '',
    'comments': [
      {
        'id': 222,
        'text': 'some comment',
        'photo': '',
        'datetime': '2022-05-25T00:00:00.000Z',
        'user': {'id': 111},
        'recipe': {'id': 444}
      }
    ],
  };

  UserDto want = UserDto(111, 'user', 'pass', '', '', [], [],
      [CommentDto(222, 'some comment', '', DateTime.parse('2022-05-25T00:00:00.000Z'), 111, 444)]);
  test('Parsing UserDto', () {
    var got = UserDto.fromJson(incoming);

    expect(got.favorites, want.favorites);
    expect(got.comments.length, want.comments.length);
    expect(got.comments[0].datetime, want.comments[0].datetime);
  });
}
