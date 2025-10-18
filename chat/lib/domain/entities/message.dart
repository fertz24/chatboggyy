
//en esto se basa el mensaje
enum FromWho { me, hers } //los del mensaje

class Message {
  final String text; //por si el mensaje es un texto
  final String? imageUrl; //o una imagen
  final FromWho fromWho;

  Message({required this.text, this.imageUrl, required this.fromWho});
}