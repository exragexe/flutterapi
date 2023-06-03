import 'package:flutter/material.dart';
import 'package:projectapi/domain/character.dart';
import 'package:google_fonts/google_fonts.dart';

class CardCharacter extends StatelessWidget {
  final Character character;
  const CardCharacter({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 300,
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 100, 190, 167), 
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              
              borderRadius: BorderRadius.circular(8.0), 
              child:Padding(
                padding: EdgeInsets.only(left: 20),
                 child:Image.network(
                character.image.toString(),
                fit: BoxFit.cover,
                width: 200,
                height: 350, 
                
              ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0), 
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      character.quote.toString(),
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: GoogleFonts.getFont("Shadows Into Light",
                        fontSize: 20,
                        fontWeight: FontWeight.bold, 
                      ),
                    ),
                    const SizedBox(height: 8), 
                    Text(
                      character.character.toString(),
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: GoogleFonts.getFont("Shadows Into Light",
                        fontSize: 18, 
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
