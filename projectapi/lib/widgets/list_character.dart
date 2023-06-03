import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectapi/data/api_caharacter.dart';
import 'package:projectapi/domain/character.dart';
import 'package:projectapi/widgets/card_character.dart';

final userProvider = Provider<ApiService>((ref) => ApiService());

final characterListProvider = FutureProvider<List<Character>>((ref) async {
  final List<Character> characters = [];
  final ApiService apiService = ref.read(userProvider);
  for (int i = 0; i < 3; i++) { 
    final List<Character> characterList = await apiService.fetchAllCharacters();
    characters.addAll(characterList);
  }
  return characters;
});


class ListCharacter extends ConsumerWidget {
  const ListCharacter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Character>> charactersDataList = ref.watch(characterListProvider);
    return charactersDataList.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
      data: (charactersDataList) {
        final Set<Character> uniqueCharacters = {};
        for (var character in charactersDataList) {
          uniqueCharacters.add(character);
        }

        final List<Character> characters = uniqueCharacters.toList();

        return GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
          ),
          shrinkWrap: true,
          children: [
            for (final person in characters) CardCharacter(character: person),
          ],
        );
      },
    );
  }
}
