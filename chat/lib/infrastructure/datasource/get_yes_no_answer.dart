
import 'package:chat/domain/entities/message.dart';
import 'package:chat/infrastructure/dto/yes_no_answer.dart';
import 'package:dio/dio.dart';

class GetYesNoAnswer {
    final _dio = Dio(BaseOptions(baseUrl: 'http://yesno.wtf'));

    Future<Message> getAnswer() async {
        final response = await _dio.get('/api');
        print(response.data);
        final YesNoAnswer yesNoAnswer = YesNoAnswer.fromJson(response.data); //aqui ya manipulamos los valores de la clase yes_no_answer
        return Message(
            text: yesNoAnswer.answer == 'Yes' ? 'Si' : 'No', 
            imageUrl: yesNoAnswer.image,
            fromWho: FromWho.hers
        );
    }
}