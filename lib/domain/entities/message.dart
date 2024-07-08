enum FromWho { me, hers }

class Message {
  final String text;
  final FromWho fromWho;
  final String? imageUrl;

  Message({required this.text, required this.fromWho, this.imageUrl});
}
